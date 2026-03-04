---
name: review-solid
description: Assess a codebase against SOLID principles — Single Responsibility, Open/Closed, Liskov Substitution, Interface Segregation, Dependency Inversion.
version: 1.0.0
tier: 0
license: MIT
---

# SOLID Review

Evaluate a codebase against the SOLID principles of object-oriented design. Applicable to any codebase with modules, classes, or components — not limited to OOP languages.

## When to Trigger

- Standalone review of design principles adherence.
- Orchestrated via `code-health-review` (Phase 3 deep dive).

## Scoring Summary

| Score | Meaning |
|---|---|
| 1 | Widespread violations — god classes, tight coupling, rigid design |
| 2 | Significant issues — some principles understood but inconsistently applied |
| 3 | Adequate — most code follows SOLID but notable violations exist |
| 4 | Good — consistent adherence with minor violations, easy to fix |
| 5 | Excellent — principled design throughout, changes are low-risk |

Full rubric: `code-health-review/assets/scoring-rubric.md`

## Review Checklist

### S — Single Responsibility
- [ ] Each class/module has one reason to change
- [ ] No god classes or modules (files doing unrelated things)
- [ ] Responsibilities are cohesive within each unit
- [ ] Changes to one feature don't cascade across unrelated modules

### O — Open/Closed
- [ ] Modules are open for extension, closed for modification
- [ ] New behavior added via new code, not editing existing code
- [ ] Strategy/plugin patterns used where behavior varies

### L — Liskov Substitution
- [ ] Subtypes are substitutable for their base types without surprises
- [ ] Overridden methods don't strengthen preconditions or weaken postconditions
- [ ] No type-checking or instanceof guards to handle subtypes differently

### I — Interface Segregation
- [ ] Interfaces are small and focused (clients don't depend on methods they don't use)
- [ ] No "fat" interfaces forcing implementers to stub unused methods
- [ ] Role-specific interfaces preferred over general-purpose ones

### D — Dependency Inversion
- [ ] High-level modules don't depend on low-level modules (both depend on abstractions)
- [ ] Abstractions don't depend on details (details depend on abstractions)
- [ ] Dependencies injected rather than instantiated internally
- [ ] Composition root or DI container wires dependencies

## Scoring Guidance

Score each principle (S, O, L, I, D) individually. The overall dimension score is the lowest individual score. For languages without classes (e.g., functional), adapt the principles: S applies to modules/functions, D applies to module dependencies, etc.

## Output

Produce a scorecard per `code-health-review/assets/scorecard-template.md`. On re-review, include delta scores.

## Related Skills

- `review-clean-architecture` — dependency inversion is foundational to clean architecture
- `review-clean-code` — code-level quality complements design-level principles
- `review-design-patterns` — patterns often implement SOLID principles

## Quality Checks

- [ ] All 5 principles assessed with evidence
- [ ] God classes / fat interfaces identified by name
- [ ] Dependency direction violations include import paths
- [ ] Fixes include specific refactoring steps
