# PromptTracking - Installation Guide

A comprehensive guide for setting up the PromptTracking session logging system in any project folder.

## 📋 Overview

PromptTracking provides:
- **Quick clipboard-to-markdown logging** with timestamp
- **Terminal aliases** for fast workflow integration
- **Project-agnostic design** - works in any folder
- **Zero dependencies** - just PowerShell
- **Optional VS Code integration** - for workspace automation

## 🚀 Quick Start (5 minutes)

### Option 1: Immediate PowerShell Usage (Simplest)

1. **Download or clone the repository**
   
   ```powershell
   # Clone the repo
   git clone https://github.com/bizcad/PromptTracking.git
   
   # Or copy the PromptTracking folder to your project
   ```

2. **Copy the PromptTracking folder to your project root**
   
   ```
   YourProject/
   ├── PromptTracking/
   │   ├── session-log.ps1
   │   ├── log-aliases.ps1
   │   └── load-session-logging.ps1
   └── ... your project files
   ```

3. **Open PowerShell in your project folder and load the system**
   
   ```powershell
   # Navigate to your project root
   cd "C:\Path\To\YourProject"
   
   # Load the session logging system
   . .\PromptTracking\load-session-logging.ps1
   
   # Start logging!
   logt "Session started"
   ```

4. **Your log file is created automatically**
   - Location: `YourProject/PromptTracking/Session Log YYYYMMDD.md`
   - Opens daily - one file per day
   - Ready to search and share

### Option 2: Global PowerShell Profile (Always Available)

For global access from any folder:

1. **Edit your PowerShell profile**
   
   ```powershell
   # Open your profile in your editor
   notepad $PROFILE
   
   # If file doesn't exist, create it
   ```

2. **Add the initialization code**
   
   Copy the contents of `profile-addition.ps1` from the repository and paste it into your profile. Adjust the path to point to your PromptTracking installation:
   
   ```powershell
   # Example: If you installed at C:\MyProject\PromptTracking
   $PromptTrackingPath = "C:\MyProject\PromptTracking\load-session-logging.ps1"
   
   if (Test-Path $PromptTrackingPath) {
       & $PromptTrackingPath
   }
   ```

3. **Reload your profile**
   
   ```powershell
   . $PROFILE
   ```

4. **Done!** The system loads automatically when you open PowerShell

### Option 3: VS Code Workspace Integration (Optional)

For VS Code users who want automatic loading:

1. **Create or edit your `.code-workspace` file**
   
   ```json
   {
     "folders": [{"path": "."}],
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

2. **Open the workspace in VS Code**
   
   ```
   File → Open Workspace from File → Select your .code-workspace file
   ```

3. **The logging system loads automatically** when the workspace opens

## 📁 Folder Structure After Installation

```
YourProject/
├── PromptTracking/
│   ├── session-log.ps1               # Main logging script
│   ├── log-aliases.ps1               # Command aliases
│   ├── load-session-logging.ps1      # Initialization helper
│   ├── workspace-init.ps1            # VS Code workspace setup
│   └── Session Log YYYYMMDD.md       # Daily log files (auto-created)
├── .code-workspace                   # VS Code workspace file (optional)
├── profile-addition.ps1              # Profile setup code (reference)
└── ... your other project files
```

## 🎮 Available Commands

Once loaded, you have these commands:

| Command | Description |
|---------|-------------|
| `log` | Append clipboard with timestamp |
| `logs` | Append clipboard as section heading |
| `logc` | Append clipboard as code block |
| `logt "title"` | Append with custom section title |
| `logp` | Append as "Prompt:" section (with markers) |
| `logr` | Append as "Response:" section (with markers) |
| `logn` | Append as "Note:" section (with markers) |
| `Show-LogHelp` | Display all available commands |
| `log-help` | Alias for Show-LogHelp |

## 📋 Example Workflows

### Logging AI Conversations

```powershell
# Copy your prompt to clipboard
logp

# Copy the response to clipboard
logr
```

### Logging Code Changes

```powershell
# Copy a code snippet to clipboard
logc
```

### Daily Notes

```powershell
# Copy your notes to clipboard
logt "Daily standup - completed task X"
```

### Viewing Your Logs

```powershell
# Open your log file in Notepad
notepad ".\PromptTracking\Session Log $(Get-Date -Format 'yyyyMMdd').md"

# Or just open the folder and look for today's log
Explorer .\PromptTracking\
```

## 🔧 Direct Script Usage (No Aliases)

You can also run the script directly without aliases:

```powershell
# Basic append
.\PromptTracking\session-log.ps1

# With section heading
.\PromptTracking\session-log.ps1 -Section -Title "My Work"

# As code block
.\PromptTracking\session-log.ps1 -CodeBlock

# Custom path
.\PromptTracking\session-log.ps1 -Path ".\custom-log.md"

# With markers (for AI conversations)
.\PromptTracking\session-log.ps1 -Section -Title "Prompt:" -Markers Prompt

# For full parameter list
Get-Help .\PromptTracking\session-log.ps1
```

## ✅ Verification

To verify your installation works:

1. **Load the system**
   ```powershell
   . .\PromptTracking\load-session-logging.ps1
   ```

2. **Copy some text to clipboard** (or just type something and Ctrl+C)

3. **Test the log command**
   ```powershell
   log
   ```

4. **Check the output**
   ```powershell
   # Should show: "Appended clipboard to .\PromptTracking\Session Log YYYYMMDD.md"
   ```

5. **View your log file**
   ```powershell
   cat ".\PromptTracking\Session Log $(Get-Date -Format 'yyyyMMdd').md"
   ```

## 🚨 Troubleshooting

### "Cannot find path" error

**Problem:** Script says `load-session-logging.ps1` not found

**Solution:** 
- Ensure `load-session-logging.ps1` is in the `PromptTracking` folder
- Make sure you're in the project root directory when running the command
- Check folder names are spelled correctly

### "Clipboard empty" warning

**Problem:** Log command says clipboard is empty

**Solution:**
- Copy something to clipboard first: `Ctrl+C`
- Or use the script directly with a path: `.\session-log.ps1 -Path ".\my-log.md"`

### PowerShell execution policy error

**Problem:** Script execution is blocked by policy

**Solution:**
```powershell
# Set execution policy for current user
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Or run PowerShell as Admin and run the above command
```

### Commands not recognized after opening PowerShell

**Problem:** Aliases don't work in new PowerShell window

**Solution:**
- Load the system in each new window: `. .\PromptTracking\load-session-logging.ps1`
- Or add to your PowerShell profile (Option 2 above)
- Or use VS Code workspace (Option 3 above)

## 🎯 Next Steps

1. **Try the basic commands** with some test text
2. **Check your generated log file** to see the formatting
3. **Customize the workflow** for your needs
4. **Share with team members** by including the PromptTracking folder in your repo

## 📚 Additional Resources

- **How Session Logging Works** - Technical deep-dive into the system
- **Session Logging README** - Usage examples and best practices
- **profile-addition.ps1** - Reference code for global setup
- **workspace-init.ps1** - Reference code for VS Code workspace setup

## 💡 Tips

- **Daily logs**: Each day creates a new log file automatically
- **Searchable**: All logs are markdown - open any text editor to search
- **No cleanup needed**: It's safe to have many log files
- **Flexible paths**: Can log to custom locations with `-Path` parameter
- **Portable**: Just copy the PromptTracking folder to move it to another project

The system is designed to be simple, reliable, and get out of your way. Happy logging!

