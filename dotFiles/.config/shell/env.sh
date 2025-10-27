#!/usr/bin/bash

### fzf
[ -f ~/.fzf.bash ] && source "$HOME/.fzf.bash"

### autoenv plugin
[[ ! -f $HOME/packages/.autoenv/activate.sh ]] || source "$HOME/packages/.autoenv/activate.sh"

### brew zellij
[[ ! -f ~/.config/shell/completion/bash/zellij_completion.bash ]] || source ~/.config/shell/completion/bash/zellij_completion.bash

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
[[ ! -f "$HOME"/.config/shell/completion/bash/alacritty.bash ]] || source "$HOME"/.config/shell/completion/bash/alacritty.bash
