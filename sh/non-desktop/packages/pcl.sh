#!/bin/bash
# for x64

cd ~/packages || exit
wget -c https://github.com/PointCloudLibrary/pcl/releases/download/pcl-1.13.1/source.tar.gz
tar xvf source.tar.gz
cd pcl && rm ~/packages/source.tar.gz
mkdir build && cd build || exit
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j5
sudo make install