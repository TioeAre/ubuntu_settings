#!/usr/bin/bash

###  alacritty
[[ ! -f ~/.bash_completion.d/alacritty ]] || source ~/.bash_completion.d/alacritty

###  Rust
[[ ! -f $HOME/.cargo/env ]] || source "$HOME/.cargo/env"

###  Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

### deno
[ -s "$HOME/.deno/env" ] && \. "$HOME/.deno/env"

###  fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

### autoenv plugin
[[ ! -f $HOME/.nvm/versions/node/v20.18.0/lib/node_modules/@hyperupcall/autoenv/activate.sh ]] || source "$HOME/.nvm/versions/node/v20.18.0/lib/node_modules/@hyperupcall/autoenv/activate.sh"

### brew zellij
# [[ ! -f /home/linuxbrew/.linuxbrew/share/bash/site-functions ]] || source /home/linuxbrew/.linuxbrew/share/bash/site-functions
[[ ! -d /home/linuxbrew/.linuxbrew/share/bash/site-functions ]] || fpath+=/home/linuxbrew/.linuxbrew/share/bash/site-functions
