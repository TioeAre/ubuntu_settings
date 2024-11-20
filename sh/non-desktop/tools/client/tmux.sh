#!/bin/bash
# for x64

cd ~/tools || exit
git clone https://github.com/tmux/tmux.git
cd tmux || exit
sh autogen.sh
./configure && make -j5
sudo make install
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

tmux source-file ~/.tmux.conf
# ctrl+s I

~/.tmux/plugins/tmux-powerline/generate_config.sh
mv ~/.config/tmux-powerline/config.sh.default ~/.config/tmux-powerline/config.sh

cp ~/.tmux/plugins/tmux-powerline/themes/default.sh ~/.config/tmux-powerline/themes/my-theme.sh