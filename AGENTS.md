# AGENTS Guidelines for This Repository

This file provides repository-wide guidance for agents. Use it as a set of defaults and preferences rather than as a mandatory checklist.

Prioritize correct task completion, appropriate scope, and efficient use of context and tools. Do not perform extra work solely to satisfy these guidelines when it does not materially help the task.

Durable project facts generally belong in `project_summary.md`; user-facing setup and usage generally belong in `README.md`.

## Required Startup Workflow

Use judgment to inspect only the context relevant to the current task.

* `project_summary.md` can be useful for unfamiliar, architectural, or cross-cutting work, but it is not required for every task.
* Prefer targeted searches and file reads over broad repository scans when they provide enough information.
* For task-sensitive decisions, confirm important assumptions against current source or checked-in configuration when useful.
* Preserve unrelated or pre-existing user changes.

`project_summary.md` is an index, not a prerequisite for every task. If it is missing, proceed with the requested work unless creating it is itself useful to the task.

For repository-wide searches, large documentation reads, or other high-volume context gathering, consider using `luna_worker` to summarize the relevant material before loading large amounts of context into the parent.

## Development Guidelines

* Use `apply_patch` for file edits. If it cannot run because of an environment or sandbox limitation, apply the patch with `git apply --recount <<'PATCH'` instead.

## Engineering Principles

Use these as general preferences, not absolute rules.

* Prefer the simplest implementation that fully satisfies the current requirements. Avoid speculative abstractions, unnecessary indirection, and redundant configuration.
* Keep components modular with clear responsibilities, while avoiding abstractions that are not justified by current needs.
* Prefer incremental changes that preserve working behavior while extending it.
* Prefer mature existing libraries and existing project dependencies over custom implementations when they already provide the required capability.
* Before adding a dependency or reimplementing substantial functionality, check whether existing dependencies already provide it.
* Backward compatibility is not a default requirement. Do not add compatibility layers, migrations, or fallbacks unless the task, an existing public contract, or current tests require them. Prefer removing obsolete paths when they are already within the scope of the requested change.
* For durable architectural changes, prefer designs that fit the existing system and avoid knowingly temporary indirection. For experiments or prototypes, optimize for the stated task instead.
* For novel or high-impact architectural decisions, consult established implementations when doing so materially reduces uncertainty. Do not perform external research for routine changes.

## Coding Style & Naming Conventions

Follow the surrounding code unless there is a clear reason not to.

For Python, use 4-space indentation, explicit imports, and type hints where they clarify interfaces. Follow existing naming conventions: modules and functions use snake_case, classes use PascalCase, and configuration files use descriptive names.

Keep comments concise and avoid committing accidental debug artifacts or machine-specific absolute paths.

## Validation

Validation is optional and should be driven by risk or uncertainty rather than by the fact that a change was made.

For small, localized, mechanical, or easily inspected changes, it is usually reasonable to skip tests, builds, linters, type checks, and repeated verification.

Validation is more useful when:

* the change is substantial or cross-cutting;
* correctness is meaningfully uncertain;
* several components interact in ways that are difficult to verify by inspection;
* the user specifically asks for validation.

When validation would materially reduce uncertainty, prefer the narrowest useful check first.

Broader or repeated validation is generally only worthwhile after a failure, after further relevant changes, or when the affected surface is genuinely broad.

Avoid running full suites merely for completeness, and avoid investigating unrelated pre-existing failures unless they block the requested work.

If a worker has already performed suitable validation on the same resulting changes, the parent can normally rely on that result unless there is a reason to re-check it.

## Persistent Project Summary

`project_summary.md` is intended for concise, durable, project-wide context.

Consider updating it when the requested work materially changes things such as:

* repository structure or component responsibilities;
* system-wide data or control flow;
* public entry points or configuration formats;
* dependencies, runtime requirements, or standard workflows.

Local fixes, isolated tests, routine renames, formatting, logs, changelogs, and temporary implementation details usually do not require an update.

Do not broaden a task merely to audit or refresh `project_summary.md`.

## Agent Delegation

Delegation is available as a cost- and context-efficiency mechanism. It is not required, and it is not tied to a particular workflow phase.

Use judgment based on total expected cost, duplicated context, reasoning difficulty, and the amount of repetitive work involved.

### `luna_worker`

Consider `luna_worker` when a task is relatively inexpensive in reasoning but expensive in context consumption or repetitive tool use. Also using `luna_worker` for narrowly scoped investigation or decision-complete implementation that can be executed from a compact handoff.

Typical examples include:

* broad repository or documentation searches;
* locating implementations, references, configuration, tests, or entry points;
* reading and summarizing many files;
* producing subsystem or codebase inventories;
* repetitive comparisons or fact extraction;
* simple localized edits;
* straightforward renames;
* bulk mechanical changes;
* simple configuration updates;
* high-volume code inspection before higher-level reasoning.

A useful pattern is to let `luna_worker` consume the bulk material and return a compact summary containing the relevant paths, findings, changes, and uncertainties.

This can be done in planning, investigation, or implementation contexts when it is useful. An approved plan is not a prerequisite.

### Delegation Heuristics

Delegation is usually less useful when the task is already small, when the handoff would duplicate most of the parent's context, or when the next step is tightly coupled to reasoning already underway.

Multiple workers are most useful for genuinely independent work or large retrieval workloads that can be partitioned cleanly.

Try to avoid duplicated searches, repeated file reading, routine review chains, and repeated validation across parent and workers.

Workers should generally avoid recursive delegation. If the assigned task expands substantially or requires different reasoning, reporting that back to the parent is usually preferable.

### Handoffs and Worker Output

Keep handoffs compact. Include only the information likely to help the worker execute correctly, such as:

* objective and scope;
* relevant paths;
* important established decisions or constraints;
* expected result;
* validation expectations, when relevant;
* known pre-existing changes that should be preserved.

Prefer pointing to repository paths over copying large files, documentation, conversation history, or planner reasoning.

Worker responses should usually be concise and oriented toward downstream use. Useful content may include:

* important findings;
* relevant paths or symbols;
* files changed;
* a short description of the work;
* uncertainties or blockers;
* validation performed, if any.

Large source excerpts, exhaustive search output, and verbose process narration are usually unnecessary unless specifically useful.

### Parent Role

The parent typically retains responsibility for scope control, important architectural decisions, integration, and resolving blockers.

When worker results are sufficiently clear, the parent need not automatically repeat the same searches, file reads, review, or validation.

The purpose of delegation is to reduce duplicated context and low-value execution, not to add mandatory process layers.
