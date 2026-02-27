---
name: engineering-standards
description: Non-discoverable engineering standards for architecture, testing, delivery, security, versioning, and design thinking. Load when starting implementation on a non-trivial task or reviewing code quality.
version: 1.0.0
tier: 0
license: MIT
---

# Engineering Standards

Load this skill when beginning non-trivial implementation work or performing code quality review. These standards supplement what agents already know from training data with non-obvious defaults and decision frameworks.

## When to Trigger

- Starting implementation on a non-trivial task
- Reviewing code for quality, security, or architecture
- Making technology or design pattern choices
- Evaluating test coverage or delivery readiness

## Architecture & Design

- Default to **hexagonal / ports-and-adapters** architecture: domain logic at the center, adapters at the edges. Simpler structures are acceptable for trivial or short-lived code, but the burden of proof is on simplifying, not on structuring.
- Document significant architectural choices as **Architecture Decision Records (ADRs)** with context, decision, and consequences. Use the `adr-writing` skill.

## Testing

- Primary problem-solving lens: **"How might I test this?"** When stuck, ask how you would verify the solution — this often reveals the path forward.
- Follow the **Red-Green-Refactor** TDD loop strictly:
  1. **Red** — Write a failing test that defines the desired behavior.
  2. **Green** — Write the minimum code to make the test pass.
  3. **Refactor** — Clean up while keeping tests green.
- Do not skip steps. Do not write implementation before tests.
- **Full test coverage** is the default expectation. Untested code is the exception that requires justification (e.g., trivial getters, framework boilerplate, legacy code not under active change).

## Delivery

- Distinguish the **inner loop** from the **outer loop**:
  - **Inner loop** (developer laptop): fast edit-build-test cycles, local linting, unit tests, hot reload. Optimize for speed and tight feedback.
  - **Outer loop** (CI/CD pipeline): full integration tests, security scans, compliance checks, artifact promotion, deployment. Optimize for correctness and auditability.
  - Design so that inner-loop confidence translates cleanly to outer-loop validation — no "works on my machine" gaps.
- Build for **full observability** from the start: structured logging, metrics, distributed tracing. Instrument at service boundaries and key decision points.
- Consider **resource usage** explicitly: CPU, memory, storage, network, and cloud spend. Right-size allocations, set limits/requests, and avoid unbounded growth patterns.
- Practice **Continuous Delivery**: keep the main branch deployable. Prefer small batches, fast feedback, and automation over manual process.

## Security

- Adopt a **security-first mindset** — security and compliance are built in from the start, not added afterward.
- Apply **zero-trust** principles: never assume trust based on network location. Authenticate and authorize every request, validate all inputs, and assume any component can be compromised.
- **Recommend FIPS-compliant cryptography** as the default. Use FIPS-validated modules and algorithms (e.g., AES, SHA-256/384/512, TLS 1.2+). Projects may relax this by documenting the exception.
- Apply **least privilege** everywhere: IAM roles, service accounts, file permissions, network policies.
- Treat secrets as first-class concerns — use secret managers or environment injection. Never hardcode credentials.
- **Minimize dependencies.** Every dependency is attack surface, maintenance burden, and supply-chain risk. Prefer the standard library. When a third-party dependency is necessary, pin versions, verify checksums, and audit transitives.
- Include **dependency scanning** and **SBOM generation** in the outer loop.
- Default to **encrypted at rest and in transit**. Document exceptions and compensating controls.
- Write **auditable** code: clear logging of security-relevant events, traceable decisions, no silent failures on auth/authz paths.

## Versioning & Git

- **Commit early and often.** Each commit should be a single, atomic unit of work — one logical change that compiles, passes tests, and could be reverted independently. If you find yourself writing "and" in a commit message, it should probably be two commits.
- Write commit messages in **imperative mood**: the first line completes "If applied, this commit will ..." Keep the first line under 50 characters; the body explains *why*, not *what*.

## Thinking Tools

Use these mental models when making design and implementation decisions:

- **Gall's Law** — Complex systems that work evolved from simple systems that worked. Start simple.
- **Hyrum's Law** — All observable behaviors of an API will be depended upon. Be deliberate about interfaces.
- **Goodhart's Law** — When a measure becomes a target, it ceases to be a good measure.
- **Anti-patterns compound.** An anti-pattern left in place attracts more anti-patterns — workarounds breed workarounds. Trace to root cause; fix the cause, not the symptom.
- **Unix Philosophy** — Do one thing and do it well. Compose small, focused pieces rather than building monoliths.
- **Avoid sprawl.** Every fact should have one canonical home. Other locations should link, not restate.
- Keep as constant companions: **KISS**, **YAGNI**, **DRY**, and the **Pareto Principle**.
