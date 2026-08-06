# AGENTS Guidelines for This Repository

## Agent Delegation

When operating in Plan mode, proactively delegate clear, narrowly scoped, and repeatable subtasks to the global `luna_worker` agent without requiring the user to repeat the delegation request. Delegate only work permitted in Plan mode, give each task strict boundaries, and use `luna_worker` for independent execution and practical verification. Keep ambiguous, cross-cutting, or architecture-defining work with the primary agent. The primary agent remains responsible for decisions, integration, and the final report.

## Engineering Principles

1. Do not preserve backward compatibility. Delete obsolete paths directly; do not add compatibility layers, migrations, or fallbacks.
2. Choose the simplest implementation that satisfies the current requirements. Avoid speculative abstractions, unnecessary indirection, and redundant configuration layers.
3. Build the system in layers. First make a minimal end-to-end path work, then add capabilities incrementally. Never dismantle a working path to accommodate unfinished complexity.
4. Keep components modular and maintain a clear separation of concerns.
5. Prefer mature, actively maintained libraries. Do not reimplement functionality without a concrete reason.
6. Inspect the capabilities of existing project dependencies before adding a package or writing a custom implementation. Do not assume required functionality is absent.
7. Make architecture decisions for the long term. Do not accept temporary designs justified by plans to replace them later.
8. Study how mature products solve the same problem and use proven patterns instead of inventing solutions from scratch.

## Coding Style & Naming Conventions

Use Python with 4-space indentation, type hints where they clarify interfaces, and explicit imports. Follow existing names: modules and functions use `snake_case`, classes use `PascalCase`, and config files use descriptive names. Keep comments short and useful; avoid committing debug breakpoints or ad hoc absolute paths.

## Persistent Project Summary

`project_summary.md` at the repository root is the durable project context document. Keep it concise, factual, and useful for understanding the project across sessions.

### Required Startup Workflow

Before starting substantive work:

1. Read `AGENTS.md`.
2. Read `project_summary.md` in full.
3. Use the summary to locate the relevant code, configuration, tests, and entry points.
4. Verify task-sensitive details against the current source code. The source code remains the source of truth.

If `project_summary.md` does not exist, inspect the repository and create it before making substantive project changes. In Plan mode or another read-only context, include its creation in the implementation plan and defer the write until edits are permitted.

### Required Contents

Keep `project_summary.md` focused on durable project-wide knowledge:

- Project purpose and major capabilities.
- Repository structure and module responsibilities.
- Main entry points and supported workflows.
- Important control flow and data flow.
- Configuration system and important environment variables.
- Major dependencies and what they provide.
- Build, training, evaluation, testing, and operational commands.
- Project-wide architectural decisions, invariants, and constraints.

Do not turn the summary into a file inventory, task log, changelog, implementation diary, or collection of temporary details.

### Update Policy

At the end of a task, determine whether the work materially changed project-wide knowledge. Update `project_summary.md` in the same task when the change affects any of the following:

- Repository layout or module responsibilities.
- Architecture, component boundaries, or system-wide data/control flow.
- Main entry points, public interfaces, or configuration formats.
- Dependencies, runtime requirements, or infrastructure assumptions.
- Build, training, evaluation, testing, deployment, or operational workflows.
- Project-wide conventions, invariants, or architectural decisions.

Do not update `project_summary.md` for local bug fixes, small internal refactors, isolated tests, formatting changes, or implementation details that do not affect understanding of the project as a whole.

When updating the summary:

- Edit the relevant section in place.
- Remove obsolete information instead of preserving historical compatibility notes.
- Do not append task-by-task history.
- Keep the document compact and internally consistent.
- Verify every changed statement against the current repository.
- Mention in the final report whether `project_summary.md` was updated and why.
