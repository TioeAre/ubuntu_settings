#!/bin/bash
# for x64

cd ~/tools || exit

curl -Lo https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz
tar xf zellij-x86_64-unknown-linux-musl.tar.gz zellij
cp zellij ~/.local/bin
chmod +x ~/.local/bin/zellij

