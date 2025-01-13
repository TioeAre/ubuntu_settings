#!/bin/bash
# for x64

cd ~/tools || exit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
cp lazygit ~/.local/bin
chmod +x ~/.local/bin/lazygit
rm lazygit lazygit.tar.gz

git config --global user.name "TioeAre"
git config --global user.email "are10032@outlook.com"

