# AGENTS Guidelines for This Repository

This file applies to the entire repository. Keep it focused on agent behavior and engineering rules; durable project facts belong in `project_summary.md`, and user-facing setup and usage belong in `README.md`.

## Required Startup Workflow

Before substantive work:

1. Read `AGENTS.md` and `project_summary.md` in full.
2. Use the summary to locate relevant code, configuration, tests, and entry points.
3. Verify task-sensitive details against the current source. Source code and checked-in configuration remain the source of truth.
4. Inspect the worktree and preserve unrelated or pre-existing user changes.

If `project_summary.md` is missing, inspect the repository and create it before making substantive changes. In a read-only context, defer creation and include it in the plan.

## Development Guidelines

- Use `apply_patch` for file edits. If it cannot run because of an environment or sandbox limitation, apply the patch with `git apply --recount <<'PATCH'` instead.

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

`project_summary.md` at the repository root is the durable project context document. Keep `project_summary.md` concise, factual, and project-wide. Update it in the same task when work changes repository structure, component responsibilities, system-wide data or control flow, public entry points, configuration formats, dependencies, runtime requirements, or standard operational workflows.

Do not update it for local bug fixes, isolated tests, formatting, task logs, changelogs, or temporary implementation details. Edit existing sections in place, remove obsolete claims, verify changed statements against the repository, and state in the final report whether and why the summary changed.
