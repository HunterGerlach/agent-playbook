---
name: upstream-contribution
description: Protocol for contributing universal corrections back to the shared agent-playbook. Load when an agent discovers a correction that applies to all projects, not just the current one.
version: 1.0.0
tier: 0
license: MIT
---

# Upstream Contribution

Load this skill when an agent working in a downstream project discovers a correction or improvement that applies universally to all projects using this playbook.

## When to Trigger

- Agent discovers a correction that applies to every project, not just the current one
- An existing playbook instruction is misleading or causes agent misbehavior
- A new skill addresses a common workflow gap across projects
- Research-backed changes to how context files or instructions are structured

## Upstream-Worthiness Criteria

A correction is upstream-worthy when it meets **all** of these:

1. **Universally applicable** — applies to every project using this playbook, regardless of language, framework, or domain.
2. **Evidence-based** — observed as a recurring pattern (not a one-off), or backed by research.
3. **Not already covered** — the playbook does not already address this.
4. **Actionable** — concrete guidance agents can follow, not abstract principles.

### Examples: Upstream-Worthy

- A new engineering principle that prevented the same class of bug across multiple projects
- A correction to an existing instruction that was misleading or caused agent misbehavior
- A new skill that addresses a common workflow gap
- An improvement to the prime script that surfaces useful context
- Research-backed changes to how context files or instructions are structured

### Examples: NOT Upstream-Worthy

- Project-specific tooling preferences (use pnpm, not npm)
- Language or framework conventions (React component patterns, Go error handling)
- Team-specific workflow preferences
- Fixes to project-specific infrastructure

## Agent Protocol

1. **Finish the current task first.** Do not interrupt project work to file upstream contributions.
2. **Document the finding.** Create a note (issue, bead, or file) in the downstream project capturing:
   - What the agent assumed and why it was wrong
   - What the correction is
   - Why it applies universally (not just to this project)
   - What evidence supports it (recurrence count, research, etc.)
3. **Ask the user before proceeding.** Upstream contributions modify a shared resource. Confirm the user agrees the correction is globally applicable.
4. **Submit the PR.** If the user agrees:
   - Branch from the playbook's `main`
   - Make the minimal change
   - Write a PR description explaining the problem, the evidence, and the fix
   - Reference the downstream context where the issue was discovered
5. **Continue project work.** Do not block on PR review.

## Routing Table

| Discovery | Destination |
|---|---|
| Project-specific correction | Project's own AGENTS.md |
| Language/framework convention | Project's own AGENTS.md or nested AGENTS.md |
| Universal engineering principle | Upstream playbook (AGENT_INSTRUCTIONS.md) |
| Universal operational protocol | Upstream playbook (AGENT_INSTRUCTIONS.md) |
| Reusable workflow pattern | Upstream playbook (new or existing skill) |
| Research-backed instruction improvement | Upstream playbook (relevant file) |

## The Feedback Loop

1. Projects adopt the playbook.
2. Agents encounter edge cases and corrections.
3. Project-specific corrections stay local; universal ones flow upstream.
4. The playbook improves.
5. All downstream projects benefit on their next sync.

This creates a virtuous cycle where the playbook evolves from empirical evidence rather than speculation — matching the "build from failures, not preemptively" principle.
