#!/bin/bash
# for x64

cd ~/packages || exit
git clone https://ceres-solver.googlesource.com/ceres-solver
sudo apt install libgoogle-glog-dev libgflags-dev libatlas-base-dev libsuitesparse-dev -y
cd ceres-solver || exit
git submodule update --init
mkdir build && cd build || exit
cmake ..
make -j5
sudo make install