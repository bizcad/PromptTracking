# Session Logging System

A clipboard-to-markdown session logging system with terminal aliases for quick workflow integration and automatic VS Code workspace setup.

## 🚀 Quick Start

### Automatic Setup (Recommended)
**Open the VS Code workspace file and the logging system loads automatically:**
```
File → Open Workspace From File → QuestionManager.code-workspace
```

The system will:
- Load automatically when workspace opens
- Display available commands in terminal
- Set correct working directory
- Be ready to use immediately

### Manual Setup (Alternative)
From the PromptTracking directory, load aliases:
```powershell
. .\log-aliases.ps1
```

## 📋 Available Commands

| Command | Description | Usage Example |
|---------|-------------|---------------|
| `logt "text"` | Log text entry with timestamp | `logt "Fixed authentication bug"` |
| `logs "heading"` | Log section header | `logs "New Feature Implementation"` |
| `logc` | Log code block from clipboard | Copy code, then `logc` |
| `log-help` | Show all available commands | `log-help` |

## 📁 Files and Structure

```
PromptTracking/
├── workspace-init.ps1          # Automatic workspace initialization
├── session-log.ps1             # Main logging script
├── log-aliases.ps1             # Terminal aliases for easy access
├── Session Log YYYYMMDD.md     # Daily log files (auto-created)
├── InstallationGuide.md        # Comprehensive setup guide
└── Session Logging README.md   # This file
```

## 🎯 Workspace Integration

### Automatic Loading
The VS Code workspace is configured to automatically:
1. **Run workspace-init.ps1** when workspace opens
2. **Set working directory** to project root  
3. **Load session logging system** with all aliases
4. **Display available commands** for immediate use

### Workspace Configuration
The workspace includes these features:
- **Terminal defaults** to project root directory
- **PowerShell as default shell**
- **Automatic task execution** on workspace open
- **Additional tasks** for building and running the solution

### Visual Feedback
When the workspace loads, you'll see:
```
🚀 Initializing QuestionManager workspace...
📁 Project root: G:\repos\QuestionManager
📝 Loading session logging system...
✅ Session logging system loaded successfully!

📋 Available commands:
   logt    - Log text entry
   logs    - Log section header  
   logc    - Log code block
   log-help - Show all logging commands

🎯 QuestionManager workspace ready!
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