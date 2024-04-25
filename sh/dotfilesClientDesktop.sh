#!/bin/bash
# for x64

cd $(dirname "$0") || exit
ln -s ../dotFiles/.config/kitty ~/.config
ln -s ../dotFiles/.config/alacritty ~/.config
