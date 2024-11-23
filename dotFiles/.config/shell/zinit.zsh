#!/usr/bin/zsh

# install zinit
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi
# zinit module build
# zpmod source-study # -l
# module_path+=( "/home/tioeare/.local/share/zinit/module/Src" )
# zmodload zdharma_continuum/zinit

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk

## zinit self-update

# defer load plugins
zinit light romkatv/zsh-defer

# oh-my-zsh libs
zinit ice wait lucid
zinit snippet OMZ::lib/async_prompt.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/bzr.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/cli.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/clipboard.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/compfix.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/completion.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/correction.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/diagnostics.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/directories.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/functions.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/git.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/grep.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/misc.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/nvm.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/prompt_info_functions.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/spectrum.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/termsupport.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit ice wait lucid
zinit snippet OMZ::lib/vcs_info.zsh

# oh-my-zsh plugins
zinit ice wait lucid
zinit snippet OMZP::autoenv
zinit snippet OMZP::command-not-found
zinit snippet OMZP::copypath
zinit snippet OMZP::cp
zinit snippet OMZP::fzf
zinit ice wait lucid
zinit snippet OMZP::git
zinit snippet OMZP::history
zinit snippet OMZP::ssh
zinit snippet OMZP::sudo
# zinit ice svn
# zinit snippet OMZ::plugins/tmux
# zinit snippet OMZ::plugins/tmux/tmux.plugin.zsh
# zinit snippet OMZ::plugins/tmux/tmux.only.conf
# zinit snippet OMZ::plugins/tmux/tmux.exxtra.conf
zinit snippet OMZP::zsh-interactive-cd

# theme
ZSH_THEME="powerlevel10k/powerlevel10k"
zinit light romkatv/powerlevel10k

# plugins
zinit ice lucid wait # atinit='zpcompinit'
zinit light zsh-users/zsh-syntax-highlighting
# zinit ice lucid wait='0' atinit='zpcompinit'
# zinit light zdharma/fast-syntax-highlighting
# zinit ice wait lucid
# zinit load zdharma-continuum/history-search-multi-word
zinit ice wait lucid atload'_zsh_autosuggest_start; zpcompinit; zpcdreplay'
zsh-defer zinit load zsh-users/zsh-autosuggestions
