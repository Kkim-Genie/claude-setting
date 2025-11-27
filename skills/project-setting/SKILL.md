---
name: project-setting
description: Set up Claude Code environment and Flow framework for development projects. Use this skill when users want to initialize a new project with Claude Code configuration, set up the Flow development framework, or bootstrap a project with predefined templates and plugins.
---

# Project Setting

This skill provides a shell script to initialize development projects with Claude Code environment and Flow framework.

## Usage

Run the setup script with the target project path:

```bash
~/.claude/skills/project-setting/scripts/setting.sh <project_path>
```

### Examples

```bash
# Set up current directory
~/.claude/skills/project-setting/scripts/setting.sh .

# Set up specific project
~/.claude/skills/project-setting/scripts/setting.sh /path/to/my-project
```

## What Gets Installed

### 1. Template Files (to project root)

- `CLAUDE.md` - Claude Code project configuration
- `.flow/` - Flow framework directory with development guidelines and examples

### 2. Claude Directory Structure

```
.claude/
├── agents/     # AI agent configurations
├── commands/   # Slash commands
└── skills/     # Skill definitions
```

### 3. Plugins

All plugins from `plugins/` directory are automatically installed. Currently includes:

- **flow** - Flow development framework with commands and skills for structured development workflow

## Directory Structure

```
project-setting/
├── SKILL.md           # This file
├── scripts/
│   └── setting.sh     # Setup script
├── template/          # Files copied to project root
│   ├── CLAUDE.md
│   └── .flow/
└── plugins/           # Plugins copied to .claude/
    └── flow/
        ├── agents/
        ├── commands/
        └── skills/
```
