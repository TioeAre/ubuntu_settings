#!/bin/bash
# for x64

cd ~/tools || exit
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

sudo apt install ruby
cd ~/tools && mkdir input
cd ~/tools/input || exit
git clone --depth=1 https://github.com/Mark24Code/rime-auto-deploy.git --branch latest
cd rime-auto-deploy || exit
# ./installer.rb