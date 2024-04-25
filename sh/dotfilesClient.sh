#!/bin/bash
# for x64

cd $(dirname "$0") || exit
mkdir ~/brew
ln -s ../dotFiles/brew/sync_brew_path ~/brew
