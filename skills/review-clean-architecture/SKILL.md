---
name: review-clean-architecture
description: Assess a codebase against Clean Architecture principles — dependency direction, domain isolation, and boundary discipline.
version: 1.0.0
tier: 0
license: MIT
---

# Clean Architecture Review

Evaluate a codebase against Clean Architecture (Robert C. Martin) and hexagonal/ports-and-adapters principles. Focus on dependency direction, domain isolation, and boundary crossing discipline.

## When to Trigger

- Standalone review of architectural layering and boundaries.
- Orchestrated via `code-health-review` (Phase 3 deep dive).

## Scoring Summary

| Score | Meaning |
|---|---|
| 1 | No discernible architecture — domain mixed with infrastructure everywhere |
| 2 | Some structure exists but dependency violations are widespread |
| 3 | Layers are present but boundaries leak — some violations tolerated |
| 4 | Clean separation with minor boundary crossings — easy to fix |
| 5 | Exemplary — domain is fully isolated, dependencies point inward |

Full rubric: `code-health-review/assets/scoring-rubric.md`

## Review Checklist

### Dependency Direction
- [ ] Dependencies point inward (outer layers depend on inner, never reverse)
- [ ] Domain/core has zero imports from infrastructure, UI, or framework packages
- [ ] No circular dependencies between layers

### Domain Isolation
- [ ] Business logic is framework-agnostic (testable without HTTP, DB, etc.)
- [ ] Domain entities contain no persistence annotations or framework decorators
- [ ] Domain logic does not depend on DTOs, view models, or API contracts

### Ports (Interfaces)
- [ ] Domain defines interfaces (ports) for external interactions
- [ ] Port contracts are expressed in domain language, not infrastructure terms
- [ ] Ports are minimal — no leaking of implementation details

### Adapters
- [ ] Infrastructure code implements domain-defined ports
- [ ] Adapters are swappable without changing domain code
- [ ] No domain logic in adapters (translation only)

### Use Cases
- [ ] Application use cases orchestrate domain logic, not implement it
- [ ] Use cases are thin — delegate to domain entities for rules
- [ ] One use case per business operation (no god services)

### Boundary Crossing
- [ ] Data crosses boundaries via DTOs or simple data structures, not entities
- [ ] Mapping between layers is explicit (no implicit ORM entity leakage)
- [ ] Dependency injection wires outer to inner at composition root

## Scoring Guidance

Score each sub-area individually. The overall dimension score is the lowest sub-area score. For codebases that intentionally use a simpler architecture (e.g., scripts, small CLIs), note this and adjust expectations — but still score what exists.

## Output

Produce a scorecard per `code-health-review/assets/scorecard-template.md`. On re-review, include delta scores.

## Related Skills

- `engineering-standards` — defaults to hexagonal/ports-and-adapters
- `review-solid` — dependency inversion principle directly supports clean architecture
- `review-design-patterns` — patterns often implement adapter/port boundaries

## Quality Checks

- [ ] All 6 sub-areas assessed with evidence
- [ ] Dependency direction violations include import paths
- [ ] Findings reference specific files and layers
- [ ] Fixes are actionable with clear refactoring steps
