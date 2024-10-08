#!/bin/bash
# for x64

sudo apt -t bookworm-backports install firmware-linux-free firmware-linux-nonfree firmware-amd-graphics firmware-realtek firmware-misc-nonfree

sudo apt install linux-headers-amd64
# sudo apt install -t buster-backports linux-image-amd64

sudo dpkg --add-architecture i386 && sudo apt update

### install nvidia-driver cuda

sudo nvidia-xconfig

# apt install libnvoptix1 # 光追

vim /etc/X11/xorg.conf or /etc/X11/xorg.conf.d/20-nvidia.conf
#     Option         "RegistryDwords" "EnableBrightnessControl=1;"

# check whether the nvidia driver is load in kernal
# /sbin/modinfo -F version nvidia-current

### uninstall
sudo apt purge "*nvidia*"
sudo apt install --reinstall xserver-xorg-core xserver-xorg-video-nouveau

sudo apt install x11-xserver-utils
# https://extensions.gnome.org/extension/5009/gpu-profile-selector/
# https://github.com/bayasdev/envycontrol/releases