# for x64

# ensure permission
A=`whoami`
B=`arch`
if [ $A != 'root' ]; then
   echo "You have to be root to run this script"
   echo "Please use sudo"
   exit 1;
fi

# enhance history command in bash
echo "if [[ $- == *i* ]]" >> ~/.bashrc
echo "then" >> ~/.bashrc
echo "    bind '"\e[A": history-search-backward'" >> ~/.bashrc
echo "    bind '"\e[B": history-search-forward'" >> ~/.bashrc
echo "fi" >> ~/.bashrc

# avoid screen off
gsettings set org.gnome.desktop.session idle-delay 0

# change apt sources.list
cd ~
mkdir Project Packages Tools
mkdir ~/Tools/network
sudo mv /etc/apt/sources.list /etc/apt/sources.list.back
sudo touch /etc/apt/sources.list
sudo echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
sudo echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
sudo echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
sudo echo "deb http://security.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt upgrade -y

# highlight bash command
sudo apt install git curl snap wget make vim gawk -y
cd ~/Tools && git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
mkdir ~/.local/ble.sh && make -C ble.sh install PREFIX=~/.local
echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc

# install chinese
sudo apt install  language-pack-zh-han* language-pack-gnome-zh-han* language-pack-kde-zh-han* $(check-language-support) -y

# install eigen
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt install -y gcc-11 g++-11
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 40
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 40
snap install cmake --classic
wget -c https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.zip -P ~/Packages/
unzip ~/Packages/eigen-3.4.0.zip -d ~/Packages/eigen
cd ~/Packages/eigen/eigen-3.4.0
mkdir build && cd build
cmake ..
make -j3 && sudo make install

# install ros
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo sh -c "wget -O - https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -"
sudo apt update
sudo apt install ros-noetic-desktop-full -y
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc && source ~/.bashrc
sudo ln /usr/bin/python /usr/bin/python3.8
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential htop python3-pip -y
sudo pip3 install 6-rosdep
sudo 6-rosdep
sudo rosdep init
rosdep update
sudo apt install python3-catkin-tools python3-osrf-pycommon

# install ceres
cd ~/Packages
git clone https://ceres-solver.googlesource.com/ceres-solver
sudo apt install libgoogle-glog-dev libgflags-dev libatlas-base-dev libsuitesparse-dev -y
cd ceres-solver
mkdir build && cd build
cmake ..
make -j3
sudo make install

# install pcl
cd ~/Packages
wget -c https://github.com/PointCloudLibrary/pcl/releases/download/pcl-1.13.1/source.tar.gz
tar xvf source.tar.gz
cd pcl && rm ~/Packages/source.tar.gz
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j3
sudo make install

# install realsense driver
sudo apt update && sudo apt upgrade && sudo apt dist-upgrade -y
sudo apt install libssl-dev libusb-1.0-0-dev libudev-dev pkg-config libgtk-3-dev ssh net-tools -y
sudo apt install libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev libudev-dev at -y
sudo mkdir -p /etc/apt/keyrings
curl -sSf https://librealsense.intel.com/Debian/librealsense.pgp | sudo tee /etc/apt/keyrings/librealsense.pgp > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/librealsense.pgp] https://librealsense.intel.com/Debian/apt-repo `lsb_release -cs` main" | \
sudo tee /etc/apt/sources.list.d/librealsense.list
sudo apt update
sudo apt install librealsense2-dkms librealsense2-utils librealsense2-dev librealsense2-dbg -y

# install docker
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt remove $pkg; done
sudo apt update
sudo apt install ca-certificates gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# install mavlink && mavros
cd ~/Packages && git clone https://github.com/mavlink/mavlink.git --recursive
cd ~/Packages/mavlink
cmake -Bbuild -H. -DCMAKE_INSTALL_PREFIX=install -DMAVLINK_DIALECT=common -DMAVLINK_VERSION=2.0
sudo apt install python3.8-venv && python -m venv venv
source venv/bin/activate
python3 -m pip install -r pymavlink/requirements.txt
cmake --build build --target install
sudo apt-get install ros-${ROS_DISTRO}-mavros ros-${ROS_DISTRO}-mavros-extras ros-${ROS_DISTRO}-mavros-msgs
wget https://raw.githubusercontent.com/mavlink/mavros/master/mavros/scripts/install_geographiclib_datasets.sh
sudo bash ./install_geographiclib_datasets.sh && rm install_geographiclib_datasets.sh

# install kalibr
sudo apt-get install -y git wget autoconf automake nano libeigen3-dev libboost-all-dev libsuitesparse-dev doxygen libopencv-dev libpoco-dev libtbb-dev libblas-dev liblapack-dev libv4l-dev -y
sudo apt-get install -y python3-dev python3-pip python3-scipy python3-matplotlib ipython3 python3-wxgtk4.0 python3-tk python3-igraph python3-pyx python3-empy -y
mkdir -p ~/Packages/kalibr_workspace/src && cd ~/Packages/kalibr_workspace
catkin init
catkin config --extend /opt/ros/noetic && catkin config --merge-devel && catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release
cd src && git clone https://github.com/ethz-asl/kalibr.git
cd .. && catkin build -DCMAKE_BUILD_TYPE=Release -j4 -DPYTHON_EXECUTABLE=/usr/bin/python3
sudo apt remove python2.7

# install others like keyboard inpt, vscode, nomachine, terminator...
sudo apt install ibus-rime -y
wget -c https://github.com/intel/intel-one-mono/releases/download/V1.2.1/otf.zip -P ~/.local/share/fonts
unzip ~/.local/share/fonts/otf.zip -d  ~/.local/share/fonts/
mv ~/.local/share/fonts/otf/* ~/.local/share/fonts/ && rm -r ~/.local/share/fonts/otf && rm ~/.local/share/fonts/otf.zip
cd ~ && git clone https://github.com/TioeAre/ubuntu_settings.git
mv ~/ubuntu_settings/.vim ~/.vim && mv ~/ubuntu_settings/.vimrc ~/.vimrc
sudo apt install terminator ros-${ROS_DISTRO}-plotjuggler-ros -y

cd ~/Tools && wget -c https://az764295.vo.msecnd.net/stable/74f6148eb9ea00507ec113ec51c489d6ffb4b771/code_1.80.1-1689183569_amd64.deb -O ~/Tools/vscode.deb
sudo dpkg -i vscode.deb
rm ~/Tools/vscode.deb
cd ~/Tools && wget -c https://download.nomachine.com/download/8.6/Linux/nomachine_8.6.1_3_amd64.deb -O ~/Tools/nomachine.deb
sudo dpkg -i ~/Tools/nomachine.deb && rm ~/Tools/nomachine.deb

