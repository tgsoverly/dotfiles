# Commit Message Generator

## Purpose
Generate clear, conventional commit messages from code changes.

## Prompt Template

```
Generate a conventional commit message for the following changes.

Format:
<type>(<scope>): <subject>

<body>

Types: feat, fix, docs, style, refactor, test, chore

Changes:

{diff}

Guidelines:
- Subject line should be under 50 characters
- Body should explain what and why, not how
- Use imperative mood ("add" not "added")
- Reference issue numbers if applicable
```

## Usage

```bash
# Get git diff
git diff --cached

# Pass to Claude/AI to generate commit message
# Then use the generated message
git commit -m "feat(api): add user authentication endpoint"
```
