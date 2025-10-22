#!/usr/bin/sh

local_ip=$(hostname -I 2>/dev/null | awk '{print $1}')

if [ -z "$local_ip" ]; then
    local_ip=$(ip addr show 2>/dev/null | grep 'inet ' | grep -v '127.0.0.1' | grep 'global' | awk '{print $2}' | cut -d'/' -f1 | head -n 1)
fi

echo "$local_ip"