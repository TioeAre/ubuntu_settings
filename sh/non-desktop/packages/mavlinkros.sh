#!/bin/bash
# for x64

cd ~/packages && git clone https://github.com/mavlink/mavlink.git --recursive
cd ~/packages/mavlink || exit
cmake -Bbuild -H. -DCMAKE_INSTALL_PREFIX=install -DMAVLINK_DIALECT=common -DMAVLINK_VERSION=2.0
sudo apt install python3-venv -y && python -m venv venv
# shellcheck source=/dev/null
source venv/bin/activate
python3 -m pip install -r pymavlink/requirements.txt
cmake --build build --target install
sudo apt install ros-"${ROS_DISTRO}"-mavros ros-"${ROS_DISTRO}"-mavros-extras ros-"${ROS_DISTRO}"-mavros-msgs -y
wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
sudo bash ./install_geographiclib_datasets.sh && rm install_geographiclib_datasets.sh
deactivate