# AGENTS.md — Bootstrap

See **[AGENT_INSTRUCTIONS.md](AGENT_INSTRUCTIONS.md)** for complete instructions.

## Prime Protocol

On every session start, after compaction, or after context clear:

1. Run the repo's prime command: `make agent-prime` or `./scripts/agent-prime.sh`
2. If no prime command exists, read `AGENT_INSTRUCTIONS.md` and identify test/lint/build commands before editing code.
3. Re-prime after any compaction or context reset.

## Skill Router

After prime, classify your task and load the relevant skill(s):

- Architecture, testing, or security decisions → `engineering-standards`
- Adding or evaluating a dependency → `dependency-adding`
- Security-sensitive changes (auth, crypto, secrets) → `security-review`
- CI/CD pipeline failure → `ci-debugging`
- Writing a feature spec → `feature-spec`
- Air-gapped or disconnected deployment → `disconnected-environments`
- Architecture decision to record → `adr-writing`
- Debugging or recurring failure → `root-cause-analysis`
- MCP server integration → `mcp-integration`
- Whole-repo code health assessment → `code-health-review`
- Writing or editing AGENTS.md / CLAUDE.md → `context-file-authoring`
- Correction that applies to all projects → `upstream-contribution`

## Ask Before Proceeding

- Requirements are ambiguous.
- The change affects public APIs or security posture.
- A new production dependency is needed.
- The change requires broad refactors or file moves.
