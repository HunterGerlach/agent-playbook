---
name: review-clean-code
description: Assess code quality against Clean Code principles — naming, functions, comments, formatting, error handling, boundaries, and tests.
version: 1.0.0
tier: 0
license: MIT
---

# Clean Code Review

Evaluate a codebase against Clean Code (Robert C. Martin) principles. Focus on readability, maintainability, and craftsmanship at the code level.

## When to Trigger

- Standalone review of code-level quality.
- Orchestrated via `code-health-review` (Phase 3 deep dive).

## Scoring Summary

| Score | Meaning |
|---|---|
| 1 | Code is difficult to read, understand, or maintain — widespread issues |
| 2 | Significant readability and maintenance problems across many files |
| 3 | Generally readable with notable pockets of poor quality |
| 4 | Consistently clean with minor lapses — easy to improve |
| 5 | Exemplary readability and craftsmanship throughout |

Full rubric: `code-health-review/assets/scoring-rubric.md`

## Review Checklist

### Naming
- [ ] Names reveal intent (no `data`, `info`, `temp`, `x` for non-trivial vars)
- [ ] Names are pronounceable and searchable
- [ ] Class names are nouns; method names are verbs
- [ ] No encodings, prefixes, or type-in-name conventions (unless language idiom)

### Functions
- [ ] Functions are small (do one thing)
- [ ] Functions operate at a single level of abstraction
- [ ] Few arguments (ideally 0-2; 3+ needs justification)
- [ ] No side effects hidden from the caller

### Comments
- [ ] Code is self-documenting — comments explain *why*, not *what*
- [ ] No commented-out code (use version control)
- [ ] No redundant comments that restate the code
- [ ] TODO/FIXME comments have tracked issues

### Formatting
- [ ] Consistent formatting across the codebase (enforced by tooling)
- [ ] Vertical density groups related code; vertical distance separates concepts
- [ ] Files are not excessively long (context-dependent, but >500 lines warrants review)

### Error Handling
- [ ] Errors are handled, not swallowed silently
- [ ] Exceptions used for exceptional conditions, not control flow
- [ ] Error messages are informative and actionable
- [ ] No bare `catch` blocks or generic exception handlers without reason

### Boundaries
- [ ] Third-party APIs wrapped in adapter layers
- [ ] Boundary code is isolated and testable independently
- [ ] Learning tests exist for critical third-party dependencies

### Tests (FIRST Principles)
- [ ] **Fast** — tests run quickly
- [ ] **Independent** — tests don't depend on each other
- [ ] **Repeatable** — tests produce same results in any environment
- [ ] **Self-validating** — tests have boolean output (pass/fail)
- [ ] **Timely** — tests written at or before implementation time

## Scoring Guidance

Score each sub-area (naming, functions, comments, formatting, error handling, boundaries, tests) individually. The overall dimension score is the lowest sub-area score. Sample broadly — review files from different parts of the codebase, not just one module.

## Output

Produce a scorecard per `code-health-review/assets/scorecard-template.md`. On re-review, include delta scores.

## Related Skills

- `review-solid` — complementary code-level principles
- `review-tdd` — deeper assessment of test practices
- `engineering-standards` — testing and design thinking standards

## Quality Checks

- [ ] All 7 sub-areas assessed with evidence
- [ ] Examples drawn from multiple parts of the codebase
- [ ] Findings include file paths and line references
- [ ] Fixes are specific (not just "improve naming")
