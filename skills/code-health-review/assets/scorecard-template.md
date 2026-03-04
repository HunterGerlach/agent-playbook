# Scorecard Template

Use this format for all code health review output.

## Scorecard: [Dimension Name]

**Reviewed:** [date] | **Repo:** [repo name] | **Reviewer:** [agent/human]

| Sub-Area | Score | Key Observation |
|---|---|---|
| [sub-area 1] | [1-5] | [one-line summary] |
| [sub-area 2] | [1-5] | [one-line summary] |
| ... | ... | ... |
| **Overall** | **[lowest]** | **[summary]** |

### Findings

For each finding:

```
[F-NN] [severity: critical|high|medium|low]
Summary: [one sentence]
Location: [file path(s) and line(s)]
Evidence: [what was observed]
Fix: [specific, actionable suggestion]
Auto-fixable: [yes/no]
```

### Delta (re-review only)

| Sub-Area | Previous | Current | Change |
|---|---|---|---|
| [sub-area] | [old] | [new] | [+N/-N] |

**Resolved:** [count] | **Remaining:** [count] | **New:** [count]
