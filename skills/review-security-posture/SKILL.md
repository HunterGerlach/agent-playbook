---
name: review-security-posture
description: Assess whole-repo security posture — dependency management, secrets handling, supply chain, access control, vulnerability scanning, and cryptographic hygiene.
version: 1.0.0
tier: 0
license: MIT
---

# Security Posture Review

Evaluate a codebase's overall security posture at the repository level. This is a broad assessment of security practices, distinct from the change-level `security-review` skill which focuses on specific code changes.

## When to Trigger

- Standalone whole-repo security assessment.
- Orchestrated via `code-health-review` (Phase 3 deep dive).

## Scoring Summary

| Score | Meaning |
|---|---|
| 1 | Critical security gaps — exposed secrets, unpatched vulnerabilities, no scanning |
| 2 | Significant gaps — some controls exist but major risks are unmitigated |
| 3 | Adequate — basic security controls in place, some gaps in depth |
| 4 | Good — comprehensive controls with minor improvement opportunities |
| 5 | Excellent — defense in depth, proactive practices, auditable |

Full rubric: `code-health-review/assets/scoring-rubric.md`

## Review Checklist

### Dependency Management
- [ ] Dependencies are pinned to specific versions (lockfile present and committed)
- [ ] Dependency update process exists (Dependabot, Renovate, or manual cadence)
- [ ] Transitive dependencies audited
- [ ] Minimal dependency footprint (stdlib preferred where possible)

### Secrets Handling
- [ ] No secrets committed to version control (scan git history)
- [ ] `.gitignore` excludes secret files (`.env`, credentials, keys)
- [ ] Secrets sourced from environment variables or secret manager
- [ ] Pre-commit hooks or CI checks prevent secret commits

### Supply Chain
- [ ] Dependency checksums verified (lockfile integrity)
- [ ] SBOM generation in CI pipeline (or easily producible)
- [ ] License compliance checked for all dependencies
- [ ] No `curl | bash` or equivalent patterns in build/install

### Access Control
- [ ] Repository access follows least privilege
- [ ] Branch protection enabled on main branch
- [ ] Code review required before merge
- [ ] CI must pass before merge

### Vulnerability Scanning
- [ ] Automated dependency vulnerability scanning in CI
- [ ] Container image scanning (if applicable)
- [ ] SAST (static analysis security testing) in pipeline or pre-commit
- [ ] Known vulnerabilities tracked and remediated on a cadence

### Cryptographic Hygiene
- [ ] Only approved algorithms used (AES, SHA-256+, TLS 1.2+)
- [ ] No deprecated primitives (MD5, SHA-1 for security, RC4)
- [ ] Encryption at rest for sensitive data stores
- [ ] Encryption in transit for all external communication

## Scoring Guidance

Score each sub-area individually. The overall dimension score is the lowest sub-area score. For non-deployed code (libraries, tools), adapt: "access control" focuses on repo settings, "vulnerability scanning" focuses on dependency scanning.

## Output

Produce a scorecard per `code-health-review/assets/scorecard-template.md`. On re-review, include delta scores.

## Related Skills

- `security-review` — change-level security review (complements this repo-level assessment)
- `dependency-adding` — detailed workflow for evaluating individual dependencies
- `review-12factor` — config and backing services overlap with secrets handling

## Quality Checks

- [ ] All 6 sub-areas assessed with evidence
- [ ] Secret scanning results referenced
- [ ] Dependency audit results referenced
- [ ] Findings prioritized by risk severity
