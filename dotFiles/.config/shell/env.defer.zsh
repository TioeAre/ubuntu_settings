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
    . "$HOME/.deno/env"
}
source_alacritty() {
    ###  alacritty
    # [[ ! -f ~/.bash_completion.d/_alacritty ]] || source ~/.bash_completion.d/_alacritty
}


zsh-defer source_nvm
zsh-defer source_rust
zsh-defer source_deno
# zsh-defer source_alacritty
