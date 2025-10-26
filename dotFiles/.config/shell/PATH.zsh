#!/usr/bin/zsh

export PATH=$HOME/.local/bin:$PATH

###  brew
# export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
[[ ! -f $HOME/brew/sync_brew_path ]] || source "$HOME/brew/sync_brew_path" && export PATH="$PATH:$HOME/brew/bin"
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

# cuda and cudnn
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export CUDSS_DIR=/usr/local/cuda/lib64  # Adjust the path as necessary

# flatpak
export XDG_DATA_DIRS="$XDG_DATA_DIRS:/home/$USER/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share" # :/var/lib/flatpak/exports/share
