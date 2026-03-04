---
name: review-test-pyramid
description: Assess test structure against the test pyramid — unit, integration, E2E ratios, and common anti-patterns like the ice cream cone.
version: 1.0.0
tier: 0
license: MIT
---

# Test Pyramid Review

Evaluate a codebase's test structure against the test pyramid model (Mike Cohn). Assess the ratio and quality of unit, integration, and end-to-end tests, and identify structural anti-patterns.

## When to Trigger

- Standalone review of test structure and ratios.
- Orchestrated via `code-health-review` (Phase 3 deep dive).

## Scoring Summary

| Score | Meaning |
|---|---|
| 1 | No tests, or inverted pyramid (all E2E, no unit) |
| 2 | Tests exist but pyramid is badly shaped — slow, brittle, expensive |
| 3 | Reasonable structure with some layer imbalance |
| 4 | Healthy pyramid — fast unit base, appropriate integration/E2E layers |
| 5 | Exemplary — well-proportioned, fast, reliable, comprehensive |

Full rubric: `code-health-review/assets/scoring-rubric.md`

## Review Checklist

### Unit Tests
- [ ] Unit tests form the largest test layer
- [ ] Unit tests are fast (milliseconds each), isolated, and deterministic
- [ ] Business logic is tested at the unit level (not only via integration)
- [ ] Mocking/stubbing used appropriately (not excessively)

### Integration Tests
- [ ] Integration tests verify component interactions (DB, API, services)
- [ ] Integration tests use realistic configurations (not entirely mocked)
- [ ] Integration tests are isolated from each other (no shared state)
- [ ] Integration test count is moderate (more than E2E, fewer than unit)

### E2E Tests
- [ ] E2E tests cover critical user journeys only (happy paths, key flows)
- [ ] E2E test count is small (< 20% of total, ideally < 10%)
- [ ] E2E tests are reliable (no flaky tests in CI)
- [ ] E2E tests have reasonable timeouts and retry strategies

### Ratio Health
- [ ] Pyramid shape: unit >> integration >> E2E
- [ ] Total test suite runs in reasonable time for CI (< 30 min target)
- [ ] Test layers are independently runnable
- [ ] Coverage is complementary (each layer tests what it's best at)

### Anti-Patterns
- [ ] No ice cream cone (more E2E than unit)
- [ ] No hourglass (unit + E2E but missing integration)
- [ ] No testing trophy inversion (excessive integration, few unit)
- [ ] No flaky tests tolerated without quarantine

## Scoring Guidance

Score each sub-area individually. The overall dimension score is the lowest sub-area score. Count tests per layer and compute ratios as evidence. A healthy pyramid for most projects: ~70% unit, ~20% integration, ~10% E2E (ratios are guidelines, not rules).

## Output

Produce a scorecard per `code-health-review/assets/scorecard-template.md`. On re-review, include delta scores.

## Related Skills

- `review-tdd` — complements with test quality and test-first assessment
- `review-continuous-delivery` — test structure directly affects pipeline speed
- `review-clean-code` — FIRST test principles

## Quality Checks

- [ ] All 5 sub-areas assessed with evidence
- [ ] Test counts per layer documented
- [ ] Pyramid ratio calculated and compared to target
- [ ] Anti-patterns identified with specific examples
