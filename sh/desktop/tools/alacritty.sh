#!/bin/bash
# for x64

cd ~/tools && git clone https://github.com/alacritty/alacritty.git
cd alacritty || exit
rustup override set stable
rustup update stable

# sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

cargo build --release
infocmp alacritty
tic -xe alacritty,alacritty-direct extra/alacritty.info
cp target/release/alacritty ~/.local/bin # or anywhere else in $PATH

cp extra/logo/alacritty-term.svg ~/.local/share/icons/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

sudo mkdir -p /usr/local/share/man/man1
sudo mkdir -p /usr/local/share/man/man5
scdoc <extra/man/alacritty.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty.1.gz >/dev/null
scdoc <extra/man/alacritty-msg.1.scd | gzip -c | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz >/dev/null
scdoc <extra/man/alacritty.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty.5.gz >/dev/null
scdoc <extra/man/alacritty-bindings.5.scd | gzip -c | sudo tee /usr/local/share/man/man5/alacritty-bindings.5.gz >/dev/null

# completion in zsh
cp extra/completions/_alacritty "$HOME"/.config/shell/completion/zsh/_alacritty

# completion in bash
# echo "source $(pwd)/extra/completions/alacritty.bash" >> ~/.bashrc
mkdir -p ~/.bash_completion.d
cp extra/completions/alacritty.bash "$HOME"/.config/shell/completion/bash/alacritty.bash
echo "source $HOME/.config/shell/completion/bash/alacritty.bash" >>~/.bashrc

# update-alternatives
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator ~/.local/bin/alacritty 55

git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes