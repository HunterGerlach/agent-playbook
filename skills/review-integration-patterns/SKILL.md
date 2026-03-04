---
name: review-integration-patterns
description: Assess integration patterns — messaging style, channels, message construction, routing, transformation, and error handling.
version: 1.0.0
tier: 0
license: MIT
---

# Integration Patterns Review

Evaluate a codebase against Enterprise Integration Patterns (Hohpe & Woolf) and modern integration practices. Applicable to any system that communicates with external services, message brokers, or other internal services.

## When to Trigger

- Standalone review of integration and messaging patterns.
- Orchestrated via `code-health-review` (Phase 3 deep dive).

## Scoring Summary

| Score | Meaning |
|---|---|
| 1 | Integrations are fragile — no retry, no error handling, tight coupling |
| 2 | Some integration patterns exist but inconsistently applied |
| 3 | Adequate — integrations work but lack resilience or observability |
| 4 | Good — consistent patterns, resilient, well-monitored |
| 5 | Excellent — exemplary integration design, fault-tolerant, observable |

Full rubric: `code-health-review/assets/scoring-rubric.md`

## Review Checklist

### Messaging Style
- [ ] Communication style is intentional (sync vs async, request-reply vs fire-and-forget)
- [ ] Async messaging used where appropriate (long-running work, decoupling)
- [ ] Sync calls have timeout and circuit-breaker protections

### Channels
- [ ] Message channels/topics are well-defined and documented
- [ ] Channel-per-concern (not multipurpose channels)
- [ ] Dead letter queues configured for unprocessable messages

### Message Construction
- [ ] Messages have clear schemas (versioned, documented)
- [ ] Messages are self-contained (no implicit context required)
- [ ] Correlation IDs used for request tracing across services

### Routing
- [ ] Message routing is explicit and configurable
- [ ] Content-based routing uses message metadata, not payload inspection
- [ ] Routing logic is centralized or declarative (not scattered)

### Transformation
- [ ] Data transformation happens at boundaries (adapters, mappers)
- [ ] No inline transformation buried in business logic
- [ ] Schema evolution strategy exists (backward/forward compatibility)

### Error Handling
- [ ] Retry with backoff for transient failures
- [ ] Circuit breaker pattern for cascading failure prevention
- [ ] Poison message handling (dead letter, quarantine)
- [ ] Compensating transactions or sagas for distributed operations

## Scoring Guidance

Score each sub-area individually. The overall dimension score is the lowest sub-area score. For monolithic apps with few integrations, score what exists — even a single external API call should have timeout and error handling.

## Output

Produce a scorecard per `code-health-review/assets/scorecard-template.md`. On re-review, include delta scores.

## Related Skills

- `review-12factor` — backing services and config overlap
- `review-continuous-delivery` — deployment patterns affect integration
- `review-security-posture` — integration boundaries are attack surfaces

## Quality Checks

- [ ] All 6 sub-areas assessed with evidence
- [ ] Integration points identified with file paths
- [ ] Missing resilience patterns flagged with severity
- [ ] Fixes include specific pattern recommendations
