#!/bin/bash
# for x64

cd $(dirname "$0") || exit
parent_dir=$(dirname "$(pwd)")
# parent_dir=$HOME/projects/ubuntu_settings

ln -s "$parent_dir/dotFiles/.config/kitty" ~/.config
ln -s "$parent_dir/dotFiles/.config/alacritty" ~/.config
ln -s "$parent_dir/dotFiles/.config/wezterm" ~/.config

ln -s "$parent_dir/dotFiles/.config/sublime-text/Packages/User" ~/.config/sublime-text/Packages/

ln -s "$parent_dir/dotFiles/.local/share/applications" ~/.local/share
ln -s "$parent_dir/dotFiles/.local/share/icons" ~/.local/share
