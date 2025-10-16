# Session Logging System - Installation Guide

A comprehensive guide for setting up the session logging system with automatic workspace initialization.

## 📋 Overview

The session logging system provides:
- **Quick clipboard-to-markdown logging** with timestamp
- **Terminal aliases** for fast workflow integration
- **Automatic workspace setup** in VS Code
- **Portable configuration** using relative paths

## 🚀 Quick Setup (Recommended)

### Method 1: VS Code Workspace Integration (Automatic)

This is the easiest method - the logging system loads automatically when you open the workspace.

1. **Open the workspace file in VS Code:**
   ```
   File → Open Workspace From File → QuestionManager.code-workspace
   ```

2. **That's it!** The session logging system will automatically:
   - Load when the workspace opens
   - Display available commands in the terminal
   - Set the correct working directory
   - Be ready to use immediately

### Method 2: Manual PowerShell Profile Setup

If you prefer automatic loading in all PowerShell sessions:

1. **Open your PowerShell profile:**
   ```powershell
   notepad $PROFILE
   ```

2. **Add this code:**
   ```powershell
   # Auto-load session log aliases and navigate to QuestionManager project
   if (Test-Path "G:\repos\QuestionManager\PromptTracking\session-log.ps1") {
       # Change to G: drive
       Set-Location "G:"
       # Change to QuestionManager project directory
       Set-Location "G:\repos\QuestionManager"
       # Load session log aliases
       . "G:\repos\QuestionManager\PromptTracking\log-aliases.ps1"
       Write-Host "QuestionManager project loaded with session logging aliases!" -ForegroundColor Green
   }
   ```

3. **Reload your profile:**
   ```powershell
   . $PROFILE
   ```

## 📁 File Structure

```
QuestionManager/
├── QuestionManager.code-workspace    # VS Code workspace with auto-loading
├── PromptTracking/
│   ├── workspace-init.ps1            # Automatic initialization script
│   ├── session-log.ps1               # Main logging functions
│   ├── log-aliases.ps1               # Command aliases (logt, logs, etc.)
│   ├── Session Log YYYYMMDD.md       # Daily log files
│   ├── InstallationGuide.md          # This file
│   └── Session Logging README.md     # Usage documentation
└── QuestionManager/                  # Solution folder
```

## 🎯 Workspace Configuration Details

The VS Code workspace (`QuestionManager.code-workspace`) includes:

### Automatic Task Configuration
```json
{
  "label": "Load Session Log Aliases",
  "type": "shell", 
  "command": "pwsh",
  "args": [
    "-File",
    "${workspaceFolder}/PromptTracking/workspace-init.ps1"
  ],
  "runOptions": {
    "runOn": "folderOpen"
  }
}
```

### Terminal Settings
```json
{
  "terminal.integrated.cwd": "G:\\repos\\QuestionManager",
  "terminal.integrated.defaultProfile.windows": "PowerShell"
}
```

### Available Tasks
- **Load Session Log Aliases** - Automatic on workspace open
- **Build Solution** - `dotnet build QuestionManager.slnx`
- **Start AppHost (Full Solution)** - Run the entire application stack

## 🔧 Workspace Initialization Script

The `workspace-init.ps1` script provides:

### Features
- **🚀 Visual progress indicators** with emojis
- **📁 Automatic directory setup** (sets working directory to project root)
- **📝 Session logging system loading** (loads main script and aliases)
- **📋 Command documentation** (displays available commands)
- **⚠️ Error handling** with helpful messages
- **✅ Success confirmation** when everything loads

### What It Does
1. **Determines project root** (parent directory of PromptTracking)
2. **Sets working directory** to project root
3. **Loads session-log.ps1** (main logging functions)
4. **Loads log-aliases.ps1** (command shortcuts)
5. **Displays available commands** for immediate use

### Output Example
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
   Current directory: G:\repos\QuestionManager
```

## 🎮 Available Commands

Once loaded, you have these commands available:

| Command | Description | Usage |
|---------|-------------|-------|
| `logt "text"` | Log text entry with timestamp | `logt "Fixed the bug"` |
| `logs "heading"` | Log section header | `logs "New Feature"` |
| `logc` | Log code block from clipboard | Copy code, then `logc` |
| `log-help` | Show all available commands | `log-help` |

## ✅ Benefits

### Immediate Advantages
- **Zero setup friction** - Works immediately when opening workspace
- **No manual steps** - Completely automated
- **Portable configuration** - Works on any machine with the project
- **Team-friendly** - Same experience for all developers

### Long-term Benefits  
- **Consistent workflow** - Same commands available every session
- **Conversation continuity** - Easy to pick up where you left off
- **Knowledge preservation** - Searchable record of decisions and solutions
- **Debugging aid** - Timestamped record of changes and their context

## 🔍 Troubleshooting

### Common Issues

**Commands not available after opening workspace:**
1. Check that `workspace-init.ps1` exists in `PromptTracking/` folder
2. Verify VS Code opened the workspace file (not just the folder)
3. Look for initialization output in the terminal

**Path errors:**
1. Ensure the project structure matches the expected layout
2. Check that `PromptTracking` folder is directly under project root
3. Verify `session-log.ps1` and `log-aliases.ps1` exist

**PowerShell execution policy:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Manual Testing

Test the system manually:
```powershell
# Navigate to project root
cd "G:\repos\QuestionManager"

# Run initialization script directly
.\PromptTracking\workspace-init.ps1

# Test a command
logt "Testing the system"
```

## 📤 Sharing with Team

To share this setup with your team:

1. **Include the PromptTracking folder** in your repository
2. **Commit the workspace file** with the task configuration  
3. **Document the workflow** in your project README
4. **Team members just need to:**
   - Clone the repository
   - Open the workspace file in VS Code
   - Start using the logging commands immediately

## 🎯 Next Steps

After installation:
1. **Open the workspace** in VS Code to test automatic loading
2. **Try the basic commands** (`logt`, `logs`, `logc`)
3. **Check the generated log file** in `PromptTracking/Session Log YYYYMMDD.md`
4. **Customize as needed** for your specific workflow

The system is designed to be unobtrusive but powerful - it stays out of your way until you need it, then provides quick, consistent logging capabilities that enhance your development workflow.

