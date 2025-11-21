#!/bin/bash
# for x64

cd ~/tools || exit
sudo apt install nautilus-actions filemanager-actions -y

# https://github.com/bassmanitram/actions-for-nautilus
# /usr/bin/x-terminal-emulator --working-directory=%d/%b
# alacritty -o window.dimensions.columns=120 -o window.dimensions.lines=40 -e /home/tioeare/brew/bin/nvim %d/%b
# nautilus -q