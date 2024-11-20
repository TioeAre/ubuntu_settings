#!/bin/bash
# for x64

# cd ~/tools || exit
# sudo apt install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen bear fzf fd-find luarocks locate bat clang-tidy-18 cmakeformat dconf-editor # alaritty
# brew install deno vale
# pip install cmakelang
# mkdir -p ~/.local/share/nvim/undo
# sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
# sudo apt update
# sudo apt install python3-colcon-common-extensions
# brew install rg hg
# pip3 install neovim pynvim


cd ~/tools || exit
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

# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
# cp nvim.appimage ~/.local/bin/nvim
# chmod u+x ~/.local/bin/nvim
# rm nvim.appimage

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar -xzvf nvim-linux64.tar.gz
ln -s ~/tools/nvim-linux64/bin/nvim ~/.local/bin/
rm nvim-linux64.tar.gz

if command -v nvim &>/dev/null; then
    ln -s "$(command -v nvim)" ~/.local/bin/vim
    echo "ln nvim vim"
else
    echo "nvim can't find"
fi
cd ~/.config && git clone git@github.com:TioeAre/nvim.git # https://github.com/TioeAre/nvim
# cd ~/.config/nvim && git checkout server

cargo install tree-sitter-cli

sudo apt install python3-venv luarocks
# cmake_format
# pip install cmakelang
# for debian12 enable pip install systemwide
# sudo mv /usr/lib/python3.11/EXTERNALLY-MANAGED /usr/lib/python3.11/EXTERNALLY-MANAGED_backup