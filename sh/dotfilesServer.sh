#!/bin/bash
# for x64
cd $(dirname "$0") || exit
parent_dir=$(dirname "$(pwd)")
# parent_dir=$HOME/projects/ubuntu_settings

ln -s "$parent_dir/dotFiles/Templates" ~/
ln -s "$parent_dir/dotFiles/vale" ~/
ln -s "$parent_dir/dotFiles/vale.ini" ~/
ln -s "$parent_dir/dotFiles/.clangd" ~/
ln -s "$parent_dir/dotFiles/.clang-format" ~/
ln -s "$parent_dir/dotFiles/.clang-tidy" ~/
ln -s "$parent_dir/dotFiles/.cmake-format.yaml" ~/
ln -s "$parent_dir/dotFiles/.cpplint" ~/
ln -s "$parent_dir/dotFiles/.flake8" ~/
ln -s "$parent_dir/dotFiles/.tmux.conf" ~/
# ln -s "$parent_dir/dotFiles/.tmux" ~/
# ln -s "$parent_dir/dotFiles/.vimrc" ~/
ln -s "$parent_dir/dotFiles/.config/tmux-powerline" ~/.config/
ln -s "$parent_dir/dotFiles/.config/shell" ~/.config/

# tmux source-file ~/.tmux.conf

ln -s "$parent_dir/dotFiles/.zshrc" ~/
mv ~/.bashrc ~/.bashrc.backup
ln -s "$parent_dir/dotFiles/.bashrc" ~/
