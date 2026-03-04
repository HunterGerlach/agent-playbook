---
name: review-tdd
description: Assess test-driven development practices — test-first evidence, test quality, refactoring discipline, coverage, and test speed.
version: 1.0.0
tier: 0
license: MIT
---

# TDD Review

Evaluate a codebase for evidence of Test-Driven Development practices. Assesses whether tests drive design (not just verify after the fact) and whether the Red-Green-Refactor cycle is followed.

## When to Trigger

- Standalone review of TDD practices.
- Orchestrated via `code-health-review` (Phase 3 deep dive).

## Scoring Summary

| Score | Meaning |
|---|---|
| 1 | No tests, or tests clearly written after the fact with no design influence |
| 2 | Tests exist but are brittle, coupled to implementation, or sparse |
| 3 | Reasonable test coverage but little evidence of test-first practice |
| 4 | Good TDD discipline — tests guide design with minor gaps |
| 5 | Exemplary — tests clearly drive design, refactoring is disciplined |

Full rubric: `code-health-review/assets/scoring-rubric.md`

## Review Checklist

### Test-First Evidence
- [ ] Tests exist for all non-trivial behavior
- [ ] Test names describe behavior, not implementation ("should calculate total" not "test method X")
- [ ] Commit history shows test-before-implementation pattern (where visible)
- [ ] Tests define the contract — implementation satisfies it

### Test Quality
- [ ] Tests are readable and serve as documentation
- [ ] Each test verifies one behavior (single assertion or closely related group)
- [ ] Tests use meaningful assertions (not just "no exception thrown")
- [ ] Test data is clear and minimal (no excessive setup)

### Refactoring Discipline
- [ ] Refactoring steps are visible (clean code after green, not before)
- [ ] Tests survive refactoring without modification (testing behavior, not structure)
- [ ] Duplication in tests is managed (shared setup, builders, fixtures)

### Coverage
- [ ] High coverage of business logic and edge cases
- [ ] Coverage gaps are intentional and justified (trivial code, framework boilerplate)
- [ ] No dead code hidden by missing tests
- [ ] Negative cases and error paths tested

### Test Speed
- [ ] Unit tests complete in seconds (< 30s for suite)
- [ ] Slow tests are separated and can run independently
- [ ] No unnecessary I/O, network, or sleep calls in unit tests
- [ ] Test parallelization enabled where supported

## Scoring Guidance

Score each sub-area individually. The overall dimension score is the lowest sub-area score. Distinguish "tests exist but weren't TDD" (score 2-3) from "tests drive design" (score 4-5) — the differentiator is whether tests shape the code's API and structure.

## Output

Produce a scorecard per `code-health-review/assets/scorecard-template.md`. On re-review, include delta scores.

## Related Skills

- `review-test-pyramid` — complements TDD with test structure/ratio assessment
- `review-clean-code` — FIRST test principles overlap
- `engineering-standards` — Red-Green-Refactor as primary methodology

## Quality Checks

- [ ] All 5 sub-areas assessed with evidence
- [ ] Test file paths and example test names referenced
- [ ] Coverage data cited if available
- [ ] Fixes distinguish "add tests" from "improve TDD practice"
