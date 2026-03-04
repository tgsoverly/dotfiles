#!/usr/bin/env zsh
# Oh My Zsh configuration

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set theme
ZSH_THEME="robbyrussell"

# zsh-vi-mode configuration
function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=kj
}

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  git
  zsh-vi-mode
)

# Load Oh My Zsh
if [ -f "${ZSH}/oh-my-zsh.sh" ]; then
  source "${ZSH}/oh-my-zsh.sh"
fi
