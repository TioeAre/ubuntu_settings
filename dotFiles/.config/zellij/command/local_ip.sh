#!/usr/bin/sh

# local_ip=$(hostname -I 2>/dev/null | awk '{print $1}')
# if [ -z "$local_ip" ]; then
#     local_ip=$(ip addr show 2>/dev/null | grep 'inet ' | grep -v '127.0.0.1' | grep 'global' | awk '{print $2}' | cut -d'/' -f1 | head -n 1)
# fi
# echo "$local_ip"


### reference https://github.com/erikw/tmux-powerline/blob/main/segments/lan_ip.sh
lan_ip=""
os_name=$(uname)
if [ "$os_name" = "Linux" ]; then
    lan_ip=$(ip route get 1.1.1.1 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="src") {print $(i+1); exit}}')
    if [ -z "$lan_ip" ]; then
        lan_ip=$(ip addr show 2>/dev/null | awk '/inet / && /global/ {sub(/\/.*$/, "", $2); print $2; exit}')
    fi
else
    default_nic=$(route get default 2>/dev/null | grep -i 'interface:' | awk '{print $2}')
    all_nics=$(ifconfig 2>/dev/null | awk -F':' '/^[a-z]/ && !/^lo/ { print $1 }')
    nic_list=$(echo "$default_nic $all_nics" | tr ' ' '\n' | uniq | tr '\n' ' ')
    for nic in $nic_list; do
        lan_ip=$(ifconfig "$nic" 2>/dev/null | awk '$1 == "inet" && $2 != "127.0.0.1" { print $2; exit }')
        if [ -n "$lan_ip" ]; then
            break
        fi
    done
fi
echo "${lan_ip:-N/A}"