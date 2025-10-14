# Session Logging System

A clipboard-to-markdown session logging system with terminal aliases for quick workflow integration.

## Files
- `session-log.ps1` - The main logging script
- `log-aliases.ps1` - Terminal aliases for easy access
- `Session Log YYYYMMDD.md` - Daily log files (auto-created)

## Quick Start (Terminal Aliases)
From the PromptTracking directory, load aliases:
```powershell

. .\log-aliases.ps1
```

Then use these simple commands:
```powershell
# Copy content to clipboard, then:
log     # Basic clipboard entry with timestamp
logs    # Section entry with heading
logc    # Code block with proper markdown formatting  
logt    # Title section with custom heading
```

## Direct Script Usage
```powershell
# Basic logging
.\session-log.ps1

# With section header  
.\session-log.ps1 -Section -Title "Bug Fix"

# Wrap clipboard in markdown code block
.\session-log.ps1 -CodeBlock

# Quiet mode (no confirmation)
.\session-log.ps1 -Quiet
```

## VS Code Integration
The project includes VS Code tasks and keybindings:
- **Ctrl+Shift+L** - Basic log entry
- **Ctrl+Shift+Alt+L** - Section log entry  
- **Ctrl+Shift+Alt+C** - Code block entry

## Output Format
**Basic Entry (`log`):**
```markdown
[2025-10-13 16:01:19]
Your clipboard content here
```

**Section Entry (`logs`):**
```markdown
## Entry 2025-10-13 16:01:19
Your clipboard content here
```

**Code Block Entry (`logc`):**
```markdown
[2025-10-13 16:01:19]
```
function example() {
  return "Your code here";
}
```
```

## Setup for New Projects
1. Copy the `PromptTracking` folder to your project root
2. Load aliases: `. .\PromptTracking\log-aliases.ps1`
3. Optional: Add to PowerShell profile for automatic loading