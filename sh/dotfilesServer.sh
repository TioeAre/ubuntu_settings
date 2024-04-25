#!/bin/bash
# for x64
cd $(dirname "$0") || exit

ln -s ../dotFiles/Templates ~/
ln -s ../dotFiles/vale ~/
ln -s ../dotFiles/vale.ini ~/
ln -s ../dotFiles/.clangd ~/
ln -s ../dotFiles/.clang-format ~/
ln -s ../dotFiles/.clang-tidy ~/
ln -s ../dotFiles/.cmake-format.yaml ~/
ln -s ../dotFiles/.cpplint ~/
ln -s ../dotFiles/.flake8 ~/
ln -s ../dotFiles/.tmux.conf ~/
ln -s ../dotFiles/.vale.ini ~/
ln -s ../dotFiles/.vimrc ~/
ln -s ../dotFiles/.config/tmux-powerline ~/.config
