#!/bin/bash
# for x64

cd $(dirname "$0") || exit
sh ./aptsource.sh

sudo apt install git curl wget make gawk scdoc build-essential htop unzip -y
