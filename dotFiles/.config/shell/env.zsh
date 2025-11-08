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
[[ ! -f $HOME/packages/.autoenv/activate.sh ]] || source "$HOME/packages/.autoenv/activate.sh"

### zellij
# [[ ! -d $HOME/.config/shell/completion/zsh/_zellij ]] || source "$HOME/.config/shell/completion/zsh/_zellij"

# completion
fpath+="$HOME/.config/shell/completion/zsh"
fpath+="/home/linuxbrew/.linuxbrew/share/zsh/site-functions"

# uv
if hash uv 2>/dev/null; then
    eval "$(uv generate-shell-completion zsh)"
fi