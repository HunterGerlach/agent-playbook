---
name: review-12factor
description: Assess a codebase against the Twelve-Factor App methodology for cloud-native readiness.
version: 1.0.0
tier: 0
license: MIT
---

# 12-Factor Review

Evaluate a codebase against the [Twelve-Factor App](https://12factor.net) methodology. Produces a scorecard identifying gaps in cloud-native readiness.

## When to Trigger

- Standalone review of 12-factor compliance.
- Orchestrated via `code-health-review` (Phase 3 deep dive).

## Scoring Summary

| Score | Meaning |
|---|---|
| 1 | Critical gaps — app cannot run reliably in cloud environments |
| 2 | Significant violations — manual intervention needed for deploys |
| 3 | Adequate — most factors addressed, some gaps remain |
| 4 | Good — consistently follows 12-factor with minor deviations |
| 5 | Excellent — fully cloud-native, could serve as reference |

Full rubric: `code-health-review/assets/scoring-rubric.md`

## Review Checklist

### I. Codebase
- [ ] One codebase tracked in version control, many deploys
- [ ] No shared code via copy-paste between services (use packages/libs)

### II. Dependencies
- [ ] All dependencies explicitly declared (manifest file)
- [ ] No reliance on implicit system-level packages
- [ ] Dependency isolation (virtualenv, containers, etc.)

### III. Config
- [ ] Config stored in environment variables (not in code)
- [ ] No hardcoded URLs, credentials, or environment-specific values
- [ ] Config varies between deploys without code changes

### IV. Backing Services
- [ ] Backing services (DB, cache, queue) treated as attached resources
- [ ] Service URLs/credentials from config, swappable without code changes

### V. Build, Release, Run
- [ ] Strict separation between build, release, and run stages
- [ ] Releases are immutable and versioned
- [ ] No runtime code changes in production

### VI. Processes
- [ ] App runs as stateless processes
- [ ] No sticky sessions or in-memory state assumed to persist
- [ ] Persistent data in backing services only

### VII. Port Binding
- [ ] App is self-contained and exports services via port binding
- [ ] No dependency on runtime injection of a webserver

### VIII. Concurrency
- [ ] App scales out via the process model
- [ ] Workload types separated by process type (web, worker, scheduler)

### IX. Disposability
- [ ] Fast startup and graceful shutdown
- [ ] Processes handle SIGTERM gracefully
- [ ] Work is reentrant or uses robust job queues

### X. Dev/Prod Parity
- [ ] Dev, staging, and production are as similar as possible
- [ ] Same backing services in all environments (no SQLite in dev, Postgres in prod)
- [ ] Deploys happen frequently (hours/days, not weeks)

### XI. Logs
- [ ] Logs written to stdout/stderr as event streams
- [ ] No log file management within the app
- [ ] Log aggregation handled by the execution environment

### XII. Admin Processes
- [ ] One-off admin tasks run as processes in the same environment
- [ ] Admin code ships with application code
- [ ] Migrations run via the same deployment mechanism

## Scoring Guidance

Score each factor (I-XII) individually. The overall dimension score is the lowest individual factor score. Factors that do not apply should be marked N/A with justification.

## Output

Produce a scorecard per `code-health-review/assets/scorecard-template.md`. On re-review, include delta scores.

## Related Skills

- `review-continuous-delivery` — overlaps on build/release/run and deployment practices
- `review-security-posture` — overlaps on config/secrets management

## Quality Checks

- [ ] All 12 factors assessed with evidence
- [ ] Findings include file paths and specific observations
- [ ] Fixes are actionable (not just "improve this")
- [ ] N/A factors documented with justification
