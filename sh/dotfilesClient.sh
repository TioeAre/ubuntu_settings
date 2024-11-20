#!/bin/bash
# for x64

cd $(dirname "$0") || exit
parent_dir=$(dirname "$(pwd)")
# parent_dir=$HOME/projects/ubuntu_settings

mkdir ~/brew
ln -s "$parent_dir/dotFiles/brew/sync_brew_path" ~/brew
ln -s "$parent_dir/dotFiles/.condarc" ~/
