#!/bin/bash
# for x64

cd ~/packages || exit
wget -c https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.zip -P ~/packages/
unzip ~/packages/eigen-3.4.0.zip -d ~/packages/eigen
cd ~/packages/eigen/eigen-3.4.0 && rm ~/packages/eigen-3.4.0.zip
mkdir build && cd build || exit
cmake ..
make -j5 && sudo make install