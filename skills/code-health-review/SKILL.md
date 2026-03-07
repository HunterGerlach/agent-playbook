---
name: code-health-review
description: Whole-repo code health assessment across 12 dimensions. Quick scan, prioritize, then deep dive with detailed review skills.
version: 1.0.0
tier: 0
license: MIT
---

# Code Health Review

Assess overall code health across 12 dimensions. Produces a prioritized view of where improvement effort will have the most impact, then guides deep dives using specialized review skills.

## When to Trigger

- Starting work on an unfamiliar codebase.
- Periodic health check on an active project.
- Before a major refactor, migration, or architecture decision.
- After a significant milestone to assess accumulated debt.

## Dimensions

| # | Dimension | Review Skill |
|---|---|---|
| 1 | 12-Factor Compliance | `review-12factor` |
| 2 | Clean Architecture | `review-clean-architecture` |
| 3 | Clean Code | `review-clean-code` |
| 4 | SOLID Principles | `review-solid` |
| 5 | Design Patterns | `review-design-patterns` |
| 6 | Integration Patterns | `review-integration-patterns` |
| 7 | Continuous Delivery | `review-continuous-delivery` |
| 8 | Test-Driven Development | `review-tdd` |
| 9 | Test Pyramid | `review-test-pyramid` |
| 10 | Performance | `review-performance` |
| 11 | UI/UX | `review-ui-ux` |
| 12 | Security Posture | `review-security-posture` |

## Workflow

### Phase 1 — Quick Scan

Rapidly assess all 12 dimensions. For each dimension, examine 3-5 representative files or configurations and assign a preliminary 1-5 score with a one-line observation.

**Output:** Summary table with all 12 dimensions scored.

| Dimension | Score | Key Observation |
|---|---|---|
| [each dimension] | [1-5] | [one line] |

### Phase 2 — Prioritize

1. Sort dimensions by score ascending (lowest first).
2. Recommend the top 3-5 dimensions where improvement would have the most impact.
3. Present the prioritized list and ask the user which dimensions to deep-dive.

Consider these factors when prioritizing:
- **Severity:** Lower scores indicate more urgent issues.
- **Blast radius:** Dimensions affecting many files or critical paths rank higher.
- **Quick wins:** Dimensions where small changes yield large score improvements.

### Phase 3 — Deep Dive

For each selected dimension:

1. Load the corresponding review skill (see Dimensions table).
2. Execute the full checklist from that skill.
3. Produce a scorecard using the [scorecard template](assets/scorecard-template.md).
4. List findings with severity, location, fix suggestion, and auto-fix eligibility.

After all selected deep dives complete, produce a **consolidated summary**:

| Dimension | Score | Top Finding | Quick Win |
|---|---|---|---|
| [each reviewed dimension] | [1-5] | [most impactful finding] | [lowest-effort fix] |

### Re-Review Workflow

When re-reviewing after fixes:

1. Load previous scorecards (user provides or references prior output).
2. Run the same review skills on the updated codebase.
3. Produce delta scores per the [scorecard template](assets/scorecard-template.md).
4. Highlight resolved, remaining, and new findings.

## Scoring

See [scoring rubric](assets/scoring-rubric.md) for the universal 1-5 scale and scoring rules.

## Quality Checks

- [ ] All 12 dimensions assessed in Phase 1
- [ ] Prioritization rationale documented
- [ ] Each deep-dive produces a scorecard with evidence
- [ ] Findings include file paths and actionable fixes
- [ ] Consolidated summary produced after deep dives
- [ ] Delta scores shown on re-review
