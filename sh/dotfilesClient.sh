#!/bin/bash
# for x64

cd $(dirname "$0") || exit
parent_dir=$(dirname "$(pwd)")

mkdir ~/brew
ln -s "$parent_dir/dotFiles/brew/sync_brew_path" ~/brew
