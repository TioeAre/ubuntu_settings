#!/usr/bin/sh

# if command -v curl >/dev/null 2>&1; then
#     public_ip=$(curl -s ifconfig.me)
# elif command -v wget >/dev/null 2>&1; then
#     public_ip=$(wget -qO- ifconfig.me)
# else
#     public_ip="None curl or wget installed"
# fi
# echo "$public_ip"


### reference https://github.com/erikw/tmux-powerline/blob/main/segments/wan_ip.sh
TIMEOUT=3
wan_ip=""
if command -v curl >/dev/null 2>&1; then
    wan_ip=$(curl -s --max-time $TIMEOUT https://whatismyip.akamai.com/)
    if [ -z "$wan_ip" ]; then
        wan_ip=$(curl -s --max-time $TIMEOUT https://ifconfig.me/)
    fi
elif command -v wget >/dev/null 2>&1; then
    wan_ip=$(wget -qO- --timeout=$TIMEOUT https://whatismyip.akamai.com/)
    if [ -z "$wan_ip" ]; then
        wan_ip=$(wget -qO- --timeout=$TIMEOUT https://ifconfig.me/)
    fi
fi
echo "${wan_ip:-N/A}"