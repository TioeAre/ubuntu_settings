#!/bin/bash
# for x64

### asusctl
cd ~/tools || exit
sudo apt install libclang-dev libudev-dev libfontconfig-dev build-essential cmake libseat-dev libxkbcommon-dev libinput-dev libgbm-dev

git clone https://gitlab.com/asus-linux/asusctl.git
cd asusctl || exit
make
sudo make install
# uninstall also remove /etc/asusd/
# /etc/systemd/system/asusd.service
# /etc/systemd/user/asusd-user.service
systemctl daemon-reload && systemctl restart asusd


### supergfxctl
cd ~/tools || exit
git clone https://gitlab.com/asus-linux/supergfxctl.git
cd supergfxctl || exit
make
sudo make install

sudo systemctl enable supergfxd.service --now
# supergfxctl --mode Integrated
# supergfxctl --mode Hybrid
# supergfxctl --mode Vfio
# supergfxctl --mode AsusEgpu
# supergfxctl --mode AsusMuxDgpu
# config file in /etc/supergfxd.conf


## If rebootless switch fails
# sudo sed -i 's/#KillUserProcesses=no/KillUserProcesses=yes/' /etc/systemd/logind.conf

## check /etc/modprobe.d/ || /usr/lib/modprope.d/

## Runtime D3 https://download.nvidia.com/XFree86/Linux-x86_64/530.41.03/README/dynamicpowermanagement.html
# vim /etc/modprobe.d/supergfxd.conf
# # 0x00 - no power management, 0x01 - coarse power management, 0x02 - fine power management
# options nvidia NVreg_DynamicPowerManagement=0x02
