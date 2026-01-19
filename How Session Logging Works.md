# How Session Logging Works

A technical deep-dive into the PromptTracking session logging system architecture and implementation.

## Overview

PromptTracking is a self-contained PowerShell script system that captures clipboard content into timestamped markdown log files. It requires only PowerShell—no external dependencies or configuration management tools.

## Core Architecture

### File Structure

```
PromptTracking/
├── session-log.ps1           # Main logging script
├── log-aliases.ps1           # Convenience function wrappers
├── load-session-logging.ps1  # Initialization script
└── Session Log YYYYMMDD.md   # Generated log files (auto-created)
```

### Script Independence

Each script is designed to work standalone:

- **session-log.ps1** - Core functionality; can be called directly with parameters
- **log-aliases.ps1** - Optional convenience layer that provides simple command aliases
- **load-session-logging.ps1** - Helper that sources both scripts in the correct context

Users can use the scripts in several ways:
```powershell
# Direct execution
.\PromptTracking\session-log.ps1 -Section -Title "My Entry"

# Via aliases (after sourcing log-aliases.ps1)
logt "My Entry"

# Via helper script
. .\PromptTracking\load-session-logging.ps1
```

## How session-log.ps1 Works

### Parameters

The main script accepts these parameters:

- **-Path** - Custom output file path (defaults to `Session Log YYYYMMDD.md` in script directory)
- **-Section** - Create a markdown heading for the entry (H2 by default)
- **-Title** - Custom section heading text
- **-H1** - Use H1 heading instead of H2
- **-CodeBlock** - Wrap clipboard content in markdown code fence (```)
- **-Markers** - Add HTML comment markers: `Prompt`, `Response`, or `Note`
- **-DayStart/-DayEnd** - Insert day boundary markers
- **-GuardLargeClipboard** - Enable clipboard size validation
- **-MaxClipboardChars** - Maximum allowed clipboard size
- **-AutoTruncate** - Truncate instead of reject large clipboard
- **-Quiet** - Suppress confirmation messages

### Execution Flow

1. **Path Resolution** (`Get-SessionLogPath`)
   - If explicit `-Path` provided: use that path
   - Otherwise: generate `Session Log YYYYMMDD.md` in script directory
   - Path automatically resolves relative to script location

2. **Content Retrieval**
   - Reads clipboard with `Get-Clipboard -Raw`
   - Exits with warning if clipboard is empty

3. **Optional Size Validation**
   - If `-GuardLargeClipboard` enabled, checks content length
   - Either truncates (if `-AutoTruncate`) or aborts

4. **Header Generation**
   ```powershell
   # Basic entry: [2025-01-18 14:30:22]
   # Heading entry: ## Title (2025-01-18 14:30:22)
   # H1 heading: # Title (2025-01-18 14:30:22)
   ```

5. **Content Wrapping**
   - Wraps in code fences if `-CodeBlock` specified
   - Adds HTML comment markers if `-Markers` specified

6. **Day Boundary Markers** (optional)
   - Inserts `<!--Day Start-->` and `<!--Day End-->` comments
   - Useful for parsing and section organization

7. **File Operations**
   - Creates file with header if it doesn't exist
   - Appends formatted content with UTF8 encoding
   - Provides green confirmation message (unless `-Quiet`)

### Output Example

**Input:** Clipboard contains `function example() { return true; }`

**Command:** `.\session-log.ps1 -Section -Title "Code Example" -CodeBlock`

**Output (appended to file):**
```markdown
## Code Example (2025-01-18 14:30:22)

\`\`\`
function example() { return true; }
\`\`\`
```

## How log-aliases.ps1 Works

The aliases file provides convenient function wrappers:

| Alias | What It Does | Equivalent |
|-------|------------|-----------|
| `log` | Basic timestamp entry | `session-log.ps1` |
| `logs` | Section with heading | `session-log.ps1 -Section` |
| `logc` | Code block entry | `session-log.ps1 -CodeBlock` |
| `logt "title"` | Custom title section | `session-log.ps1 -Section -Title "title"` |
| `logp` | "Prompt:" section (H1 + markers) | `session-log.ps1 -H1 -Section -Title "Prompt:" -Markers Prompt` |
| `logr` | "Response:" section (H1 + markers) | `session-log.ps1 -H1 -Section -Title "Response:" -Markers Response` |
| `logn` | "Note:" section (H1 + markers) | `session-log.ps1 -H1 -Section -Title "Note:" -Markers Note` |
| `Show-LogHelp` | Display all commands | Prints help text |

The `log-help` alias is provided for backward compatibility and points to `Show-LogHelp`.

## How load-session-logging.ps1 Works

This is a convenience initialization script:

1. Determines the project root by going up one directory from the script location
2. Changes to project root
3. Sources `session-log.ps1` to load functions
4. Sources `log-aliases.ps1` to load command aliases
5. Displays colorized status messages
6. Returns to original location

This allows a single command to set everything up:
```powershell
. .\PromptTracking\load-session-logging.ps1
```

## Project Agnosticism

The system is completely project-agnostic:

- **No hardcoded paths** - Everything uses `$PSScriptRoot` and relative paths
- **Folder-independent** - Works in any user directory
- **Stateless** - Doesn't require VS Code, configuration files, or environment variables
- **Idempotent** - Running the scripts multiple times produces the same result
- **Portable** - Copy the `PromptTracking` folder anywhere and it works

## Daily Log File Convention

By default, logs are organized daily:

- `Session Log 20250118.md` - January 18, 2025
- `Session Log 20250119.md` - January 19, 2025

This convention:
- Makes logs searchable by date
- Prevents single massive files
- Aligns with common logging practices
- Keeps related entries together

## Integration with VS Code (Optional)

For VS Code users, the system can be integrated via workspace tasks:

### Workspace Configuration

Add to `.code-workspace` file:
```json
{
  "tasks": {
    "version": "2.0.0",
    "tasks": [{
      "label": "Load Session Logging",
      "type": "shell",
      "command": "pwsh",
      "args": ["-File", "${workspaceFolder}/PromptTracking/workspace-init.ps1"],
      "runOptions": {"runOn": "folderOpen"}
    }]
  }
}
```

This causes the logging system to load automatically when the workspace opens.

### Optional Keybindings

Add to `.vscode/keybindings.json`:
```json
[
  {
    "key": "ctrl+shift+l",
    "command": "workbench.action.terminal.sendSequence",
    "args": {"text": "log\u000D"},
    "when": "terminalFocus"
  },
  {
    "key": "ctrl+shift+alt+l",
    "command": "workbench.action.terminal.sendSequence",
    "args": {"text": "logs\u000D"},
    "when": "terminalFocus"
  }
]
```

## Key Design Principles

1. **Simplicity** - Minimal PowerShell, no dependencies
2. **Portability** - Works anywhere without installation
3. **Flexibility** - Supports multiple usage patterns
4. **Self-Sufficiency** - Doesn't require external tools
5. **Idempotence** - Safe to run repeatedly
6. **Transparency** - Clear output showing what was logged

## Common Patterns

### Logging AI Conversation

```powershell
# Copy prompt to clipboard
logp  # Log with "Prompt:" marker

# Copy response to clipboard  
logr  # Log with "Response:" marker
```

### Logging Code Changes

```powershell
# Copy code snippet to clipboard
logc  # Log as code block
```

### Custom Workflows

```powershell
# Copy work notes to clipboard
logt "Bug Investigation"  # Log with custom title
```

## No Clipboard Required for Direct Paths

While the system focuses on clipboard integration, you can also log file content directly:

```powershell
Get-Content "myfile.txt" | Set-Clipboard
.\PromptTracking\session-log.ps1
```

