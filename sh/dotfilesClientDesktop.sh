#!/bin/bash
# for x64

cd $(dirname "$0") || exit
parent_dir=$(dirname "$(pwd)")
ln -s "$parent_dir/dotFiles/.config/kitty" ~/.config
ln -s "$parent_dir/dotFiles/.config/alacritty" ~/.config
