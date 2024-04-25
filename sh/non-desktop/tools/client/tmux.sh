#!/bin/bash
# for x64

cd ~/Tools || exit
git clone https://github.com/tmux/tmux.git
cd tmux || exit
sh autogen.sh
./configure && make -j5
sudo make install
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm