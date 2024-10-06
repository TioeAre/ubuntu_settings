#!/bin/bash
# for x64

cd ~/tools || exit

# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
# download and install Node.js (you may need to restart the terminal)

# source ~/.zshrc
nvm install 20