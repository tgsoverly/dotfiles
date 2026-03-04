#!/usr/bin/env zsh
# Shell behavior configuration

# Don't check mail when opening terminal
unset MAILCHECK

# History configuration
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY

# Note: Vi keybindings are configured in oh-my-zsh.zsh via zsh-vi-mode plugin
# If not using Oh My Zsh, uncomment the following:
# bindkey -v
# bindkey '\e[A' history-search-backward
# bindkey '\e[B' history-search-forward
