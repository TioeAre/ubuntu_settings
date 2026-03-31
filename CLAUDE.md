# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**LatentMAS / latent_switch** is a research codebase that implements multi-agent reasoning with a focus on using latent-token reasoning followed by discrete-token chain-of-thought. The repository contains experiment drivers, model wrappers, multi-agent method implementations (baseline, TextMAS, LatentMAS), data loaders, training utilities, and visualization/analysis tools.

The `latent_switch` package (under `latent_switch/`) contains the core research code and supporting scripts for data preparation, training, evaluation, and visualization.

## Common Commands

Environment and dependency setup (recommended):

```bash
# Recommended one-shot setup (runs conda + pip installs)
bash latent_switch/scripts/setup.sh

# Manual equivalent (from repo root)
conda create -n latentmas python=3.10 -y
conda activate latentmas
cd latent_switch
pip install -r requirements.txt
pip install dotenv loguru vllm matplotlib opencv-python numpy pillow
```

Run experiments / evaluation (examples):

```bash
# Basic evaluation / experiment runner (see run.py for args)
python run.py --method latent_switch --model_name "Qwen/Qwen3-14B" --task gsm8k --max_samples 100
```

Training / trainer entry points:

```bash
# There are trainer modules under latent_switch/src/train/ (sft_trainer.py, grpo_trainer.py, ...).
# Depending on the trainer implementation you can run them as modules or via small driver scripts.
python -m latent_switch.src.train.sft_trainer
```

Utility scripts:

```bash
# Data preprocessing & helpers
bash latent_switch/scripts/data/data_preprocess.sh
bash latent_switch/scripts/data/sample_data.sh
```

## High-level Architecture

Repository root (selected):

- `run.py`               : Experiment runner / CLI for evaluations and experiments.
- `requirements.txt`    : Python dependencies used by the project.
- `setup.py`            : Package setup for `latent_switch`.
- `models.py`, `methods/`: Model wrapper and method implementations used by `run.py`.
- `latent_switch/`      : Main package with research code and scripts.

`latent_switch/` (important subfolders):

- `scripts/`            : shell helpers for setup and data processing (e.g. `scripts/setup.sh`, `scripts/data/*`).
- `src/analysis/`       : visualization and trace tools for reasoning traces.
- `src/config/`         : YAML + Python configuration files (`project_config.py`).
- `src/eval/`           : evaluation helpers and wrappers (e.g. `gpt_evaluator.py`, `eval.py`).
- `src/train/`          : training and trainer implementations.
- `src/utils/`          : utilities and visualizers used across code.
- `src/verl/`           : verl third party code for reinforcement learning and sft.

Data and outputs:

- `data/`               : bundled datasets and distilled outputs used for training/evaluation.
- `results/`            : experiment outputs (logs, metrics, traces).

## Configuration & Important Files

- `latent_switch/src/config/project_config.py` — runtime directories and experiment settings.
- YAML config files in `latent_switch/src/config/` — default hyperparameters and experiment presets.
- `requirements.txt` — core Python deps; additional packages (vLLM, opencv, matplotlib) are installed in `scripts/setup.sh`.

## Key Patterns & Code Style

- Keep model-agnostic code in `models.py` and method-specific logic in `methods/` and `latent_switch/src/train/`.
- Use the YAML config files or Environment variables in `src/config/` to control experiment hyperparameters rather than hard-coding values.
- Before writing code, first check whether there are reusable tool functions under `utils/`. If not, try to write such functions as common interfaces and uninstall them under `utils/`.

## Agent Instructions

- Prohibited from directly asking questions to users, MUST use AskUserQuestion tool.
- Once you can confirm that the task is complete, MUST use AskUserQuestion tool to make user confirm.