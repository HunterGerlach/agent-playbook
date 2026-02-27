#!/usr/bin/env bash
# lint-context.sh — Enforce instruction budget and content rules
#
# Usage:
#   ./scripts/lint-context.sh
#
# Checks:
#   - No tool names in AGENTS.md or AGENT_INSTRUCTIONS.md
#   - Skill Router stays under 20 lines
#   - AGENTS.md stays under 40 lines
#   - AGENT_INSTRUCTIONS.md stays under 120 lines

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
ERRORS=0

# -- Tool name banlist --
# These tool names should not appear in always-on context files.
# Generic terms (gh, make) are excluded from the banlist since they are
# standard commands, not proprietary agent tools.
BANLIST='(Beads|Gas Town|\bbd\b|\bgt\b|GT_ROLE)'

for file in "$REPO_ROOT/AGENTS.md" "$REPO_ROOT/AGENT_INSTRUCTIONS.md"; do
  if [[ ! -f "$file" ]]; then
    echo "WARNING: $file not found, skipping"
    continue
  fi
  basename="$(basename "$file")"
  matches=$(grep -nE "$BANLIST" "$file" 2>/dev/null || true)
  if [[ -n "$matches" ]]; then
    echo "FAIL: $basename contains tool-specific names:"
    echo "$matches" | sed 's/^/  /'
    ERRORS=$((ERRORS + 1))
  fi
done

# -- Skill Router line count --
if [[ -f "$REPO_ROOT/AGENTS.md" ]]; then
  # Extract lines between "## Skill Router" and the next "##" heading (or EOF)
  router_lines=$(awk '/^## Skill Router/{found=1; next} /^## /{if(found) exit} found{print}' "$REPO_ROOT/AGENTS.md" | grep -c '.' || echo "0")
  if [[ "$router_lines" -gt 20 ]]; then
    echo "FAIL: Skill Router is $router_lines non-blank lines (max 20)"
    ERRORS=$((ERRORS + 1))
  else
    echo "OK: Skill Router is $router_lines non-blank lines (max 20)"
  fi
fi

# -- File size limits --
check_line_count() {
  local file="$1"
  local max="$2"
  local basename
  basename="$(basename "$file")"
  if [[ ! -f "$file" ]]; then
    echo "WARNING: $file not found, skipping"
    return
  fi
  local count
  count=$(wc -l < "$file" | tr -d ' ')
  if [[ "$count" -gt "$max" ]]; then
    echo "FAIL: $basename is $count lines (max $max)"
    ERRORS=$((ERRORS + 1))
  else
    echo "OK: $basename is $count lines (max $max)"
  fi
}

check_line_count "$REPO_ROOT/AGENTS.md" 40
check_line_count "$REPO_ROOT/AGENT_INSTRUCTIONS.md" 120

# -- Summary --
echo ""
if [[ $ERRORS -gt 0 ]]; then
  echo "FAILED: $ERRORS error(s) found"
  exit 1
else
  echo "PASSED: All context lint checks passed"
  exit 0
fi
