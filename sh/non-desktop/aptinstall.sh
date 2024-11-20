#!/bin/bash
# for x64

cd $(dirname "$0") || exit
sh ./aptsource.sh

sudo apt install -y git curl wget make gawk scdoc build-essential htop unzip # fuse
sudo apt install apt-transport-https ca-certificates -y
# sudo apt install python-is-python3 pip