# Session Logging System

A clipboard-to-markdown session logging system with terminal aliases for quick workflow integration.

## Problem
Chat clients do not remember what you have talked about very well. 

- When you are having a converstaion with copilot or another chat client, you may want to memorialize parts of your chat.  
- This log can be used later to help your MLL "remember" what you have talked about earlier today. 
- You **could** cut and paste parts of our conversation into a file. 
- Why not automate and annotate that process?

This script can take a parameter for writing the clipboard to the session log as:
- **Basic logging** appends the clipboard to the current day's log file
- **Section Header** adds a title as a markdown section to the clipboard contents. This is useful for breaking the log file up into topics of your conversations with the Chat.
- **CodeBlock** writes the contents of the clipboard to a markdown code block which prepends and appends three back ticks to the clipboard.  This is useful when the chat returns some code that you want to memorialize in the log.
- **Quiet** just saves it.

You can also set up a shortcut alias commands in Powershell to call the session logging script. This will allow you to type a quick shortcut into your terminal to save a clipboard entry. 

## Documentation
- [Installation Guide](Installation%20Guide.md) - Setup and configuration instructions
- [How Session Logging Works](How%20Session%20Logging%20Works.md) - Detailed explanation of the logging system
- 
## Files
- `session-log.ps1` - The main logging script
- `log-aliases.ps1` - Terminal aliases for easy access
- `Session Log YYYYMMDD.md` - Daily log files (auto-created)

## Quick Start (Terminal Aliases)

- Create a subdirectory called PromptTracking under your research folder where you save your notes.
- Navigate  the PromptTracking directory, load aliases (notice the two dots):
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

function example() {
  return "Your code here";
}

```

## Setup for New Projects
1. Copy the contents of any `PromptTracking` folder to your project root
2. Load aliases: `. .\PromptTracking\log-aliases.ps1`
3. Optional: Add to PowerShell profile for automatic loading