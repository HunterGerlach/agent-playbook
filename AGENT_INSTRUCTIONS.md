# Agent Instructions — Universal Engineering Defaults

This file is a **shared baseline**, not a project-specific context file. It contains portable operational protocols that apply to any project. Project-specific rules live in the repo's own `AGENTS.md`, `AGENTS.override.md`, or nested `AGENTS.md` per subdirectory.

If a project rule conflicts with this file, **project rules win**.

Engineering standards (architecture, testing, delivery, security, versioning, design thinking) are in the `engineering-standards` skill — loaded on demand when starting non-trivial implementation.

---

## Prime Protocol

On every session start, after compaction, or after context clear:

1. Run the repo's prime command: `make agent-prime` or `./scripts/agent-prime.sh`
2. If no prime command exists, read this file and any project-level agent instructions. Identify the canonical test, lint, and build commands before editing code.
3. Re-prime after any compaction, context clear, or new session.

## Operating Protocol

Follow this workflow on every task:

1. **Restate the problem** in 1-3 sentences.
2. **Write a user story**: "As a [role], I want [capability], so that [benefit]."
3. **Create or update a feature spec** (`specs/<slug>.md`) for non-trivial changes with acceptance criteria (Given/When/Then). For trivial changes, inline acceptance criteria are sufficient.
4. **Plan the smallest viable change.** Prefer minimal diffs. If a change touches many files, explain why.
5. **Implement** using Red-Green-Refactor.
6. **Verify**: run fast checks first (unit tests, lint), then broader checks as needed. Fix failures before delivering.
7. **Deliver**: summarize what changed, why, and how it was validated. Note follow-ups explicitly.

### Definition of Done

- [ ] Rigor is proportional — throwaway scripts need less than core domain logic
- [ ] Spec created or updated (if non-trivial); acceptance criteria written
- [ ] Tests added or updated
- [ ] All tests pass — not just new tests; verify previously passing tests still pass
- [ ] Security implications considered
- [ ] ADR added if architecture changed
- [ ] Docs updated if behavior changed

## Non-Interactive Safety

Use non-interactive mode for all commands. Agents must never hang waiting for input:

- Do not open editors or pagers (`$EDITOR`, `less`, `more`, `vi`, `nano`).
- Use non-interactive flags: `cp -f`, `mv -f`, `rm -rf`, `apt-get -y`.
- Use batch mode for remote operations: `ssh -o BatchMode=yes`, `scp -o BatchMode=yes`.
- Suppress auto-update prompts: `HOMEBREW_NO_AUTO_UPDATE=1`.
- Assume shell aliases may add `-i` (interactive). Always use explicit flags.
- Use `gh` CLI for GitHub operations.
- If a command might prompt for input, find the non-interactive alternative or skip it and explain why.

## Session Completion

Before ending any session:

1. **File follow-ups**: create issues or tasks for discovered/remaining work.
2. **Run quality gates**: test, lint, build (if code changed). All must pass.
3. **Update task status**: close completed items, note in-progress state.
4. **Commit** all changes with meaningful messages (imperative mood, explains *why*).
5. **Push** if you have write access. If push fails, resolve and retry. If no write access: commit locally, produce a patch/diff with apply instructions.
6. **Verify** clean state: `git status` shows no uncommitted changes.
7. **Summarize**: what was done, what remains, where the next session should pick up.

## Ask Before Proceeding

- Requirements are ambiguous.
- The change affects public APIs or security posture.
- A new production dependency is needed.
- The change requires broad refactors or file moves.

## Norms

- **Prefer existing capabilities.** Exhaust built-in capabilities and existing skills before reaching for external tools. Every external call is latency, risk, and a potential point of failure.
- **AI agents are tools, not authors.** All output should read as if a human wrote it. No AI attribution in code, commits, PRs, or documentation by default.
- **Match model capability to task complexity.** Use more capable models for planning, architecture, security, and code review. Use smaller, faster models for routine implementation, simple edits, and exploration.
- **Prefer idempotent actions.** Commands, API calls, and infrastructure changes should be safe to re-run. Use create-or-update over create, upserts over inserts, and `--force` or `--if-not-exists` equivalents where available. Assume any action may be retried.
- **CLI-first.** Use existing repo CLIs directly. Lowest surface area, easiest to audit.
- **Write context files from observed failures, not preemptively.** Use the `context-file-authoring` skill for guidance.
- **Contribute universal corrections upstream.** Use the `upstream-contribution` skill when a correction applies to every project.

## Project-Level Customization

This file captures **universal, portable** engineering principles. For project-specific instructions, use the repo's own `AGENTS.md`, `AGENTS.override.md`, or nested `AGENTS.md` files in subdirectories. Project-level instructions extend and may override these defaults.
