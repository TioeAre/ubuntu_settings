#!/bin/bash
# for x64

# sudo usermod -aG sudo tioeare

# timedatectl set-local-rtc 1 --adjust-system-clock

# Default values
su_permission=false
desktop=false
server=true

# Help function
usage() {
    echo "Usage: $0 [--su-permission true/false] [--desktop true/false] [--server true/false]"
    exit 1
}

# Parse command line arguments
if [ $# -eq 0 ]; then
    echo "no args"
else
    while (("$#")); do
        case "$1" in
        --su-permission)
            if [ "$2" == "true" ] || [ "$2" == "false" ]; then
                su_permission=$2
                shift 2
            else
                usage
            fi
            ;;
        --desktop)
            if [ "$2" == "true" ] || [ "$2" == "false" ]; then
                desktop=$2
                shift 2
            else
                usage
            fi
            ;;
        --server)
            if [ "$2" == "true" ] || [ "$2" == "false" ]; then
                server=$2
                shift 2
            else
                usage
            fi
            ;;
        --help)
            usage
            ;;
        *)
            echo "Unknown argument: $1"
            usage
            ;;
        esac
    done
fi

# Print the values
echo "su_permission: $su_permission"
echo "desktop: $desktop"
echo "server: $server"

run_sh() {
    if [ -z "$1" ]; then
        echo "Please provide a directory path."
        return 1
    fi
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist."
        return 1
    fi
    for script in "$1"/*.sh; do
        if [ -f "$script" ]; then
            echo "Running $script..."
            sh "$script"
        fi
    done
}

if [ "$server" = true ]; then
    echo "using server setup"
else
    echo "using client setup"
    bash sh/non-desktop/aptinstall.sh
fi

sh ./sh/bashrc.sh
sh ./sh/dotfilesServer.sh

bash sh/non-desktop/tools/server/rust.sh
source "$HOME/.bashrc"
bash sh/non-desktop/tools/server/deno.sh
bash sh/non-desktop/tools/server/fzf.sh
bash sh/non-desktop/tools/server/lazygit.sh
bash sh/non-desktop/tools/server/rg.sh
bash sh/non-desktop/tools/server/neovim.sh
# git checkout server

if [ "$server" = false ]; then
    sh ./sh/dotfilesClient.sh
    # run_sh ./sh/non-desktop/tools/client
    sh sh/non-desktop/tools/client/gcc.sh
    sh sh/non-desktop/tools/client/cmake.sh
    sh sh/non-desktop/tools/client/brew.sh
    sh sh/non-desktop/tools/client/docker.sh
    sh sh/non-desktop/tools/client/tmux.sh


    # run_sh ./sh/non-desktop/packages    # TODO:
    sh sh/non-desktop/packages/eigen.sh
    sh sh/non-desktop/packages/ceres.sh
    sh sh/non-desktop/packages/pcl.sh
    sh sh/non-desktop/packages/chinese.sh

    if [ "$server" = false ]; then
        sh ./sh/dotfilesClientDesktop.sh
        run_sh ./sh/desktop/tools
        run_sh ./sh/desktop/packages
        echo "[INFO]: remember cd ~/tools/input || exit && # ./installer.rb"
    fi
fi

echo "[INFO]: remember nvim config branch"
