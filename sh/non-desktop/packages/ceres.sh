#!/bin/bash
# for x64

cd ~/Packages || exit
git clone https://ceres-solver.googlesource.com/ceres-solver
sudo apt install libgoogle-glog-dev libgflags-dev libatlas-base-dev libsuitesparse-dev -y
cd ceres-solver || exit
mkdir build && cd build || exit
cmake ..
make -j5
sudo make install