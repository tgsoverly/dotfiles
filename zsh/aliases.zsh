#!/usr/bin/env zsh
# Common aliases

# Navigation
alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# List files
alias ls='ls -halF'
alias lsc='ls -C'
alias lsf='ls -la | grep ^-'  # files only
alias lsd='ls -la | grep ^d'  # dirs only

# File operations
alias rds="find . -name '*.DS_Store' -type f -delete"
alias size10='find . -type d -print0 | xargs -0 du -s | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {}'

# System
alias ip='ifconfig | grep "inet "'
alias openports='sudo lsof -i -P | grep -i "listen"'
alias hosts='sudo $EDITOR /private/etc/hosts'
alias sprof="source ${HOME}/.zshrc"

# Applications
alias te='open -e'  # textedit
alias f='open .'    # open folder in finder

# Docker
alias docker-clean='docker stop $(docker ps -a -q);docker rm $(docker ps -a -q);docker rmi $(docker images -q)'
alias docker-prune='docker rmi $(docker images -f "dangling=true" -q)'

# Git (from bash-it)
alias gw="git whatchanged"
alias gaa="git add .;git commit --amend --no-edit"
alias gaap="git add .;git commit --amend --no-edit;git push -f"

# macOS
alias fastmouse='defaults write -g com.apple.mouse.scaling 17'
