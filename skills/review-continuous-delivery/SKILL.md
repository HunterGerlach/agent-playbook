---
name: review-continuous-delivery
description: Assess continuous delivery maturity — pipeline, trunk-based development, automated testing, deployment automation, feedback speed, deployability, and config as code.
version: 1.0.0
tier: 0
license: MIT
---

# Continuous Delivery Review

Evaluate a codebase and its delivery pipeline against Continuous Delivery (Humble & Farley) principles. Focus on the ability to safely and frequently deliver changes to production.

## When to Trigger

- Standalone review of delivery pipeline maturity.
- Orchestrated via `code-health-review` (Phase 3 deep dive).

## Scoring Summary

| Score | Meaning |
|---|---|
| 1 | Manual deployments, no pipeline, high risk of failed releases |
| 2 | Basic CI exists but deployments are manual or error-prone |
| 3 | Pipeline automates build/test but deployment requires manual steps |
| 4 | Fully automated pipeline with minor gaps in feedback or config |
| 5 | Exemplary — push-button deploys, fast feedback, high confidence |

Full rubric: `code-health-review/assets/scoring-rubric.md`

## Review Checklist

### Pipeline
- [ ] CI/CD pipeline exists and runs on every commit
- [ ] Pipeline stages are ordered: build → test → package → deploy
- [ ] Pipeline failures block promotion to later stages
- [ ] Pipeline configuration is version-controlled

### Trunk-Based Development
- [ ] Main branch is always deployable
- [ ] Feature branches are short-lived (< 2 days preferred)
- [ ] No long-lived branches or merge-heavy workflows
- [ ] Feature flags used for incomplete features (not branches)

### Automated Testing
- [ ] Unit tests run in pipeline (< 5 min target)
- [ ] Integration tests run in pipeline
- [ ] Test failures block deployment
- [ ] Flaky tests are tracked and quarantined, not ignored

### Deployment Automation
- [ ] Deployments are fully automated (no manual steps)
- [ ] Rollback is automated or trivial
- [ ] Blue-green, canary, or rolling deployment strategy in use
- [ ] Database migrations are automated and backward-compatible

### Feedback Speed
- [ ] Build + unit tests complete in < 10 minutes
- [ ] Full pipeline completes in < 30 minutes
- [ ] Developers get feedback before context-switching
- [ ] Alerts on pipeline failures reach the right people immediately

### Deployability
- [ ] Any commit on main could be released to production
- [ ] Release frequency is high (daily or more)
- [ ] Release process does not require coordination meetings
- [ ] Hotfix path exists and is documented

### Config as Code
- [ ] Infrastructure defined as code (Terraform, CloudFormation, etc.)
- [ ] Environment configuration is version-controlled
- [ ] Secrets managed via secret manager (not config files)
- [ ] Environment parity enforced (dev ≈ staging ≈ prod)

## Scoring Guidance

Score each sub-area individually. The overall dimension score is the lowest sub-area score. For projects without a deployment target (libraries, CLIs), adapt: "deployment" means "release to registry" and pipeline means "CI that gates releases."

## Output

Produce a scorecard per `code-health-review/assets/scorecard-template.md`. On re-review, include delta scores.

## Related Skills

- `review-12factor` — overlaps on build/release/run, config, and dev-prod parity
- `review-test-pyramid` — test structure affects pipeline speed
- `ci-debugging` — use when pipeline is currently failing

## Quality Checks

- [ ] All 7 sub-areas assessed with evidence
- [ ] Pipeline configuration files referenced
- [ ] Deployment process documented or described
- [ ] Fixes prioritized by impact on deployment frequency
