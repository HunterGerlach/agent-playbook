---
name: review-design-patterns
description: Assess appropriate use of design patterns — creational, structural, behavioral — and identify anti-patterns.
version: 1.0.0
tier: 0
license: MIT
---

# Design Patterns Review

Evaluate a codebase for appropriate use of design patterns (Gang of Four and beyond) and presence of anti-patterns. The goal is not maximum pattern usage — it is *appropriate* pattern usage.

## When to Trigger

- Standalone review of design pattern usage and anti-patterns.
- Orchestrated via `code-health-review` (Phase 3 deep dive).

## Scoring Summary

| Score | Meaning |
|---|---|
| 1 | Anti-patterns dominate — spaghetti code, god objects, copy-paste proliferation |
| 2 | Patterns absent where needed — repeated reinvention of solved problems |
| 3 | Some patterns present but inconsistently applied or misused |
| 4 | Patterns used appropriately — few anti-patterns, clear structure |
| 5 | Excellent — patterns used judiciously, code is idiomatic and well-structured |

Full rubric: `code-health-review/assets/scoring-rubric.md`

## Review Checklist

### Appropriate Use
- [ ] Patterns solve actual problems (not applied speculatively)
- [ ] Pattern choice fits the problem (not forcing a pattern where simpler code suffices)
- [ ] Patterns are recognizable and idiomatic for the language/framework
- [ ] YAGNI respected — no over-engineering via unnecessary abstraction layers

### Creational Patterns
- [ ] Object creation is managed appropriately (factories, builders where warranted)
- [ ] No scattered `new` calls for complex objects that should use a creation pattern
- [ ] Singleton used sparingly and only when truly needed (prefer DI)

### Structural Patterns
- [ ] Adapters wrap incompatible interfaces cleanly
- [ ] Decorators/middleware used for cross-cutting concerns (logging, auth, retry)
- [ ] Facade simplifies complex subsystems where appropriate

### Behavioral Patterns
- [ ] Strategy/policy patterns used where behavior varies at runtime
- [ ] Observer/event patterns used for decoupled communication
- [ ] Command/handler patterns used for undoable or queueable operations

### Anti-Patterns
- [ ] No God Objects (classes/modules doing everything)
- [ ] No Lava Flow (dead code left "just in case")
- [ ] No Golden Hammer (one pattern/tool used for everything)
- [ ] No Boat Anchor (unused abstractions "for the future")

## Scoring Guidance

Score each sub-area individually. The overall dimension score is the lowest sub-area score. Weight "Appropriate Use" and "Anti-Patterns" more heavily than specific pattern categories — using no patterns is fine if the code is simple; using patterns badly is not.

## Output

Produce a scorecard per `code-health-review/assets/scorecard-template.md`. On re-review, include delta scores.

## Related Skills

- `review-solid` — patterns often implement SOLID principles
- `review-clean-code` — code quality complements structural design
- `root-cause-analysis` — anti-patterns often compound; trace to root cause

## Quality Checks

- [ ] All 5 sub-areas assessed with evidence
- [ ] Anti-patterns named and located with file paths
- [ ] Pattern recommendations justified (not gratuitous)
- [ ] Fixes distinguish "add pattern" from "remove anti-pattern"
