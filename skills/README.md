# Skills Catalog

Canonical skill definitions for AI-assisted development workflows. These skills are tool-agnostic and can be installed into Claude Code, Codex, GitHub Copilot, or any tool that supports the Agent Skills specification.

## Available Skills

| Skill | Tier | Description |
|---|---|---|
| `adr-writing` | 0 | Write Architecture Decision Records for significant architectural choices |
| `ci-debugging` | 0 | Systematically debug CI/CD pipeline failures |
| `code-health-review` | 0 | Whole-repo code health assessment across 12 dimensions with prioritized deep dives |
| `context-file-authoring` | 0 | Research-backed guidance for writing effective AGENTS.md and CLAUDE.md files |
| `dependency-adding` | 0 | Evaluate and add dependencies with supply-chain security and compliance checks |
| `disconnected-environments` | 0 | Verify solutions work in air-gapped or network-restricted environments |
| `engineering-standards` | 0 | Non-discoverable engineering standards for architecture, testing, delivery, security, and design thinking |
| `feature-spec` | 0 | Create or update a feature spec as the canonical source of acceptance criteria and test plan |
| `mcp-integration` | 0 | Plan MCP server integration when tool or data access needs exceed local CLIs |
| `review-12factor` | 0 | Assess codebase against the Twelve-Factor App methodology |
| `review-clean-architecture` | 0 | Assess dependency direction, domain isolation, and boundary discipline |
| `review-clean-code` | 0 | Assess code quality — naming, functions, comments, formatting, error handling |
| `review-continuous-delivery` | 0 | Assess CI/CD pipeline maturity and deployment automation |
| `review-design-patterns` | 0 | Assess appropriate use of design patterns and identify anti-patterns |
| `review-integration-patterns` | 0 | Assess messaging, routing, transformation, and integration error handling |
| `review-performance` | 0 | Assess algorithmic complexity, resource efficiency, I/O patterns, caching, and measurement |
| `review-security-posture` | 0 | Assess whole-repo security posture — dependencies, secrets, supply chain |
| `review-solid` | 0 | Assess adherence to SOLID principles |
| `review-tdd` | 0 | Assess test-driven development practices and discipline |
| `review-test-pyramid` | 0 | Assess test structure ratios and identify pyramid anti-patterns |
| `review-ui-ux` | 0 | Assess user experience — simplicity, anticipatory design, consistency, responsiveness, feedback, CLI/API DX |
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
