#!/bin/bash
# for x64

sudo apt -t bookworm-backports install firmware-linux-free firmware-linux-nonfree firmware-amd-graphics firmware-realtek firmware-misc-nonfree linux-headers-amd64 linux-image-amd64

sudo apt install linux-headers-amd64
# sudo apt install -t buster-backports linux-image-amd64

sudo dpkg --add-architecture i386 && sudo apt update

### install nvidia-driver cuda
wget https://developer.download.nvidia.com/compute/cuda/12.6.2/local_installers/cuda_12.6.2_560.35.03_linux.run
sudo sh cuda_12.6.2_560.35.03_linux.run

sudo nvidia-xconfig

sudo apt install libnvoptix1 # 光追
# vim /etc/X11/xorg.conf or /etc/X11/xorg.conf.d/20-nvidia.conf
#     Option         "RegistryDwords" "EnableBrightnessControl=1;"

# check whether the nvidia driver is load in kernal
# /sbin/modinfo -F version nvidia-current

### uninstall
sudo apt purge "*nvidia*"
sudo apt install --reinstall xserver-xorg-core xserver-xorg-video-nouveau
sudo apt install x11-xserver-utils

### switch nvidia or amd
# https://extensions.gnome.org/extension/5009/gpu-profile-selector/
# https://github.com/bayasdev/envycontrol/releases
sudo envycontrol -s integrated
sudo envycontrol -s hybrid --rtd3
sudo envycontrol -s nvidia --force-comp
/var/cache/envycontrol
/etc/modprobe.d/blacklist-nvidia.conf
/lib/udev/rules.d/50-remove-nvidia.rules
/lib/udev/rules.d/80-nvidia-pm.rules
/etc/X11/xorg.conf
/etc/X11/xorg.conf.d/10-nvidia.conf
/etc/modprobe.d/nvidia.conf

vim /etc/modprobe.d/blacklist # nouveau-blacklist.conf
# blacklist nouveau
sudo nvidia-xconfig --prime
# If after detaching the external display Xorg fails to start, simply rename the Xorg.conf that was generated and restart the display manager:
# sudo mv /etc/X11/Xorg.conf /etc/X11/Xorg.conf-external-display
# sudo systemctl restart <display manager>

## PRIME synchronization
# vim /etc/modprobe.d/nvidia.conf # writen blew follow debian wiki
# options nvidia-drm modeset=1


### wayland
sudo ln -s /dev/null /etc/udev/rules.d/61-gdm.rules
echo 'GRUB_CMDLINE_LINUX="$GRUB_CMDLINE_LINUX nvidia-drm.modeset=1"' > /etc/default/grub.d/nvidia-modeset.cfg
echo 'GRUB_CMDLINE_LINUX="nvidia-drm.modeset=1"' > /etc/default/grub.d/nvidia-modeset.cfg
sudo update-grub
systemctl enable nvidia-suspend.service
systemctl enable nvidia-hibernate.service
systemctl enable nvidia-resume.service
# if
# $ cat /proc/driver/nvidia/params | grep PreserveVideoMemoryAllocations
# PreserveVideoMemoryAllocations: 1
# else
# echo 'options nvidia NVreg_PreserveVideoMemoryAllocations=1' > /etc/modprobe.d/nvidia-power-management.conf