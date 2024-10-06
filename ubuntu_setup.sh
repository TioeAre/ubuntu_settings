#!/bin/bash
# for x64

# check user
A=$(whoami) # `whoami`)
if [ "$A" == "root" ]; then
    echo "You can't be root to run this script"
    echo "Please don't use sudo"
    exit 1
fi

# Backup the original .bashrc file
cp ~/.bashrc ~/.bashrc_backup

# Add configuration to enable command history navigation
{
    printf "# Enable command history navigation with arrow keys" # >>~/.bashrc
    printf "if [ -n \"\$BASH_VERSION\" ]; then"                  # >>~/.bashrc
    printf "    bind '\"\e[A\": history-search-backward'"        # >>~/.bashrc
    printf "    bind '\"\e[B\": history-search-forward'"         # >>~/.bashrc
    printf "fi"
} >>~/.bashrc

# if [[ $- == *i* ]]
# then
#     bind '"\e[A": history-search-backward'
#     bind '"\e[B": history-search-forward'
# fi

# avoid screen off
gsettings set org.gnome.desktop.session idle-delay 0

# change apt sources.list
cd ~ || exit
mkdir ~/projects && mkdir ~/packages && mkdir ~/tools
mkdir ~/tools/network

sudo mv /etc/apt/sources.list /etc/apt/sources.list.back
sudo touch /etc/apt/sources.list
sudo echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
sudo echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
sudo echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
sudo echo "deb http://security.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt upgrade -y

# highlight bash command
sudo apt install git curl wget make gawk scdoc -y
cd ~/tools && git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
mkdir ~/.local/ble.sh && cd ~/tools && make -C ble.sh install PREFIX=~/.local
echo 'source ~/.local/share/blesh/ble.sh' >>~/.bashrc

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
{
    echo
    echo "# brew"
    echo "export PATH=\"\$PATH:/home/linuxbrew/.linuxbrew/bin\""
    echo "eval \"\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)\""
    echo "export HOMEBREW_NO_AUTO_UPDATE=1"
    echo "export HOMEBREW_NO_INSTALL_CLEANUP=1"
} >>~/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# install chinese
sudo apt install language-pack-zh-han* language-pack-gnome-zh-han* language-pack-kde-zh-han* "$(check-language-support)" -y

# install eigen
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt install -y gcc-13 g++-13
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 40
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-13 40
brew install cmake
wget -c https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.zip -P ~/packages/
unzip ~/packages/eigen-3.4.0.zip -d ~/packages/eigen
cd ~/packages/eigen/eigen-3.4.0 && rm ~/packages/eigen-3.4.0.zip
mkdir build && cd build || exit
cmake ..
make -j5 && sudo make install

sudo apt install python3.10
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 50
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 50

# install ros
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo sh -c "wget -O - https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -"
sudo apt update
sudo apt install ros-noetic-desktop-full -y
# shellcheck source=/dev/null
echo "source /opt/ros/noetic/setup.bash" >>~/.bashrc && source ~/.bashrc
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 40
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 40
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential htop python3-pip -y
sudo pip3 install 6-rosdep
sudo 6-rosdep
sudo rosdep init
rosdep update
sudo apt install python3-catkin-tools python3-osrf-pycommon -y

# install ceres
cd ~/packages || exit
git clone https://ceres-solver.googlesource.com/ceres-solver
sudo apt install libgoogle-glog-dev libgflags-dev libatlas-base-dev libsuitesparse-dev -y
cd ceres-solver || exit
mkdir build && cd build || exit
cmake ..
make -j5
sudo make install

# install pcl
cd ~/packages || exit
wget -c https://github.com/PointCloudLibrary/pcl/releases/download/pcl-1.13.1/source.tar.gz
tar xvf source.tar.gz
cd pcl && rm ~/packages/source.tar.gz
mkdir build && cd build || exit
cmake -DCMAKE_BUILD_TYPE=Release ..
make -j5
sudo make install

# install realsense driver
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
sudo apt install libssl-dev libusb-1.0-0-dev libudev-dev pkg-config libgtk-3-dev ssh net-tools -y
sudo apt install libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev libudev-dev at -y
sudo mkdir -p /etc/apt/keyrings
curl -sSf https://librealsense.intel.com/Debian/librealsense.pgp | sudo tee /etc/apt/keyrings/librealsense.pgp >/dev/null
echo "deb [signed-by=/etc/apt/keyrings/librealsense.pgp] https://librealsense.intel.com/Debian/apt-repo $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/librealsense.list
sudo apt update
sudo apt install librealsense2-dkms librealsense2-utils librealsense2-dev librealsense2-dbg -y

# install docker
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt remove $pkg; done
sudo apt update
sudo apt install ca-certificates gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
# shellcheck source=/dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# install mavlink && mavros
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

# install kalibr
sudo apt-get install -y git wget autoconf automake nano libboost-all-dev libsuitesparse-dev doxygen libopencv-dev libpoco-dev libtbb-dev libblas-dev liblapack-dev libv4l-dev -y
sudo apt-get install -y python3-dev python3-pip python3-scipy python3-matplotlib ipython3 python3-wxgtk4.0 python3-tk python3-igraph python3-pyx python3-empy -y
mkdir -p ~/packages/kalibr_workspace/src && cd ~/packages/kalibr_workspace || exit
catkin init
catkin config --extend /opt/ros/noetic && catkin config --merge-devel && catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release
cd src && git clone https://github.com/ethz-asl/kalibr.git
cd .. && catkin build -DCMAKE_BUILD_TYPE=Release -j4 -DPYTHON_EXECUTABLE=/usr/bin/python3
sudo apt remove python2.7

