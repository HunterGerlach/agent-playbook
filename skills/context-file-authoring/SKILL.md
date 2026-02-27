---
name: context-file-authoring
description: Research-backed guidance for writing effective AGENTS.md, CLAUDE.md, and equivalent agent context files. Load when creating or editing context files.
version: 1.0.0
tier: 0
license: MIT
---

# Context File Authoring

Load this skill when creating or editing AGENTS.md, CLAUDE.md, or equivalent context files. Distills findings from the ETH Zurich / LogicStar.ai study (arXiv:2602.11988, Feb 2026) and practitioner experience.

## When to Trigger

- Creating a new AGENTS.md or CLAUDE.md for a project
- Editing or reviewing an existing context file
- Evaluating whether to add an instruction to a context file
- Auditing context file size or quality

## The Core Finding

LLM-generated context files **reduce** task success rates by ~3% and increase inference cost by 20%+. Developer-written files improve success by ~4% — but only when they contain knowledge agents cannot discover on their own.

## Why Less Is More

- Agents are **too compliant** with context file instructions. Every instruction is treated as a constraint, increasing exploration, token usage, and busywork without improving outcomes.
- Mentioning tools causes overuse — references to specific tools bias agents toward those tools even when inappropriate.
- Negative instructions backfire — "don't use X" primes agents to use X (attention/priming effect). Use positive framing or mechanical enforcement instead.
- The instruction budget is finite. Frontier models follow ~150-200 instructions reliably. The agent's system prompt already consumes ~50. Every line competes for the remainder.
- Bad instructions cascade through planning into many bad lines of code.

## The Inclusion Filter

Add content only if it passes **all four** criteria:

1. **Not discoverable** — The agent cannot learn this from README, package.json, existing code, or tooling output.
2. **Actionable** — It specifies a concrete task or constraint, not an abstract principle.
3. **Prevents silent failure** — Getting this wrong causes hard-to-debug issues, not just style violations.
4. **Broadly applicable** — Relevant to most tasks in this project, not just a single workflow.

## What to Include

- Package manager preference when multiple are plausible (pnpm, not npm)
- Specific test runner and commands (vitest, not jest)
- Required pre-commit steps (lint, format)
- Non-standard tooling or scripts agents would not guess
- Deprecation warnings for code that still exists but should not be extended
- Environment-specific gotchas that cause silent failures

## What to Exclude

- **Codebase overviews and directory structure** — agents discover these by listing files
- **Tech stack descriptions** — visible in package.json, pyproject.toml, go.mod, etc.
- **Code style rules** — use linters and formatters, not instructions
- **Architecture descriptions** — agents read actual code
- **Generic quality statements** — "write clean code" wastes instruction budget
- **Auto-generated content** — agents generating their own instructions produce files that make them perform worse

## Build From Failures, Not Preemptively

1. **Start empty.** Let the agent work without a context file.
2. **Track recurring mistakes.** One-off errors are noise. Patterns are signal.
3. **Add a minimal, positive-framed rule** when a pattern emerges.
4. **Verify the rule works.** Revert agent changes, add the rule, rerun the task. Keep only rules that demonstrably improve outcomes.
5. **Prune stale rules.** Stale instructions actively degrade performance (context file rot).

## Enforce Mechanically, Not Instructionally

| Instead of instruction... | Use... |
|---|---|
| "Format with prettier before committing" | Pre-commit hook that runs prettier |
| "Use single quotes in TypeScript" | Linter config (eslint, biome) |
| "Run tests before pushing" | CI pipeline or pre-push hook |
| "Don't import from legacy/" | Custom lint rule or import boundary check |

Deterministic enforcement beats probabilistic instruction-following every time.

## Progressive Disclosure

Keep the root AGENTS.md lean. Use directory-level or topic-specific files for detail. Reference detail files from the root — agents load what they need for the current task.

## The Correction Loop

When an agent assumes wrong and the correction reveals non-obvious knowledge:

1. **Capture the misconception** — not just the fix, but what the agent assumed and why it was wrong.
2. **Evaluate scope** — is this project-specific, or would every project hit this?
3. **If project-specific and recurring** — add a positive-framed rule to the project AGENTS.md.
4. **If globally applicable** — submit the correction upstream to the shared playbook (use the `upstream-contribution` skill).
5. **If the root cause is fixable** — fix it (add a lint rule, rename confusing code, update docs at the source) and skip the AGENTS.md entry. The best context file entry is the one you delete because you fixed the underlying problem.

## Self-Awareness

Models improve at codebase navigation over time. Instructions essential six months ago may become redundant. Expect context files to **shrink** as models improve. Review periodically and remove what agents now handle independently.
