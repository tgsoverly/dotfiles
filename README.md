# Dotfiles

Personal configuration files for macOS with a focus on modularity and AI/agent workflows.

## Features

- 🔧 Modular zsh configuration
- 🤖 AI and agent workflow organization
- 📦 Homebrew package management
- 🔗 Symlink-based installation
- 🎨 Clean, organized structure

## Quick Start

```bash
# Clone the repository
git clone https://github.com/yourusername/dotfiles.git ~/code/dotfiles
cd ~/code/dotfiles

# Run the installation script
./scripts/bin/dotfiles-install

# Restart your terminal or source the config
source ~/.zshrc
```

## Structure

```
.
├── .zshrc                 # Main zsh config (sources modular files)
├── zsh/                   # Modular zsh configuration
│   ├── path.zsh          # PATH configuration
│   ├── aliases.zsh       # Common aliases
│   ├── editor.zsh        # Editor settings
│   ├── shell.zsh         # Shell behavior
│   └── ai.zsh            # AI workflow configuration
├── ai/                    # AI and agent workflows
│   ├── README.md         # AI workflow documentation
│   ├── agents/           # Agent configurations
│   ├── prompts/          # Reusable prompts
│   └── scripts/          # AI automation scripts
├── git/                   # Git configuration
│   └── .gitconfig
├── brew/                  # Homebrew package management
│   └── .Brewfile         # Homebrew dependencies
└── scripts/               # Utility scripts
    └── bin/
        └── dotfiles-install  # Installation script
```

## Customization

### Adding Your Own Configuration

1. **Shell Configuration**: Add new `.zsh` files to the `zsh/` directory
   ```bash
   echo '# My custom config' > zsh/custom.zsh
   # It will be automatically loaded on next shell start
   ```

2. **AI Workflows**: Add your AI agent configs to `ai/`
   ```bash
   mkdir -p ai/agents
   echo 'Your agent config' > ai/agents/my-agent.md
   ```

3. **Scripts**: Add executable scripts to `scripts/bin/`
   ```bash
   echo '#!/bin/bash\necho "Hello"' > scripts/bin/hello
   chmod +x scripts/bin/hello
   ```

4. **Local Overrides**: Use `~/.zshrc.local` for machine-specific settings
   ```bash
   # In ~/.zshrc.local (not version controlled)
   export MY_SECRET_KEY="..."
   alias work='cd ~/work'
   ```

### Installing Homebrew Packages

```bash
# Install all packages from Brewfile
brew bundle --file=~/.dotfiles/brew/.Brewfile

# Add packages to Brewfile
brew bundle dump --file=~/.dotfiles/brew/.Brewfile --force
```

## What Gets Loaded

When you start a new shell, `.zshrc` automatically loads:

1. `zsh/path.zsh` - PATH configuration (first, so tools are available)
2. `zsh/editor.zsh` - Editor settings
3. `zsh/shell.zsh` - Shell behavior and keybindings
4. `zsh/aliases.zsh` - Common aliases
5. `zsh/ai.zsh` - AI workflow configuration
6. Any other `*.zsh` files in `zsh/` directory
7. `mise` activation (if installed)
8. `~/.zshrc.local` (local overrides, not version controlled)

## Migrating from Old Setup

If you had previous dotfiles:

1. The install script backs up existing files to `~/.dotfiles-backup-<timestamp>/`
2. Review backed up files and migrate settings as needed
3. Add machine-specific settings to `~/.zshrc.local`

## AI Workflow Organization

The `ai/` directory is designed to organize:

- **Agent Configurations**: Reusable agent definitions
- **Prompt Templates**: Common prompts for code review, documentation, etc.
- **Workflow Scripts**: Automation for AI-assisted tasks
- **Tool Configurations**: Settings for Claude Code, Cursor, etc.

Example workflow:
```bash
# Keep your agent prompts organized
ai/agents/code-reviewer.md
ai/agents/documentation-writer.md
ai/prompts/commit-message-template.md
ai/scripts/ai-commit  # Script to generate commit messages
```

## Inspired By

Structure inspired by [kylekthompson/dotfiles](https://github.com/kylekthompson/dotfiles)

## License

MIT License - See [LICENSE](LICENSE) file for details
