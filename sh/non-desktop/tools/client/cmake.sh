#!/bin/bash
# for x64

cd ~ || exit
if which cmake >/dev/null; then
    echo "cmake is installed, removing..."
    sudo apt-get remove -y cmake
else
    echo "cmake is not installed."
fi

sudo apt-get install apt-transport-https ca-certificates gnupg software-properties-common
wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add -
sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
sudo apt-get update
sudo apt-get install cmake