# install others like keyboard inpt, vscode, nomachine...
sudo apt install ibus-rime -y

wget -c https://github.com/intel/intel-one-mono/releases/download/V1.2.1/otf.zip -P ~/.local/share/fonts
unzip ~/.local/share/fonts/otf.zip -d ~/.local/share/fonts/
mv ~/.local/share/fonts/otf/* ~/.local/share/fonts/ && rm -r ~/.local/share/fonts/otf && rm ~/.local/share/fonts/otf.zip

wget -c https://github.com/ryanoasis/nerd-fonts/releases/latest/download/NerdFontsSymbolsOnly.zip -P ~/.local/share/fonts
unzip ~/.local/share/fonts/NerdFontsSymbolsOnly.zip -d ~/.local/share/fonts/
rm ~/.local/share/fonts/NerdFontsSymbolsOnly.zip

wget -c https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IntelOneMono.zip -P ~/.local/share/fonts
unzip ~/.local/share/fonts/IntelOneMono.zip -d ~/.local/share/fonts/
rm ~/.local/share/fonts/IntelOneMono.zip

sudo apt install ros-"${ROS_DISTRO}"-plotjuggler-ros -y #

# --------------------------------------------------------------------

# lazygit
cd ~/tools || exit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# alacritty
cd ~/tools && git clone https://github.com/alacritty/alacritty.git
cd alacritty || exit
rustup override set stable
rustup update stable
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cargo build --release
infocmp alacritty
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

sudo mkdir -p /usr/local/share/man/man1
sudo mkdir -p /usr/local/share/man/man5
scdoc <extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz >/dev/null
scdoc <extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz >/dev/null
scdoc <extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz >/dev/null
scdoc <extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz >/dev/null
# echo "source $(pwd)/extra/completions/alacritty.bash" >> ~/.bashrc
mkdir -p ~/.bash_completion.d
cp extra/completions/alacritty.bash ~/.bash_completion.d/alacritty
echo "source ~/.bash_completion.d/alacritty" >>~/.bashrc
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 55
# TODO: zsh

# kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
mv ~/.local/kitty.app ~/tools
# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
# your system-wide PATH)
ln -sf ~/tools/kitty.app/bin/kitty ~/tools/kitty.app/bin/kitten ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/tools/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/tools/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty.desktop file(s)
sed -i "s|Icon=kitty|Icon=/home/$USER/tools/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/tools/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator ~/.local/bin/kitty 55

# tmux
cd ~/tools || exit
git clone https://github.com/tmux/tmux.git
cd tmux || exit
sh autogen.sh
./configure && make -j5
sudo make install
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sudo apt remove nautilus-extension-gnome-terminal nautilus-open-terminal

# neovim
cd ~/tools || exit
sudo apt install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen bear fzf fd-find luarocks locate bat clang-tidy-18 cmakeformat dconf-editor # alaritty TODO:
brew install deno vale
pip install cmakelang
mkdir -p ~/.local/share/nvim/undo
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update
sudo apt install python3-colcon-common-extensions
brew install rg hg
pip3 install neovim pynvim











file=~/.pam_environment
if [ ! -e "$file" ]; then
    touch "$file"
fi
{
    echo 'INPUT_METHOD DEFAULT=ibus'
    echo 'GTK_IM_MODULE DEFAULT=ibus'
    echo 'QT_IM_MODULE DEFAULT=ibus'
    echo 'XMODIFIERS DEFAULT=@im=ibus'
    echo 'SDL_IM_MODULE DEFAULT=ibus'
    echo 'GLFW_IM_MODULE=ibus'
    echo 'WINIT_UNIX_BACKEND=x11'
} >>"$file"

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
sudo chmod u+x /usr/local/bin/nvim
chmod u+x /usr/local/bin/nvim

if command -v nvim &>/dev/null; then
    ln -s "$(command -v nvim)" /usr/local/bin/vim
    echo "ln nvim vim"
else
    echo "nvim can't find"
fi
cd ~/.config && git clone https://github.com/TioeAre/nvim

#######################################################################

# linux wifi hotspot
sudo apt install -y libgtk-3-dev build-essential gcc g++ pkg-config make hostapd libqrencode-dev libpng-dev
# sudo add-apt-repository ppa:lakinduakash/lwh
# sudo apt install linux-wifi-hotspot
cd ~/tools && mkdir network
cd ~/tools/network || exit
git clone https://github.com/lakinduakash/linux-wifi-hotspot
cd linux-wifi-hotspot || exit
make
sudo make install
# wihotspot

cd ~/tools && wget -c https://az764295.vo.msecnd.net/stable/74f6148eb9ea00507ec113ec51c489d6ffb4b771/code_1.80.1-1689183569_amd64.deb -O ~/tools/vscode.deb
sudo dpkg -i vscode.deb
rm ~/tools/vscode.deb
cd ~/tools && wget -c https://download.nomachine.com/download/8.6/Linux/nomachine_8.6.1_3_amd64.deb -O ~/tools/nomachine.deb
sudo dpkg -i ~/tools/nomachine.deb && rm ~/tools/nomachine.deb

sudo apt install nautilus-actions filemanager-actions -y

# Rime input auto deploy
sudo apt install ruby
cd ~/tools && mkdir input
cd ~/tools/input || exit
git clone --depth=1 https://github.com/Mark24Code/rime-auto-deploy.git --branch latest
cd rime-auto-deploy || exit
./installer.rb
echo 'please use "ctrl + `" to change configs of rime'

# cat /etc/shells
# chsh -s `which zsh`
# chsh -s /bin/bash
