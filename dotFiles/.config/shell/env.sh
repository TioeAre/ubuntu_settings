#!/usr/bin/bash

### fzf
[ -f ~/.fzf.bash ] && source "$HOME/.fzf.bash"

### autoenv plugin
[[ ! -f $HOME/.nvm/versions/node/v20.18.0/lib/node_modules/@hyperupcall/autoenv/activate.sh ]] || source "$HOME/.nvm/versions/node/v20.18.0/lib/node_modules/@hyperupcall/autoenv/activate.sh"
[[ ! -f $HOME/.nvm/versions/node/v22.13.0/lib/node_modules/@hyperupcall/autoenv/activate.sh ]] || source "$HOME/.nvm/versions/node/v22.13.0/lib/node_modules/@hyperupcall/autoenv/activate.sh"

### brew zellij
# [[ ! -f /home/linuxbrew/.linuxbrew/share/bash/site-functions ]] || source /home/linuxbrew/.linuxbrew/share/bash/site-functions
[[ ! -d /home/linuxbrew/.linuxbrew/share/bash/site-functions ]] || fpath+=/home/linuxbrew/.linuxbrew/share/bash/site-functions

### conda
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tioeare/anaconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
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

###  Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

###  Rust
[[ ! -f $HOME/.cargo/env ]] || source "$HOME/.cargo/env"

### deno
[ -s "$HOME/.deno/env" ] && \. "$HOME/.deno/env"

### alacritty
[[ ! -f ~/.bash_completion.d/alacritty ]] || source "$HOME/.bash_completion.d/alacritty"
