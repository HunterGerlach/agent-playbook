# agent-playbook

A universal, portable agent instruction set that codifies operational protocols and durable engineering principles for AI-assisted development. Drop it into any project to give AI agents consistent, high-quality guidance.

## Repo Structure

```
AGENTS.md                  # Bootstrap stub (prime protocol + skill router)
CLAUDE.md                  # Claude Code integration (@import directives)
AGENT_INSTRUCTIONS.md      # Operational core (operations + norms)
.claude/
  rules/
    00-skill-router.md     # Auto-loaded skill router for Claude Code
    01-no-ai-attribution.md # Suppress AI attribution in commits/code
skills/
  _POLICY.md               # Risk tier model and security rules for skills
  README.md                # Full skills catalog
  adr-writing/             # Tier 0: Architecture Decision Records
  ci-debugging/            # Tier 0: CI/CD pipeline debugging
  context-file-authoring/  # Tier 0: Research-backed AGENTS.md authoring guidance
  dependency-adding/       # Tier 0: Dependency evaluation workflow
  disconnected-environments/ # Tier 0: Air-gapped validation
  engineering-standards/   # Tier 0: Architecture, testing, delivery, security, design thinking
  feature-spec/            # Tier 0: Spec-driven development
  mcp-integration/         # Tier 0: MCP server integration planning
  root-cause-analysis/     # Tier 0: Root cause analysis (iterative "why?" technique)
  security-review/         # Tier 0: Security review checklist
  upstream-contribution/   # Tier 0: Protocol for contributing corrections upstream
modules/
  beads.md                 # Beads task tracking integration (default-on)
  gastown.md               # Gas Town multi-agent integration (default-on)
  mcp.md                   # MCP integration guidance (opt-in)
  agent-interop.md         # A2A/ACP protocol landscape (opt-in)
scripts/
  agent-prime.sh           # Template prime script (auto-detects build system)
  install-skills.sh        # Install skills into tool-specific directories
  validate-skills.sh       # Validate skill frontmatter and structure
  lint-context.sh          # Enforce instruction budget and content rules
```

## Quick Start

### Recommended layout

Keep only the bootstrap file at your project root. Everything else goes in a subdirectory (`.agent/` by convention) to avoid cluttering the repo:

```
your-project/
  AGENTS.md              # Bootstrap stub (required at root — tools scan for it)
  CLAUDE.md              # Claude Code integration (@import directives)
  .claude/
    rules/
      *.md               # Auto-loaded rules (Claude Code only)
  .agent/                # All playbook support files live here
    AGENT_INSTRUCTIONS.md
    modules/
    scripts/
    skills/
  src/                   # ← your code, undisturbed
  ...
```

### Setup

```bash
PLAYBOOK=/path/to/agent-playbook
PROJECT=~/your-project

# 1. Bootstrap file — must be at project root (tools scan for it)
#    Option A: symlink (stays in sync)
ln -s "$PLAYBOOK/AGENTS.md" "$PROJECT/AGENTS.md"
#    Option B: copy (independent snapshot)
cp "$PLAYBOOK/AGENTS.md" "$PROJECT/AGENTS.md"

# 2. Claude Code integration — @import file (not a symlink)
cp "$PLAYBOOK/CLAUDE.md" "$PROJECT/CLAUDE.md"

# 3. Claude Code rules (skill router, norms)
mkdir -p "$PROJECT/.claude/rules"
cp "$PLAYBOOK"/.claude/rules/*.md "$PROJECT/.claude/rules/"

# 4. Support files — keep in .agent/ subdirectory
mkdir -p "$PROJECT/.agent"
cp "$PLAYBOOK/AGENT_INSTRUCTIONS.md" "$PROJECT/.agent/"
cp -r "$PLAYBOOK/modules" "$PROJECT/.agent/"
cp -r "$PLAYBOOK/scripts" "$PROJECT/.agent/"
cp -r "$PLAYBOOK/skills"  "$PROJECT/.agent/"
```

Then update the path in your project's `AGENTS.md` bootstrap to point to `.agent/AGENT_INSTRUCTIONS.md` instead of `AGENT_INSTRUCTIONS.md`.

### Install skills into tool-specific directories

```bash
# Install for all supported tools (symlinks by default)
./scripts/install-skills.sh

# Install for a specific tool
./scripts/install-skills.sh --target claude

# Use copies instead of symlinks
./scripts/install-skills.sh --copy
```

## Staying Up to Date

The playbook evolves as we learn. Copies drift — use one of these strategies to stay current.

