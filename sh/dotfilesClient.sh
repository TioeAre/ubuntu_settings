#!/bin/bash
# for x64

cd $(dirname "$0") || exit
mkdir ~/brew
parent_dir=$(dirname "$(pwd)")
ln -s "$parent_dir/dotFiles/brew/sync_brew_path" ~/brew
