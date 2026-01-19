# PromptTracking 📝

> **A frictionless session logging system for developers and AI-assisted workflows**

Capture your development sessions into searchable, timestamped markdown logs with a single PowerShell command. Perfect for tracking conversations with AI assistants, documenting decisions, and creating searchable knowledge bases.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue.svg)
![Platform](https://img.shields.io/badge/platform-Windows-lightgrey.svg)

## 🎯 What is PromptTracking?

PromptTracking is a **clipboard-to-markdown session logging system** designed for developers working with AI assistants like GitHub Copilot, ChatGPT, and Claude. It captures your development conversations, decisions, and code changes in real-time, creating a searchable record that preserves context between sessions.

### 💡 Why This Exists

When working with AI assistants, context is everything. PromptTracking solves:
- **Lost context** when starting new AI sessions
- **Forgotten solutions** from previous conversations  
- **Undocumented decisions** and their reasoning
- **Difficulty tracking** what actually worked

## ✨ Key Features

- **🚀 One-command logging** - `logt "Fixed the bug"` captures timestamped entries instantly
- **📋 Clipboard integration** - Paste code, discussions, or notes with proper markdown formatting
- **🎨 Rich formatting** - Section headers, code blocks, and structured entries with markers
- **🔍 Searchable records** - Markdown format works with any search tool or text editor
- **⚡ Zero friction** - Doesn't interrupt your coding flow
- **🌐 Project-agnostic** - Works in any folder, no configuration needed
- **💻 PowerShell-first** - Runs on Windows with just PowerShell, no VS Code required
- **🎯 Optional VS Code integration** - Automatic loading when opening workspaces

## 🚀 Quick Start

### Step 1: Copy PromptTracking Folder

```powershell
# Clone or download the repository
git clone https://github.com/bizcad/PromptTracking.git

# Copy the PromptTracking folder to your project root
cp -Recurse PromptTracking "C:\Your\Project\Path\"
```

### Step 2: Load the System

```powershell
# Navigate to your project
cd "C:\Your\Project\Path"

# Load the session logging system (one-time per PowerShell session)
. .\PromptTracking\load-session-logging.ps1
```

### Step 3: Start Logging

```powershell
# Copy something to clipboard, then run:
logt "What you're doing"

# View the generated log file
cat ".\PromptTracking\Session Log $(Get-Date -Format 'yyyyMMdd').md"
```

That's it! Your log file is ready to use.

## 📋 Available Commands

| Command | Description |
|---------|-------------|
| `log` | Append clipboard with timestamp |
| `logs` | Append clipboard as section heading |
| `logc` | Append clipboard as code block |
| `logt "title"` | Append with custom title section |
| `logp` | Append as "Prompt:" (with markers) |
| `logr` | Append as "Response:" (with markers) |
| `logn` | Append as "Note:" (with markers) |
| `Show-LogHelp` | Display all commands |

## 🎯 Usage Examples

### AI Conversation Logging

```powershell
# Copy your prompt to clipboard
logp

# Copy the AI response to clipboard
logr
```

### Code Changes

```powershell
# Copy a code snippet to clipboard
logc
```

### Daily Notes

```powershell
# Copy your notes to clipboard
logt "Fixed database connection pool issue"
```

### Generated Output

```markdown
# Session Log 2025-01-18

[2025-01-18 14:30:22]
Initial project setup

## Database Design (2025-01-18 14:31:15)

<!--Start Prompt-->
How should I structure the database schema?
<!--End Prompt-->

## Response (2025-01-18 14:31:45)

<!--Start Response-->
I'd recommend normalizing to 3NF...
<!--End Response-->

## Code Example (2025-01-18 14:32:10)

```sql
CREATE TABLE Users (
    Id UNIQUEIDENTIFIER PRIMARY KEY,
    Username NVARCHAR(255) NOT NULL
);
```
```

## 📁 Installation Methods

### Option 1: Simple (PowerShell per session)

```powershell
cd "C:\Your\Project"
. .\PromptTracking\load-session-logging.ps1
```

No setup needed - just load when you need it.

### Option 2: Global (PowerShell Profile)

Add to your PowerShell profile (`$PROFILE`):

```powershell
# Auto-load session logging when in a project folder
if (Test-Path ".\PromptTracking\load-session-logging.ps1") {
    . .\PromptTracking\load-session-logging.ps1
}
```

Now it loads automatically in project folders with PromptTracking.

### Option 3: VS Code Workspace (Optional)

Create or update your `.code-workspace` file:

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

Open the workspace in VS Code and the logging system loads automatically!

## 🛠️ Requirements

- **PowerShell 5.1+** (built-in on Windows 10+)
- **Windows OS** (PS Core on Mac/Linux with modifications)
- **Clipboard support** (standard on Windows)

## 📁 File Structure

```
YourProject/
├── PromptTracking/
│   ├── session-log.ps1               # Main logging script
│   ├── log-aliases.ps1               # Command aliases
│   ├── load-session-logging.ps1      # Initialization helper
│   ├── workspace-init.ps1            # VS Code workspace setup
│   └── Session Log YYYYMMDD.md       # Daily logs (auto-created)
├── .code-workspace                   # VS Code config (optional)
└── ... your project files
```

## 🎨 Advanced Features

### Clipboard Size Guards

```powershell
# Prevent accidental huge clipboard pastes
.\PromptTracking\session-log.ps1 `
  -GuardLargeClipboard `
  -MaxClipboardChars 50000 `
  -AutoTruncate
```

### Day Boundary Markers

```powershell
# Mark start/end of day for parsing
.\PromptTracking\session-log.ps1 -DayStart
.\PromptTracking\session-log.ps1 -DayEnd
```

### Custom Heading Levels

```powershell
# Use H1 instead of H2
log "Entry" -H1 -Section
```

### Direct Script Usage

```powershell
# No aliases - call script directly
.\PromptTracking\session-log.ps1 -Section -Title "My Entry" -CodeBlock
```

## 🔄 Use Cases

### AI-Assisted Development
- Track conversations with GitHub Copilot, ChatGPT, Claude
- Document reasoning behind code decisions
- Create searchable knowledge bases of solutions
- Preserve context between development sessions

### Development Workflows
- Bug investigation and debugging
- Feature implementation progress
- Code review discussions
- Meeting notes and decisions

### Learning & Documentation
- Tutorial progress tracking
- Concept exploration logs
- Problem-solving documentation
- Team knowledge sharing

## 🚨 Troubleshooting

### "Clipboard empty" warning
```powershell
# Copy something first
"Your text" | Set-Clipboard

# Then run the command
log
```

### Execution policy blocked
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Commands not found
```powershell
# Load the system in your current session
. .\PromptTracking\load-session-logging.ps1
```

See [InstallationGuide.md](InstallationGuide.md) for more troubleshooting.

## 📚 Documentation

- **[InstallationGuide.md](InstallationGuide.md)** - Complete setup instructions for all methods
- **[How Session Logging Works.md](How%20Session%20Logging%20Works.md)** - Technical deep-dive into the system
- **[Session Logging README.md](Session%20Logging%20README.md)** - Usage patterns and best practices

## 💡 Tips

- **Daily logs**: Each day creates a new file automatically
- **Searchable**: Open any log file in VS Code or text editor and search
- **Safe**: Nothing is deleted - logs accumulate indefinitely
- **Portable**: Copy the `PromptTracking` folder to move it to another project
- **Flexible**: Can log to custom paths with `-Path` parameter
- **Team-friendly**: Commit logs to version control or add to `.gitignore`

## 🤔 FAQ

**Q: Is my data private?**
A: Yes. Logs are stored locally as markdown files on your machine. Nothing is sent anywhere.

**Q: Can I customize the format?**
A: Absolutely! Edit `session-log.ps1` or the aliases to match your workflow.

**Q: Does this work without VS Code?**
A: Yes! The core scripts work in any PowerShell terminal. VS Code integration is optional.

**Q: Can I delete old logs?**
A: Yes. They're just markdown files - delete them like any other file.

**Q: Does this work on Mac/Linux?**
A: The scripts are PowerShell-based. Install PowerShell Core and they should work with modifications.

## 🚀 Next Steps

1. **Clone or download** the repository
2. **Copy PromptTracking folder** to your project
3. **Load the system**: `. .\PromptTracking\load-session-logging.ps1`
4. **Test a command**: `logt "Testing the system"`
5. **View your log**: `cat ".\PromptTracking\Session Log $(Get-Date -Format 'yyyyMMdd').md"`
6. **Customize** for your workflow

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

⭐ **If PromptTracking improves your workflow, please star this repository!** ⭐

**Have questions?** Open an issue on GitHub.  
**Want to contribute?** Pull requests are welcome!
