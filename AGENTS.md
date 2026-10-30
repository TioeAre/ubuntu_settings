# Repository Guidelines

## Scope and workflow

* Complete the requested task with the smallest sufficient change; preserve unrelated user changes.
* Use `apply_patch` for edits. If unavailable, use `git apply --recount`.
* Keep durable project facts in `project_summary.md` and setup/usage in `README.md`; update them only when the task materially affects their content.

## Implementation

* Follow existing style and naming. Keep code and comments simple and clear.
* Reuse existing dependencies where suitable. Avoid unnecessary abstractions, configuration, dependencies, and indirection.
* When a requested feature is already supported by a mature, widely used community library, reuse it instead of implementing the same functionality from scratch.
* Add compatibility layers, migrations, or fallbacks only when current requirements demand them.
* Do not commit debug artifacts or machine-specific absolute paths.

## Anti-defensive coding

* Do not add probes, snapshots, evidence-collection code, gates, fixtures, hashes, smoke checks, or baselines unless absolutely necessary for the requested functionality.
* Do not establish a sole authoritative baseline or create traceable backup workflows.
* Do not check whether gates passed, perform dry runs, or verify hashes after deployment.
* Keep validation proportional to actual uncertainty. For simple, inspectable changes, skip tests and builds; otherwise use the narrowest useful check. Do not add validation scaffolding or run broad or repeated checks merely for completeness.