### Git submodule (recommended for teams)

Pins a specific commit and makes updates explicit via PR:

```bash
# Add once
git submodule add https://github.com/HunterGerlach/agent-playbook.git .agent/playbook

# Bootstrap from the submodule
ln -s .agent/playbook/AGENTS.md AGENTS.md
cp .agent/playbook/CLAUDE.md CLAUDE.md
mkdir -p .claude/rules
cp .agent/playbook/.claude/rules/*.md .claude/rules/
```

To pull the latest:

```bash
cd .agent/playbook && git pull origin main && cd -
git add .agent/playbook
git commit -m "Update agent-playbook to latest"
```

Team members get the update automatically on their next `git pull` + `git submodule update --init`.

### Local symlinks (solo / single-machine)

If you cloned agent-playbook alongside your projects, the symlink approach from Quick Start keeps files in sync with no manual steps. Good for solo work; doesn't travel with the repo.

### Periodic copy-refresh

If you prefer vendored copies (e.g., air-gapped environments), create a script or CI job to refresh:

```bash
# .agent/update-playbook.sh
#!/usr/bin/env bash
set -euo pipefail
PLAYBOOK="${1:?Usage: update-playbook.sh /path/to/agent-playbook}"
cp "$PLAYBOOK/AGENTS.md" "$(git rev-parse --show-toplevel)/AGENTS.md"
cp "$PLAYBOOK/CLAUDE.md" "$(git rev-parse --show-toplevel)/CLAUDE.md"
mkdir -p .claude/rules
cp "$PLAYBOOK"/.claude/rules/*.md .claude/rules/
cp "$PLAYBOOK/AGENT_INSTRUCTIONS.md" .agent/
cp -r "$PLAYBOOK/modules" .agent/
cp -r "$PLAYBOOK/scripts" .agent/
cp -r "$PLAYBOOK/skills"  .agent/
echo "Playbook updated from $PLAYBOOK at $(date -u +%Y-%m-%dT%H:%M:%SZ)"
```

Run it periodically or add a CI reminder to check for upstream changes.

### Which strategy to use?

| Situation | Strategy |
|---|---|
| Team repo, want controlled updates | **Git submodule** |
| Solo dev, playbook cloned locally | **Local symlinks** |
| Air-gapped / vendored / no submodules | **Periodic copy-refresh** |

## How It Works

- **AGENTS.md** is a slim bootstrap stub. Tools that scan for `AGENTS.md` get the critical minimum: prime protocol, skill router, and a pointer to the full instructions.
- **CLAUDE.md** uses `@import` syntax to load both AGENTS.md and AGENT_INSTRUCTIONS.md into Claude Code.
- **AGENT_INSTRUCTIONS.md** contains the operational core: prime protocol, task workflow, non-interactive safety, session completion, and norms (~80 lines).
- **Skills** provide progressive disclosure: engineering standards, context file authoring, upstream contribution protocol, and specialized workflows are loaded on demand when relevant. The Skill Router in AGENTS.md maps tasks to skills.

### Instruction Budget

The playbook is designed to stay within the ~150-200 reliable instruction-following range (ETH Zurich study, arXiv:2602.11988):

| Component | Instructions |
|---|---|
| System prompt | ~50 |
| AGENTS.md (bootstrap + router) | ~14 |
| AGENT_INSTRUCTIONS.md (operational core) | ~50 |
| **Always-on total** | **~114** |
| **Headroom for project-level rules** | **+36 to +86** |

## Skills

Skills are on-demand runbooks with progressive disclosure — agents see metadata up front and load full instructions only when relevant. All skills follow the risk tier model in [`skills/_POLICY.md`](skills/_POLICY.md).

See [`skills/README.md`](skills/README.md) for the full catalog with descriptions. To create a new skill, follow the design rules and required frontmatter in [`skills/_POLICY.md`](skills/_POLICY.md) and use any existing skill as a template.

## Further Reading

- [`AGENTS.md`](AGENTS.md) — Bootstrap stub (what agents see first)
- [`AGENT_INSTRUCTIONS.md`](AGENT_INSTRUCTIONS.md) — Operational core (task workflow, safety, norms)
- [`skills/README.md`](skills/README.md) — Full skills catalog (11 skills)
- [`skills/_POLICY.md`](skills/_POLICY.md) — Skill risk tiers and security rules
- [`modules/`](modules/) — Tool integrations (Beads, Gas Town, MCP, agent interop)
- [`.claude/rules/`](.claude/rules/) — Claude Code auto-loaded rules
