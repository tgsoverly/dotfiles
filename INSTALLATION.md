# Installation Guide

## First Time Setup

1. **Clone your dotfiles repository:**
   ```bash
   git clone <your-repo-url> ~/code/dotfiles
   cd ~/code/dotfiles
   ```

2. **Run the installation script:**
   ```bash
   ./scripts/bin/dotfiles-install
   ```

   This will:
   - Create `~/.dotfiles` symlink pointing to your dotfiles directory
   - Symlink `~/.zshrc` to your dotfiles `.zshrc`
   - Symlink `~/.gitconfig` to your git configuration
   - Make scripts in `scripts/bin/` executable
   - Backup any existing files to `~/.dotfiles-backup-<timestamp>/`

3. **Restart your terminal or reload configuration:**
   ```bash
   source ~/.zshrc
   ```

4. **Install Homebrew packages (optional):**
   ```bash
   brew bundle --file=~/.dotfiles/brew/.Brewfile
   ```

## Adding to Your zshrc

If you want to manually load the dotfiles instead of using the install script, add this to your `~/.zshrc`:

```bash
# Load dotfiles
if [ -f ~/.dotfiles/.zshrc ]; then
  source ~/.dotfiles/.zshrc
fi
```

## Local Customization

Create `~/.zshrc.local` for machine-specific settings:

```bash
# Copy the example file
cp ~/.dotfiles/.zshrc.local.example ~/.zshrc.local

# Edit with your local settings
$EDITOR ~/.zshrc.local
```

This file is not version controlled and will be loaded automatically.

## What Gets Installed

After running the install script, your home directory will have:

- `~/.zshrc` → symlink to `~/.dotfiles/.zshrc`
- `~/.gitconfig` → symlink to `~/.dotfiles/git/.gitconfig`
- `~/.dotfiles` → symlink to your dotfiles directory

## Directory Structure Created

```
~/.dotfiles/
├── .zshrc              # Main zsh config
├── zsh/                # Modular zsh files
├── git/                # Git configuration
├── brew/               # Homebrew packages
├── ai/                 # AI workflows
└── scripts/bin/        # Utility scripts
```

## Updating

To update your dotfiles:

```bash
cd ~/.dotfiles
git pull
source ~/.zshrc
```

## Uninstalling

To remove the dotfiles:

```bash
# Remove symlinks
rm ~/.zshrc ~/.gitconfig ~/.dotfiles

# Restore backups if needed
# Backup files are in ~/.dotfiles-backup-<timestamp>/
```
