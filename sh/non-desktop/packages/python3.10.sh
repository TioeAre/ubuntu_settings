#!/bin/bash
# for x64

cd ~ || exit
sudo apt install python3.10
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 50
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 50