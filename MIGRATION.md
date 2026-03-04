# Migration Guide

## Migrating from Your Current Setup

Your current `.zshrc` has been reorganized into modular files. Here's where everything went:

### Oh My Zsh Configuration
**Old location:** Directly in `~/.zshrc`
**New location:** `zsh/oh-my-zsh.zsh`

```bash
# Your Oh My Zsh settings are now in:
zsh/oh-my-zsh.zsh
  - ZSH theme (robbyrussell)
  - zsh-vi-mode plugin configuration
  - Vi mode escape key (kj)
```

### Version Managers
**Old location:** Scattered throughout `~/.zshrc`
**New location:** `zsh/version-managers.zsh`

```bash
# All version managers in one place:
zsh/version-managers.zsh
  - Homebrew shellenv
  - pyenv (Python)
  - nvm (Node.js)
  - SDKMAN (Java/Kotlin/Scala)
  - mise (optional, commented out)
```

### PATH Configuration
**Old location:** Multiple PATH exports in `~/.zshrc`
**New location:** `zsh/path.zsh`

```bash
zsh/path.zsh
  - Postgres.app
  - ~/Applications
  - ~/.local/bin
  - Dotfiles scripts
```

### Secrets and Local Config
**Old location:** Hardcoded in `~/.zshrc`
**New location:** `~/.zshrc.local` (NOT version controlled)

These items should go in `~/.zshrc.local`:
- `LOCALSTACK_AUTH_TOKEN`
- `AWS_VAULT_KEYCHAIN_NAME`
- `AWS_VAULT_PROMPT`
- `FOREFLIGHT_SERVER_DIR`
- Custom PATH for deployer scripts
- duster source
- `.local/bin/env` source

### Aliases
**Old location:** `~/.zshrc`
**New location:** `zsh/aliases.zsh`

Your `sprof` alias is already included!

## Step-by-Step Migration

### 1. Backup Your Current Setup
```bash
cp ~/.zshrc ~/.zshrc.backup
cp ~/.zshrc.local ~/.zshrc.local.backup 2>/dev/null || true
```

### 2. Create Your Local Config
```bash
# Copy the example
cp ~/.dotfiles/.zshrc.local.example ~/.zshrc.local

# Edit and add your secrets
$EDITOR ~/.zshrc.local
```

Add these lines to `~/.zshrc.local`:
```bash
# LocalStack
export LOCALSTACK_AUTH_TOKEN="ls-jAHeSewe-BiGu-7813-0452-QuMAjIJU1a44"

# AWS Vault
export AWS_VAULT_KEYCHAIN_NAME=login
export AWS_VAULT_PROMPT=osascript

# ForeflightServer
export FOREFLIGHT_SERVER_DIR=/Users/toverly/foreflight

# Custom paths
export PATH="$PATH:$HOME/code/server/scripts/deployer"

# Custom sources
if [ -f ~/code/duster/dust ]; then
  source ~/code/duster/dust all
fi

if [ -f "$HOME/.local/bin/env" ]; then
  . "$HOME/.local/bin/env"
fi
```

### 3. Install Oh My Zsh Plugins

You need the `zsh-vi-mode` plugin:

```bash
# Install zsh-vi-mode
git clone https://github.com/jeffreytse/zsh-vi-mode \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode
```

### 4. Run the Installer
```bash
cd ~/code/dotfiles
./scripts/bin/dotfiles-install
```

### 5. Test the New Setup
```bash
# Reload your shell
source ~/.zshrc

# Test that everything loads
echo "Dotfiles dir: $DOTFILES_DIR"
echo "Pyenv: $(which pyenv)"
echo "Node: $(which node)"
echo "Oh My Zsh: $ZSH"
```

### 6. Verify Your Custom Configurations
```bash
# Check version managers work
pyenv --version
nvm --version
sdk version

# Check paths
which postgres
echo $FOREFLIGHT_SERVER_DIR

# Check aliases
alias sprof
```

## What Changed?

### Benefits of the New Structure

1. **Modular**: Each concern has its own file
2. **Maintainable**: Easy to find and update specific settings
3. **Version Controlled**: Everything except secrets is in git
4. **Portable**: Install on new machines with one command
5. **Organized**: AI workflows, scripts, and configs all have homes

### Loading Order

Files are loaded in this order:
1. `version-managers.zsh` - So tools are available early
2. `path.zsh` - Set up PATH
3. `editor.zsh` - Editor settings
4. `shell.zsh` - Shell behavior
5. `oh-my-zsh.zsh` - Oh My Zsh and plugins
6. `aliases.zsh` - Command aliases
7. `ai.zsh` - AI workflow configs
8. `~/.zshrc.local` - Your local overrides (last, so you can override anything)

## Troubleshooting

### Oh My Zsh Not Loading
```bash
# Check if Oh My Zsh is installed
ls -la ~/.oh-my-zsh

# If not installed:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### zsh-vi-mode Not Working
```bash
# Install the plugin
git clone https://github.com/jeffreytse/zsh-vi-mode \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode

# Reload
source ~/.zshrc
```

### Version Managers Not Loading
```bash
# Check if they're installed
which pyenv
which nvm
sdk version

# If not, install them first before using the dotfiles
```

### Missing Features
Check your `~/.zshrc.backup` for any custom functions or configurations that weren't migrated. Add them to `~/.zshrc.local` or create a new module in `zsh/`.
