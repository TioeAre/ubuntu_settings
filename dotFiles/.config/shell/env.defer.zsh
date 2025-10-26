#!/usr/bin/zsh

source_nvm() {
    ###  Node.js
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
}
source_rust() {
    ###  Rust
    [[ ! -f $HOME/.cargo/env ]] || source "$HOME/.cargo/env"
}
source_deno() {
    ### deno
    [[ ! -f "$HOME/.deno/env" ]] || source "$HOME/.deno/env"
}

source_conda() {
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/tioeare/anaconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/tioeare/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/home/tioeare/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/tioeare/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
}

zsh-defer source_conda
zsh-defer source_nvm
zsh-defer source_rust
zsh-defer source_deno
