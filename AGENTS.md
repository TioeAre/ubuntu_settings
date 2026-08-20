# AGENTS Guidelines for This Repository

This file applies to the entire repository. Keep it focused on agent behavior and engineering rules; durable project facts belong in `project_summary.md`, and user-facing setup and usage belong in `README.md`.

## Required Startup Workflow

Before substantive work:

1. Read the repository-root `AGENTS.md` in full.
2. Inspect `project_summary.md` as the repository index. Read the sections relevant to the current task; read it in full for cross-cutting, architectural, or unfamiliar work.
3. Use the summary to locate relevant code, configuration, tests, and entry points.
4. Verify all task-sensitive details against the current source. Source code and checked-in configuration remain the source of truth.
5. Inspect the worktree and preserve unrelated or pre-existing user changes.

If `project_summary.md` is missing, inspect the repository and create it before making substantive changes. In a read-only context, defer creation and include it in the plan.

## Development Guidelines

- Use `apply_patch` for file edits. If it cannot run because of an environment or sandbox limitation, apply the patch with `git apply --recount <<'PATCH'` instead.

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

## Agent Delegation

Delegation is the default for implementation after plan approval. Optimize primarily for total execution cost while preserving correctness.

Once a plan is decision-complete, the parent agent should normally delegate implementation rather than execute it directly, even when the parent already has sufficient repository context.

### General Rules

- Keep small, tightly coupled, or context-heavy tasks in the current agent.
- Delegate tasks that are independent, decision-complete, repetitive, or can be described with a compact handoff.
- Do not delegate unresolved architectural decisions or tasks that require most of the planner's accumulated context.
- Do not assume prompt-cache or KV-cache reuse across agents or models. Minimize duplicated context, repository reads, tool output, and review work.
- Avoid redundant investigation between the parent agent and workers.

### Handoff Contract

Provide workers with a compact execution packet containing only what is necessary:

- objective and scope;
- relevant repository paths;
- decisions and constraints already established;
- acceptance criteria;
- required validation commands;
- known pre-existing changes that must be preserved.

Do not copy source files, `AGENTS.md`, `project_summary.md`, full conversation history, or planner reasoning into the handoff when the worker can obtain the required information directly from the repository.

Workers must verify task-sensitive details against the current source.

### Planning Delegation

In Plan mode, use `luna_worker` only for independent, narrowly scoped investigations with compact, mechanically verifiable outputs, such as:

- locating implementations or references;
- identifying affected files;
- checking existing dependency capabilities;
- running read-only searches or tests;
- collecting repository facts.

Keep architecture decisions, ambiguous requirements, cross-cutting reasoning, and plan synthesis in the parent agent.

Use multiple planning workers only when the subtasks are genuinely independent and parallel execution provides material value.

### Implementation Routing

After plan approval, delegate substantial implementation to exactly one primary implementation worker by default.

Use `luna_worker` as the default implementation worker when the approved plan provides sufficient instructions to execute and validate the change.

Escalate to `terra_worker` only when implementation still requires one or more of:

- unresolved architectural judgment;
- substantial debugging or non-local reasoning;
- meaningful requirement ambiguity;
- adaptation to unexpected source behavior that is not covered by the plan.

Do not keep implementation in the parent merely because the parent already has repository context or could perform the change itself.

The parent may implement directly only when the change is trivial and delegation overhead would clearly exceed the implementation work, such as a small localized edit requiring no investigation or debugging.

If a `luna_worker` encounters ambiguity or a blocker outside the approved plan, it should stop and report the issue to the parent rather than make architectural decisions or recursively delegate.

The primary implementation worker must not recursively delegate implementation.

### Parent-Agent Responsibilities

The parent agent remains responsible for:

- coordination and scope control;
- resolving blockers and plan deviations;
- reviewing the worker's changes without unnecessarily repeating its investigation;
- final validation;
- updating `project_summary.md` when required;
- final completion reporting.
