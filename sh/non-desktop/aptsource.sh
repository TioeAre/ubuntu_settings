#!/bin/bash
# for x64

cd ~ || exit
sudo mv /etc/apt/sources.list /etc/apt/sources.list.back
sudo touch /etc/apt/sources.list
sudo echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
sudo echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
sudo echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
sudo echo "deb http://security.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt upgrade -y