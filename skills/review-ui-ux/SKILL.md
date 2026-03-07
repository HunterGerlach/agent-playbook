---
name: review-ui-ux
description: Assess user experience across all touchpoints — simplicity, anticipatory design, consistency, responsiveness, feedback, CLI/API DX, and navigation.
version: 1.0.0
tier: 0
license: MIT
---

# UI/UX Review

Evaluate a codebase's user experience across every touchpoint: web and mobile UI, CLI, API surface, error messages, onboarding, and documentation. The review is grounded in a core conviction: the best interface is the one the user never has to think about. Every element must earn its place. The system should anticipate what the user needs before they ask.

## When to Trigger

- Standalone review of user experience quality.
- Orchestrated via `code-health-review` (Phase 3 deep dive).

## Scoring Summary

| Score | Meaning |
|---|---|
| 1 | Confusing, cluttered, or hostile UX — users struggle to accomplish basic tasks |
| 2 | Functional but noisy — too many choices, unclear paths, reactive instead of proactive |
| 3 | Adequate — usable with effort, some unnecessary complexity, inconsistent polish |
| 4 | Good — clean and focused, system anticipates most needs, minor rough edges |
| 5 | Excellent — effortless, invisible, the system does the right thing before being asked |

Full rubric: `code-health-review/assets/scoring-rubric.md`

## Guiding Principle

Simplicity is not a sub-area — it is the lens through which every sub-area is scored. When evaluating any dimension, ask: could this be removed, combined, or made automatic? If the user has to configure, navigate, or recover from something the system could have handled, that is a finding.

## Review Checklist

### Simplicity & Clarity
- [ ] Every visible element serves a clear purpose (no decorative complexity)
- [ ] Progressive disclosure: show only what's needed now, reveal depth on demand
- [ ] Cognitive load is minimized — no decision fatigue from excessive options
- [ ] Opinionated defaults reduce configuration to the exceptional case
- [ ] Flows complete in the fewest possible steps (no unnecessary confirmation dialogs, redundant pages, or ceremony)
- [ ] Language is plain and direct — no jargon, no ambiguity, no walls of text

### Anticipatory Design
- [ ] Smart defaults pre-fill forms, settings, and options based on context
- [ ] System provides contextual guidance at the moment of need (not buried in docs)
- [ ] Proactive error prevention: constraints, validation, and guardrails prevent mistakes before they happen
- [ ] Predictive actions surface likely next steps (suggested actions, auto-complete, type-ahead)
- [ ] The system recovers gracefully — undo, auto-save, draft preservation
- [ ] Onboarding is implicit: the interface teaches by doing, not by explaining

### Consistency & Design System
- [ ] Visual language is uniform: spacing, typography, color, and iconography follow a system
- [ ] Components are reused, not reinvented (shared component library or equivalent)
- [ ] Design tokens centralize style decisions (colors, spacing, font sizes)
- [ ] Interaction patterns are predictable (same action, same result, everywhere)
- [ ] Semantic HTML used correctly (headings, landmarks, labels, roles)
- [ ] Text is externalizable — no hardcoded user-facing strings in business logic
- [ ] Color is not the sole conveyor of meaning (supports color-blind users)

### Responsiveness
- [ ] Mobile-first: core experience works on smallest supported viewport
- [ ] Breakpoints are intentional and tested (not just "shrink until it breaks")
- [ ] Touch targets meet minimum size (44x44px / 48dp)
- [ ] No horizontal scroll on supported viewports
- [ ] Images and media are responsive (srcset, lazy loading, appropriate formats)

### Feedback & Perceived Performance
- [ ] Loading states are immediate — skeleton screens, spinners, or progress indicators appear within 100ms
- [ ] Optimistic updates show results before server confirmation where safe
- [ ] Empty states are helpful, not blank (guide the user toward their first action)
- [ ] Error messages are specific, actionable, and blame the system not the user
- [ ] Success confirmations are present but not disruptive
- [ ] Long operations show progress (determinate progress bars, step indicators)
- [ ] Transitions and animations serve comprehension, not decoration

### CLI & API Developer Experience
- [ ] `--help` output is concise, shows common use cases first, and groups flags logically
- [ ] Flag and command names are predictable (follow platform conventions)
- [ ] Error output distinguishes user errors from system errors with actionable messages
- [ ] Exit codes are meaningful and documented
- [ ] API error responses include error code, human message, and remediation hint
- [ ] API pagination, filtering, and sorting follow established conventions
- [ ] Smart defaults minimize required flags/parameters for common operations
- [ ] SDK/client examples exist for critical endpoints

### Navigation & Discoverability
- [ ] Information hierarchy is clear — users can orient themselves at any depth
- [ ] URL structure is human-readable and bookmarkable
- [ ] Breadcrumbs or equivalent wayfinding exist for deep hierarchies
- [ ] Search or filtering is available when content exceeds scannable volume
- [ ] Key actions are discoverable without documentation (visible, not hidden in menus)
- [ ] Navigation is shallow — most tasks reachable in 3 clicks/taps or fewer

## Scoring Guidance

Score each sub-area individually. The overall dimension score is the lowest sub-area score. Apply the simplicity lens to every score: a sub-area that "works" but is unnecessarily complex should score no higher than 3. A sub-area where the system anticipates user needs earns a 4 or 5.

For projects without a visual UI (CLI tools, libraries, APIs), score the applicable sub-areas and mark others N/A with justification. Even a CLI-only project has simplicity, anticipatory design, feedback, and developer experience to assess.

## Output

Produce a scorecard per `code-health-review/assets/scorecard-template.md`. On re-review, include delta scores.

## Related Skills

- `review-performance` — backend performance affects perceived performance; cross-reference for algorithmic and I/O concerns
- `review-clean-code` — naming and readability in code often mirror naming and clarity in UI
- `review-design-patterns` — anti-patterns in code (god objects, shotgun surgery) often manifest as UX inconsistency

## Quality Checks

- [ ] All 7 sub-areas assessed with evidence
- [ ] Simplicity lens applied to every score (noted in observations)
- [ ] Findings include file paths, screenshots, or specific UI elements
- [ ] Fixes distinguish "remove complexity" from "add capability"
- [ ] N/A sub-areas justified for non-visual projects
