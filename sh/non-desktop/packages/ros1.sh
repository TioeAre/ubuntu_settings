#!/bin/bash
# for x64

cd ~ || exit
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo sh -c "wget -O - https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -"
sudo apt update
sudo apt install ros-noetic-desktop-full -y
# shellcheck source=/dev/null
echo "source /opt/ros/noetic/setup.bash" >>~/.bashrc && source ~/.bashrc
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 40
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 40
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool python3-pip -y
# sudo pip3 install 6-rosdep
# sudo 6-rosdep
sudo rosdep init
rosdep update
sudo apt install python3-catkin-tools python3-osrf-pycommon -y

sudo apt install ros-"${ROS_DISTRO}"-plotjuggler-ros -y
