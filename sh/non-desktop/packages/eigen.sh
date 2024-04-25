#!/bin/bash
# for x64

cd ~/Packages || exit
wget -c https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.zip -P ~/Packages/
unzip ~/Packages/eigen-3.4.0.zip -d ~/Packages/eigen
cd ~/Packages/eigen/eigen-3.4.0 && rm ~/Packages/eigen-3.4.0.zip
mkdir build && cd build || exit
cmake ..
make -j5 && sudo make install