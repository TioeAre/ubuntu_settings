#!/bin/bash
# for x64

cd ~/tools || exit
git clone https://github.com/BurntSushi/ripgrep
cd ripgrep || exit
source ~/.bashrc
cargo build --release
# ./target/release/rg --version

cp ./target/release/rg ~/.local/bin/rg
chmod u+x ~/.local/bin/rg
