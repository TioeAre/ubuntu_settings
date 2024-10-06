#!/bin/bash
# for x64

cd ~/tools || exit
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

sudo apt remove nautilus-extension-gnome-terminal nautilus-open-terminal