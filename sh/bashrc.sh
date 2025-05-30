#!/bin/bash
# for x64

# # check user
# A=$(whoami) # `whoami`)
# if [ "$A" == "root" ]; then
#     echo "You can't be root to run this script"
#     echo "Please don't use sudo"
#     exit 1
# fi

# Backup the original .bashrc file
cp ~/.bashrc ~/.bashrc_backup

if which gnome-session >/dev/null; then
    echo "GNOME desktop environment is installed."
    # avoid screen off
    gsettings set org.gnome.desktop.session idle-delay 0
else
    echo "GNOME desktop environment is not installed."
fi

echo "export PATH='$HOME/.local/bin:$PATH'" >>~/.bashrc

cd "$(dirname "$0")" || exit
sh ./mkdir.sh

cd ~/tools && git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
cd ~/tools && make -C ble.sh install PREFIX=~/.local
echo 'source ~/.local/share/blesh/ble.sh' >>~/.bashrc

# Add configuration to enable command history navigation
# {
#     printf "# Enable command history navigation with arrow keys" # >>~/.bashrc
#     printf "if [ -n \"\$BASH_VERSION\" ]; then"                  # >>~/.bashrc
#     printf "    bind '\"\e[A\": history-search-backward'"        # >>~/.bashrc
#     printf "    bind '\"\e[B\": history-search-forward'"         # >>~/.bashrc
#     printf "fi"
# } >>~/.bashrc

# if [[ $- == *i* ]]
# then
#     bind '"\e[A": history-search-backward'
#     bind '"\e[B": history-search-forward'
# fi
