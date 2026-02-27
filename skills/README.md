# Skills Catalog

Canonical skill definitions for AI-assisted development workflows. These skills are tool-agnostic and can be installed into Claude Code, Codex, GitHub Copilot, or any tool that supports the Agent Skills specification.

## Available Skills

| Skill | Tier | Description |
|---|---|---|
| `adr-writing` | 0 | Write Architecture Decision Records for significant architectural choices |
| `ci-debugging` | 0 | Systematically debug CI/CD pipeline failures |
| `context-file-authoring` | 0 | Research-backed guidance for writing effective AGENTS.md and CLAUDE.md files |
| `dependency-adding` | 0 | Evaluate and add dependencies with supply-chain security and compliance checks |
| `disconnected-environments` | 0 | Verify solutions work in air-gapped or network-restricted environments |
| `engineering-standards` | 0 | Non-discoverable engineering standards for architecture, testing, delivery, security, and design thinking |
| `feature-spec` | 0 | Create or update a feature spec as the canonical source of acceptance criteria and test plan |
| `mcp-integration` | 0 | Plan MCP server integration when tool or data access needs exceed local CLIs |
| `root-cause-analysis` | 0 | Perform root cause analysis using the iterative "why?" technique |
| `security-review` | 0 | Security review checklist for changes touching auth, crypto, or external interfaces |
| `upstream-contribution` | 0 | Protocol for contributing universal corrections back to the shared playbook |

## Installation

```bash
# Install into tool-specific directories (defaults to symlinks)
./scripts/install-skills.sh

# Use copies instead of symlinks
./scripts/install-skills.sh --copy

# Install for a specific tool only
./scripts/install-skills.sh --target claude
```

See [`_POLICY.md`](_POLICY.md) for the risk tier model and security rules.
