# Scoring Rubric

Universal 1-5 scale used by all code health review skills.

| Score | Label | Meaning |
|---|---|---|
| 1 | Critical | Fundamental problems. High risk of outages, breaches, or delivery failure. Immediate action required. |
| 2 | Poor | Significant gaps. Known risks are unmitigated. Remediation needed before next release. |
| 3 | Adequate | Meets minimum expectations. Some gaps exist but are managed. Improvement opportunities identified. |
| 4 | Good | Consistently follows best practices. Minor refinements possible. Low risk. |
| 5 | Excellent | Exemplary. Could serve as a reference implementation. Proactive practices in place. |

## Scoring Rules

- **Score per sub-area** with specific evidence (file paths, code snippets, observations).
- **Dimension score = lowest sub-area score** (weakest-link model). A dimension is only as strong as its weakest sub-area.
- **N/A is valid** when a sub-area genuinely does not apply (e.g., concurrency for a static site). Document why.
- **Round down on ambiguity.** If evidence is unclear, score conservatively.
- **Delta scoring** on re-review: compare to previous scores, note resolved/remaining/new findings.
