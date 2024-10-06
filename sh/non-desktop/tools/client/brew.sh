#!/bin/bash
# for x64

cd ~/tools || exit
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