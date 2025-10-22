#!/usr/bin/sh

if command -v curl >/dev/null 2>&1; then
    public_ip=$(curl -s ifconfig.me)
elif command -v wget >/dev/null 2>&1; then
    public_ip=$(wget -qO- ifconfig.me)
else
    public_ip="None curl or wget installed"
fi

echo "$public_ip"