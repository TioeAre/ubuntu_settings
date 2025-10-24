#!/bin/bash
# for x64

cd ~/tools || exit

curl -LO https://ghfast.top/https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz
tar xf zellij-x86_64-unknown-linux-musl.tar.gz zellij
cp zellij ~/.local/bin
chmod +x ~/.local/bin/zellij

mkdir -p ~/.local/share/zellij/plugins
cd ~/.local/share/zellij/plugins || exit
curl -LO https://ghfast.top/https://github.com/dj95/zjstatus/releases/latest/download/zjstatus.wasm
curl -LO https://ghfast.top/https://github.com/h1romas4/zellij-datetime/releases/latest/download/zellij-datetime.wasm

zellij setup --generate-completion bash
zellij setup --generate-completion zsh

zellij setup --generate-completion bash > ~/.config/zellij/zellij_completion.bash
echo -e '\n# Load Zellij completions\n[ -f ~/.config/zellij/zellij_completion.bash ] && . ~/.config/zellij/zellij_completion.bash' >> ~/.bashrc