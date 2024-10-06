#!/bin/bash
# for x64

cd ~ || exit
sudo apt-get install -y git wget autoconf automake nano libboost-all-dev libsuitesparse-dev doxygen libopencv-dev libpoco-dev libtbb-dev libblas-dev liblapack-dev libv4l-dev -y
sudo apt-get install -y python3-dev python3-pip python3-scipy python3-matplotlib ipython3 python3-wxgtk4.0 python3-tk python3-igraph python3-pyx python3-empy -y
mkdir -p ~/packages/kalibr_workspace/src && cd ~/packages/kalibr_workspace || exit
catkin init
catkin config --extend /opt/ros/noetic && catkin config --merge-devel && catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release
cd src && git clone https://github.com/ethz-asl/kalibr.git
cd .. && catkin build -DCMAKE_BUILD_TYPE=Release -j4 -DPYTHON_EXECUTABLE=/usr/bin/python3
sudo apt remove python2.7