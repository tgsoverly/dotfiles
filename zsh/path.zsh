#!/usr/bin/env zsh
# PATH configuration

# Current directory (use with caution)
export PATH=".:$PATH"

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

# Local bin directories
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Go
export GOPATH="$HOME/.go"
export PATH="$PATH:$GOPATH/bin"

# Dotfiles scripts
export PATH="$PATH:$HOME/.dotfiles/scripts/bin"

# PostgreSQL (Postgres.app)
if [ -d "/Applications/Postgres.app/Contents/Versions/latest/bin" ]; then
  export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
fi

# User applications
export PATH="$PATH:$HOME/Applications"

# Custom project scripts (update path as needed)
# export PATH="$PATH:$HOME/code/server/scripts/deployer"

# GNU tar (if installed via Homebrew)
if [ -d "/usr/local/opt/gnu-tar/libexec/gnubin" ]; then
  export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
fi
