---
name: review-performance
description: Assess code performance — algorithmic complexity, resource efficiency, I/O patterns, caching, concurrency, and measurement practices.
version: 1.0.0
tier: 0
license: MIT
---

# Performance Review

Evaluate a codebase for performance issues and optimization opportunities. Focus on algorithmic efficiency, resource usage, I/O patterns, and whether performance is measured rather than guessed.

## When to Trigger

- Standalone review of performance characteristics.
- Orchestrated via `code-health-review` (Phase 3 deep dive).

## Scoring Summary

| Score | Meaning |
|---|---|
| 1 | Critical performance problems — unbounded loops, N+1 queries, no resource limits |
| 2 | Significant inefficiencies — known hot paths unoptimized, no measurement |
| 3 | Adequate — reasonable defaults but optimization is ad hoc, not systematic |
| 4 | Good — hot paths optimized, performance measured, minor opportunities remain |
| 5 | Excellent — performance budgets enforced, profiling integrated, proactive |

Full rubric: `code-health-review/assets/scoring-rubric.md`

## Review Checklist

### Algorithmic Complexity
- [ ] No unnecessary O(n^2) or worse in hot paths (nested loops over collections)
- [ ] Data structures match access patterns (maps for lookups, not linear scans)
- [ ] Sorting, searching, and filtering use appropriate algorithms
- [ ] Recursive calls have bounded depth or use iteration

### Resource Efficiency
- [ ] Memory allocations are reasonable (no unbounded growth, large unnecessary copies)
- [ ] Connections and handles are properly pooled and released
- [ ] Batch operations used where possible (not one-at-a-time processing)
- [ ] Resource limits configured (timeouts, max sizes, pool sizes)

### I/O Patterns
- [ ] No N+1 query patterns (database, API, or file I/O)
- [ ] I/O is batched or streamed where appropriate
- [ ] Blocking I/O is not on critical paths (or is justified)
- [ ] File and network operations handle large inputs without loading everything into memory

### Caching
- [ ] Expensive computations or fetches are cached where appropriate
- [ ] Cache invalidation strategy exists and is correct
- [ ] Cache sizes are bounded (no unbounded memory growth)
- [ ] Caching is applied at the right layer (not too early, not too late)

### Concurrency
- [ ] Parallelism used for independent, CPU-bound work where beneficial
- [ ] Async I/O used for I/O-bound work where beneficial
- [ ] No unnecessary serialization of independent operations
- [ ] Thread safety and race conditions considered

### Measurement
- [ ] Performance-critical paths are identified and documented
- [ ] Benchmarks or profiling results exist for hot paths
- [ ] Performance regressions are detectable (benchmarks in CI or monitored metrics)
- [ ] Optimization decisions are evidence-based (profiled, not guessed)

## Scoring Guidance

Score each sub-area individually. The overall dimension score is the lowest sub-area score. Distinguish between code that is "not optimized" (acceptable if not a hot path) and code that is "pessimized" (actively wasteful). Score the latter more severely.

## Output

Produce a scorecard per `code-health-review/assets/scorecard-template.md`. On re-review, include delta scores.

## Related Skills

- `review-clean-code` — clean code and performant code often align (small functions, clear data flow)
- `review-12factor` — concurrency and process model affect scalability
- `review-continuous-delivery` — performance benchmarks in CI catch regressions

## Quality Checks

- [ ] All 6 sub-areas assessed with evidence
- [ ] Hot paths identified with file paths and line references
- [ ] Findings distinguish "not optimized" from "pessimized"
- [ ] Fixes include complexity/resource impact estimates where possible
