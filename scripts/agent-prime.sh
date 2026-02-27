#!/usr/bin/env bash
# agent-prime.sh — Template prime script for projects
#
# Copy this into your project and customize as needed.
# Run at the start of every agent session: ./scripts/agent-prime.sh

set -euo pipefail

echo "=== Agent Prime ==="
echo ""

# -- Repo identity --
echo "Project: $(basename "$(git rev-parse --show-toplevel 2>/dev/null || pwd)")"
echo "Branch:  $(git branch --show-current 2>/dev/null || echo 'unknown')"
echo ""

# -- Build system auto-detection --
echo "Commands:"
if [[ -f "Makefile" ]] || [[ -f "makefile" ]] || [[ -f "GNUmakefile" ]]; then
  echo "  Build system: Make"
  grep -E '^[a-zA-Z_-]+:' Makefile 2>/dev/null | head -10 | sed 's/:.*//' | while read -r target; do
    echo "    make $target"
  done
elif [[ -f "package.json" ]]; then
  echo "  Build system: npm/node"
  echo "  Test:  npm test"
  echo "  Lint:  npm run lint"
  echo "  Build: npm run build"
elif [[ -f "pyproject.toml" ]] || [[ -f "setup.py" ]]; then
  echo "  Build system: Python"
  echo "  Test:  pytest"
  echo "  Lint:  ruff check . || flake8"
elif [[ -f "go.mod" ]]; then
  echo "  Build system: Go"
  echo "  Test:  go test ./..."
  echo "  Build: go build ./..."
elif [[ -f "Cargo.toml" ]]; then
  echo "  Build system: Cargo (Rust)"
  echo "  Test:  cargo test"
  echo "  Build: cargo build"
elif [[ -f "build.gradle" ]] || [[ -f "build.gradle.kts" ]]; then
  echo "  Build system: Gradle"
  echo "  Test:  ./gradlew test"
  echo "  Build: ./gradlew build"
elif [[ -f "pom.xml" ]]; then
  echo "  Build system: Maven"
  echo "  Test:  mvn test"
  echo "  Build: mvn package"
else
  echo "  Build system: not detected — check README for commands"
fi
echo ""

# -- Task ledger --
if command -v gh &>/dev/null; then
  echo "Task ledger: GitHub Issues (gh issue list)"
else
  echo "Task ledger: Check TODO files or README"
fi
echo ""

# -- Skills available --
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$SCRIPT_DIR/../skills"
if [[ -d "$SKILLS_DIR" ]]; then
  skill_count=$(find "$SKILLS_DIR" -maxdepth 1 -mindepth 1 -type d | wc -l | tr -d ' ')
  echo "Skills: $skill_count available (see AGENTS.md Skill Router)"
fi

# -- MCP availability --
if [[ -f ".agent/capabilities.yml" ]] && grep -q "mcp" ".agent/capabilities.yml" 2>/dev/null; then
  echo "MCP: configured (see .agent/capabilities.yml)"
fi
echo ""

echo "Constraints:"
echo "  - See AGENT_INSTRUCTIONS.md for complete standards"
echo "  - Load engineering-standards skill for architecture/testing/security guidance"
echo ""

echo "=== Prime Complete ==="
