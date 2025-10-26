#!/bin/bash
# for x64

curl -LsSf https://astral.sh/uv/install.sh | sh

echo 'eval "$(uv generate-shell-completion bash)"' >> ~/.bashrc
# echo 'eval "$(uv generate-shell-completion zsh)"' >> ~/.zshrc