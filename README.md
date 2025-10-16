# PromptTracking 📝

> **A frictionless session logging system for AI-assisted development workflows**

Transform your AI coding sessions into searchable, timestamped knowledge bases with simple PowerShell commands and automatic VS Code workspace integration.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue.svg)
![VS Code](https://img.shields.io/badge/VS%20Code-Compatible-green.svg)
![Platform](https://img.shields.io/badge/platform-Windows-lightgrey.svg)

## 🎯 What is PromptTracking?

PromptTracking is a **clipboard-to-markdown session logging system** designed specifically for developers working with AI assistants like GitHub Copilot. It captures your development conversations, decisions, and code changes in real-time, creating a searchable record that preserves context between sessions.

### 💡 Why This Exists

When working with AI assistants, context is everything. PromptTracking solves the problem of:
- **Lost context** when starting new AI sessions
- **Forgotten solutions** from previous conversations  
- **Undocumented decisions** and their reasoning
- **Difficulty tracking** what actually worked

## ✨ Key Features

- **🚀 One-command logging** - `logt "Fixed the bug"` captures timestamped entries instantly
- **🔄 Automatic workspace setup** - Loads seamlessly when you open VS Code projects
- **📋 Clipboard integration** - Paste code, discussions, or notes with proper markdown formatting
- **🎨 Rich formatting** - Section headers, code blocks, and structured entries
- **🔍 Searchable records** - Markdown format works with any search tool
- **⚡ Zero friction** - Doesn't interrupt your coding flow
- **🌐 Portable** - Works on any machine with PowerShell

## 🚀 Quick Start

### Option 1: Automatic VS Code Integration (Recommended)

1. **Download and extract** this repository to your project root as `PromptTracking/`
2. **Add this task** to your VS Code workspace file (`.code-workspace`):

```json
{
  "folders": [{"path": "."}],
  "tasks": {
    "version": "2.0.0",
    "tasks": [{
      "label": "Load Session Log Aliases",
      "type": "shell",
      "command": "pwsh",
      "args": ["-File", "${workspaceFolder}/PromptTracking/workspace-init.ps1"],
      "runOptions": {"runOn": "folderOpen"}
    }]
  }
}
```

3. **Open your workspace** in VS Code - the logging system loads automatically! 🎉

### Option 2: Manual Setup

```powershell
# Navigate to your project with PromptTracking folder
cd "C:\your-project"

# Load the session logging system
. .\PromptTracking\log-aliases.ps1

# Start logging!
logt "Session started"
```

## 📋 Available Commands

| Command | Description | Example |
|---------|-------------|---------|
| `logt "text"` | **Log text entry** with timestamp | `logt "Fixed authentication bug"` |
| `logs "heading"` | **Create section** with heading | `logs "New Feature Implementation"` |
| `logc` | **Log code block** from clipboard | Copy code, then `logc` |
| `log-help` | **Show all commands** | `log-help` |

## 📁 File Structure

```
PromptTracking/
├── 📜 workspace-init.ps1          # Automatic VS Code workspace setup
├── 🔧 session-log.ps1             # Core logging functionality  
├── ⚡ log-aliases.ps1              # Command shortcuts
├── 📚 InstallationGuide.md        # Detailed setup instructions
├── 📋 Session Logging README.md   # Usage documentation
├── 📄 Session Log YYYYMMDD.md     # Daily log files (auto-created)
└── 📃 LICENSE                     # MIT License
```

## 🎯 Usage Examples

### Basic Logging
```powershell
# Log a thought or decision
logt "Decided to use Entity Framework for the data layer"

# Create a new section
logs "Database Schema Design"

# Log code from clipboard (copy first, then run)
logc
```

### Automatic Workspace Output
When you open a VS Code workspace with PromptTracking configured:

```
🚀 Initializing workspace...
📁 Project root: C:\YourProject
📝 Loading session logging system...
✅ Session logging system loaded successfully!

📋 Available commands:
   logt    - Log text entry
   logs    - Log section header  
   logc    - Log code block
   log-help - Show all logging commands

🎯 Workspace ready!
```

### Generated Log Format
```markdown
## Database Schema Design (2025-10-15 14:30:22)

[2025-10-15 14:31:15]
Decided to use Entity Framework for the data layer

[2025-10-15 14:32:08]
```csharp
public class SurveyQuestion 
{
    public Guid Id { get; set; }
    public string QuestionText { get; set; }
    public int SortOrder { get; set; }
}
```
```

## 🛠️ Installation

### Prerequisites
- **Windows** with PowerShell 5.1+ (or PowerShell Core)
- **VS Code** (optional, for automatic workspace integration)
- **Git** (optional, for cloning)

### Step-by-Step Setup

1. **Download** the latest release or clone this repository
2. **Extract/copy** the `PromptTracking` folder to your project root
3. **Choose your setup method:**

#### VS Code Workspace (Automatic)
- Follow the "Quick Start" workspace configuration above
- Open your workspace file - logging loads automatically

#### PowerShell Profile (Global)
```powershell
# Add to your $PROFILE
if (Test-Path ".\PromptTracking\session-log.ps1") {
    . ".\PromptTracking\log-aliases.ps1"
    Write-Host "Session logging loaded!" -ForegroundColor Green
}
```

#### Manual (Per Session)
```powershell
. .\PromptTracking\log-aliases.ps1
```

## 🎨 Advanced Features

### VS Code Integration
- **Automatic loading** when workspace opens
- **Terminal integration** with PowerShell
- **Task automation** for consistent setup
- **Multi-project support** with relative paths

### Customization
- **Modify aliases** in `log-aliases.ps1`
- **Adjust output format** in `session-log.ps1`
- **Custom workspace tasks** for your workflow
- **Integration** with other tools via PowerShell

### Output Management
- **Daily log files** prevent huge documents
- **Markdown format** works with any editor
- **Searchable content** using VS Code, grep, or any tool
- **Version control friendly** - commit your session logs!

## 🤝 Use Cases

### Perfect for AI-Assisted Development
- **Track conversations** with GitHub Copilot, ChatGPT, Claude
- **Document decisions** and their reasoning
- **Preserve context** between sessions
- **Create searchable knowledge** bases

### Development Workflows
- **Bug investigation** tracking
- **Feature development** progress
- **Code review** discussions
- **Meeting notes** and decisions

### Learning & Teaching
- **Tutorial progress** tracking
- **Concept exploration** logs
- **Problem-solving** documentation
- **Knowledge sharing** with teams

## 🔧 Troubleshooting

### Commands Not Working?
```powershell
# Check if aliases are loaded
Get-Alias logt

# Reload manually if needed
. .\PromptTracking\log-aliases.ps1
```

### VS Code Workspace Not Loading?
1. Verify `workspace-init.ps1` exists in `PromptTracking/`
2. Check workspace task configuration
3. Ensure PowerShell execution policy allows scripts:
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

### Path Issues?
- Use **absolute paths** if relative paths don't work
- Ensure `PromptTracking` folder is at project root
- Check that all required files exist

## 📈 Benefits

### Immediate Value
- **Zero setup friction** with automatic workspace loading
- **Instant logging** without breaking flow
- **Visual feedback** showing system status
- **Consistent commands** across all projects

### Long-term Impact
- **Conversation continuity** between AI sessions
- **Knowledge preservation** of what worked
- **Faster context switching** when returning to projects
- **Team knowledge sharing** through committed logs

## 🤔 FAQ

**Q: Does this work with other editors besides VS Code?**
A: Yes! The core PowerShell scripts work in any terminal. VS Code integration is optional.

**Q: Can I customize the log format?**
A: Absolutely! Edit `session-log.ps1` to change timestamp format, markdown structure, or add custom fields.

**Q: Is this safe for sensitive projects?**
A: The logs are local files. Review content before committing to version control. Add `Session Log *.md` to `.gitignore` if needed.

**Q: Does this work on Mac/Linux?**
A: The scripts are PowerShell-based. Install PowerShell Core on Mac/Linux, or adapt the scripts for bash/zsh.

## 🚀 Getting Started

Ready to transform your AI development workflow? 

1. **[Download the latest release](https://github.com/yourusername/PromptTracking/releases)**
2. **Extract to your project** as `PromptTracking/`
3. **Follow the Quick Start** guide above
4. **Start logging** with `logt "First entry!"`

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Inspired by** the need for better AI development workflows
- **Built for** developers working with GitHub Copilot, ChatGPT, and other AI assistants
- **Designed around** the principle that good documentation accelerates development

---

⭐ **If this tool improves your AI development workflow, please give it a star!** ⭐

**Questions?** Open an issue or start a discussion. **Improvements?** Pull requests welcome!