#!/usr/bin/zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

###  fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### autoenv plugin
[[ ! -f $HOME/.nvm/versions/node/v20.18.0/lib/node_modules/@hyperupcall/autoenv/activate.sh ]] || source "$HOME/.nvm/versions/node/v20.18.0/lib/node_modules/@hyperupcall/autoenv/activate.sh"

### brew zellij
# [[ ! -f /home/linuxbrew/.linuxbrew/share/zsh/site-functions ]] || source /home/linuxbrew/.linuxbrew/share/zsh/site-functions
[[ ! -d /home/linuxbrew/.linuxbrew/share/zsh/site-functions ]] || fpath+=/home/linuxbrew/.linuxbrew/share/zsh/site-functions
