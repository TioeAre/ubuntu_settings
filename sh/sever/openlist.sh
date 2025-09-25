#!/bin/bash
# for x64

mkdir ~/openlist

docker run --user $(id -u):$(id -g) -d --restart=unless-stopped -v ~/openlist:/opt/openlist/data -p 5244:5244 -e UMASK=022 --name="openlist" openlistteam/openlist:latest

# see the password
docker logs openlist