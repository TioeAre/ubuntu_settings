#!/bin/bash
# for x64

cd $(dirname "$0") || exit
# cd ~/tools || exit
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install