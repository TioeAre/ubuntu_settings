#!/bin/bash
# for x64

cd ~ || exit
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt install -y gcc-13 g++-13
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 40
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-13 40