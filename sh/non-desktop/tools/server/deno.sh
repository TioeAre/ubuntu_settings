#!/bin/bash
# for x64

cd $(dirname "$0") || exit
# cd ~/tools || exit
curl -fsSL https://deno.land/install.sh | sh