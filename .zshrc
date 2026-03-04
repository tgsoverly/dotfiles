#!/usr/bin/env zsh
# Main zsh configuration file
# This file loads modular configuration from ~/.dotfiles/zsh/

# Determine dotfiles directory
if [ -L "${HOME}/.zshrc" ]; then
  # If .zshrc is a symlink, follow it to find dotfiles
  DOTFILES_DIR="$(cd "$(dirname "$(readlink "${HOME}/.zshrc")")" && pwd)"
else
  # Default location
  DOTFILES_DIR="${HOME}/.dotfiles"
fi

export DOTFILES_DIR

# Function to source all .zsh files in a directory
load_dotfiles() {
  local config_dir="${DOTFILES_DIR}/zsh"

  if [ ! -d "$config_dir" ]; then
    echo "Warning: ${config_dir} not found"
    return 1
  fi

  # Load files in specific order for dependencies
  local ordered_files=(
    "version-managers.zsh"  # Load first so tools are available
    "path.zsh"
    "editor.zsh"
    "shell.zsh"
    "oh-my-zsh.zsh"         # Load Oh My Zsh after shell settings
    "aliases.zsh"
    "ai.zsh"
  )

  # First, load ordered files
  for file in "${ordered_files[@]}"; do
    if [ -f "${config_dir}/${file}" ]; then
      source "${config_dir}/${file}"
    fi
  done

  # Then load any remaining .zsh files
  for file in "${config_dir}"/*.zsh; do
    [ -f "$file" ] || continue
    local basename="$(basename "$file")"

    # Skip if already loaded
    if [[ " ${ordered_files[*]} " =~ " ${basename} " ]]; then
      continue
    fi

    source "$file"
  done
}

# Load all modular configuration files
load_dotfiles

# Local overrides (not version controlled)
# This should be loaded last so it can override anything
if [ -f "${HOME}/.zshrc.local" ]; then
  source "${HOME}/.zshrc.local"
fi
