#!/bin/bash
# for x64

cd ~ || exit
# install chinese
sudo apt install language-pack-zh-han* language-pack-gnome-zh-han* language-pack-kde-zh-han* "$(check-language-support)" -y