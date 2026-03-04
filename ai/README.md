# AI and Agent Workflows

This directory contains configurations and scripts for AI and agent workflows.

## Structure

- `claude-code/` - Claude Code configurations
- `agents/` - Custom agent scripts and configurations
- `prompts/` - Reusable prompt templates
- `scripts/` - AI workflow automation scripts

## Getting Started

Add your AI tool configurations here. For example:

- API keys (use `.zshrc.local` for secrets, not version controlled)
- Prompt templates
- Agent workflow definitions
- Custom scripts for AI interactions

## Example

Create a file `agents/code-reviewer.md` with a prompt template:

```markdown
# Code Review Agent

You are an expert code reviewer. Review the following code for:
- Security vulnerabilities
- Performance issues
- Code style and best practices
- Potential bugs

Code:
{code}
```

Then reference it in your scripts or workflows.
