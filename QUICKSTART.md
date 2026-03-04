# Quick Start Guide

## Install Your Dotfiles (First Time)

```bash
# 1. Backup your current .zshrc (if you haven't already)
cp ~/.zshrc ~/.zshrc.backup

# 2. Install the zsh-vi-mode plugin
git clone https://github.com/jeffreytse/zsh-vi-mode \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode

# 3. Run the dotfiles installer
cd ~/code/dotfiles
./scripts/bin/dotfiles-install

# 4. Reload your shell
source ~/.zshrc
```

## ✅ Your Secrets Are Already Set Up

I've created `~/.zshrc.local` with your:
- LocalStack auth token
- AWS Vault configuration
- ForeFlight server directory
- Custom PATH for deployer scripts
- duster source
- .local/bin/env source

This file is NOT version controlled and stays on your machine.

## ✅ Version Managers Are Configured

Your dotfiles are set up to use:
- **pyenv** - Python version management
- **nvm** - Node.js version management  
- **sdkman** - Java/Kotlin/Scala version management

They're all loaded in `zsh/version-managers.zsh` and will be available after you reload.

## Test Everything Works

```bash
# Reload your shell
source ~/.zshrc

# Test version managers
pyenv --version
nvm --version
sdk version

# Test Oh My Zsh
echo $ZSH

# Test your secrets
echo $LOCALSTACK_AUTH_TOKEN
echo $FOREFLIGHT_SERVER_DIR

# Test Vi mode (press ESC then try kj to re-enter insert mode)
# In insert mode: type "kj" quickly to escape to normal mode
```

## What Just Happened?

1. **Symlinks created:**
   - `~/.zshrc` → `~/code/dotfiles/.zshrc`
   - `~/.gitconfig` → `~/code/dotfiles/git/.gitconfig`
   - `~/.dotfiles` → `~/code/dotfiles`

2. **Secrets secured:**
   - All your API keys and tokens are in `~/.zshrc.local` (NOT in git)
   
3. **Modular configuration:**
   - Oh My Zsh settings: `zsh/oh-my-zsh.zsh`
   - Version managers: `zsh/version-managers.zsh`
   - PATH: `zsh/path.zsh`
   - Aliases: `zsh/aliases.zsh`

## Customize

To add more configuration:

```bash
# Add a new module
echo '# My custom settings' > ~/code/dotfiles/zsh/custom.zsh
# It will auto-load on next shell start

# Or add machine-specific stuff
echo 'alias myproject="cd ~/my/project"' >> ~/.zshrc.local
```

## Troubleshooting

If something doesn't work:

```bash
# Check what loaded
echo "DOTFILES_DIR: $DOTFILES_DIR"
echo "ZSH: $ZSH"

# Check for errors
source ~/.zshrc

# Compare with backup
diff ~/.zshrc.backup ~/.zshrc

# See MIGRATION.md for detailed troubleshooting
```
