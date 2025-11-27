---
description: Set up Claude Code environment for a project (requires project path)
---

# Project Setting Command

Argument: $ARGUMENTS

Use the `project-setting` skill to initialize a development project with Claude Code environment and Flow framework.

## Execution

1. Validate that `$ARGUMENTS` contains a project path
   - If empty, ask user for the target project path
2. Run the setup script:
   ```bash
   ~/.claude/skills/project-setting/scripts/setting.sh <project_path>
   ```
3. Report the result to the user

## What Gets Installed

- `CLAUDE.md` - Claude Code project configuration
- `.flow/` - Flow framework directory
- `.claude/` - Claude directory with agents, commands, and skills from plugins
