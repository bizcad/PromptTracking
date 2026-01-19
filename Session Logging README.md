# Session Logging System - Usage Guide

Quick reference and practical patterns for using the PromptTracking session logging system.

## Quick Reference

### Loading the System

```powershell
# Load for current PowerShell session
. .\PromptTracking\load-session-logging.ps1

# Then use the commands immediately
logt "Session started"
```

### Basic Commands

```powershell
# Copy text to clipboard first, then:
log          # Append with timestamp
logs         # Append as section heading
logc         # Append as code block
logt "title" # Append with custom title
```

### AI Conversation Tracking

```powershell
# After copying your prompt
logp

# After copying the response
logr
```

## 🎯 Common Workflows

### Workflow 1: AI-Assisted Development

**Scenario:** You're working with GitHub Copilot, ChatGPT, or Claude

```powershell
# 1. Copy your prompt from the chat
logp

# 2. Copy the AI's response
logr

# 3. If you add notes about the response
logn

# 4. If you implement code from the response
logc
```

**Result in log file:**
```markdown
# Prompt (2025-01-18 14:30:22)
<!--Start Prompt-->
How should I optimize this database query?
<!--End Prompt-->

# Response (2025-01-18 14:31:15)
<!--Start Response-->
You should consider adding indexes on the foreign key columns...
<!--End Response-->

# Note (2025-01-18 14:32:00)
<!--Start Note-->
Already have indexes, but response gave good idea about query rewrite
<!--End Note-->

## Code (2025-01-18 14:33:45)

```sql
SELECT u.*, p.* FROM Users u
LEFT JOIN Posts p ON u.Id = p.UserId
WHERE u.Created > @StartDate
```
```

### Workflow 2: Bug Investigation

**Scenario:** You're debugging a complex issue

```powershell
# Document the problem
logt "404 error in checkout flow - user reports item not found"

# Add stack trace
logc

# Add investigation notes
logt "Error occurs after payment, checking transaction logs"

# Add findings
logc  # Paste relevant log lines
```

**Result:**
```markdown
## 404 error in checkout flow - user reports item not found (2025-01-18 09:15:00)

[code block with stack trace]

## Error occurs after payment, checking transaction logs (2025-01-18 09:45:00)

[code block with transaction logs]
```

### Workflow 3: Feature Development

```powershell
# Start of feature work
logt "Starting authentication refactor"

# Document decision
logt "Decided to use JWT tokens instead of session cookies"

# Log implementation code
logc

# Add code review notes
logt "Code reviewed by @team-member, approved for merge"
```

### Workflow 4: Meeting Notes

```powershell
# Quick meeting notes
logt "Sprint planning: priorities for next 2 weeks"

# Copy agenda items
logs "Infrastructure Improvements"
# Paste agenda...

# Copy discussion outcomes
logs "Database Migration Strategy"
# Paste decisions...
```

## 📋 Log File Format

### Daily Files
- Location: `PromptTracking/Session Log YYYYMMDD.md`
- Example: `Session Log 20250118.md` (January 18, 2025)
- New file created automatically each day

### Content Organization

```markdown
# Session Log 2025-01-18                    # Date header (auto-created)

[2025-01-18 09:00:00]                       # Basic timestamp entry
Morning standup notes...

## Feature Implementation (2025-01-18 09:30:22)    # Section with title
Implementation details...

# Prompt (2025-01-18 14:00:00)               # H1 section (AI sections)
<!--Start Prompt-->
Prompt content...
<!--End Prompt-->

## Code Example (2025-01-18 14:05:30)       # Code block

```powershell
# Your code here
function Example() { }
```
```

## 🔍 Searching Logs

### Using PowerShell

```powershell
# Search logs for a specific topic
Select-String "bug fix" .\PromptTracking\*.md

# Find entries from a specific date
Get-Content ".\PromptTracking\Session Log 20250118.md"

# Find entries containing code
Select-String -Pattern "```" .\PromptTracking\*.md
```

### Using VS Code

1. Open the `PromptTracking` folder in VS Code
2. Use `Ctrl+Shift+F` to search all files
3. Search for keywords, dates, or patterns

### Using Windows Search

1. Open File Explorer
2. Navigate to `PromptTracking`
3. Use the search box (top right) to find logs
4. Open log files with any text editor

## 💡 Pro Tips

### Tip 1: Use Descriptive Titles
```powershell
# Good
logt "Fixed: Users couldn't submit forms due to validation bug"

# Less helpful
logt "Bug fix"
```

### Tip 2: Group Related Entries
```powershell
# Start a section for major work
logs "Implementing Payment Processing"

# Add multiple entries under that section
logt "Added Stripe integration"
logc  # Paste the Stripe API code

logt "Added payment webhook handler"
logc  # Paste webhook code
```

### Tip 3: Add Context with Notes
```powershell
# Log the code
logc

# Then add explanation
logn  # or logt "Note: ..."
```

### Tip 4: Use Daily Summaries
```powershell
# At end of day, summarize
logt "Daily Summary: Completed user auth, started payment system, 3 code reviews"
```

### Tip 5: Mark Important Decisions
```powershell
logt "DECISION: Using PostgreSQL for primary DB (considered: MySQL, Mongo)"
logc  # Paste the decision document
```

## 🎨 Formatting Tips

### Code Blocks
```powershell
# Copy code to clipboard
logc  # Automatically wraps in ``` fences

# Code blocks support syntax highlighting in markdown
```

### Inline Code vs Blocks
```powershell
# For inline references
logt "Updated the User.cs class to add LoginAttempts"

# For full code
logc  # Copy class to clipboard, use this
```

### Sections and Headings
```powershell
# H2 heading (default for -Section)
logs "Major Feature Work"

# H1 heading (for emphasis)
logs "CRITICAL BUG FIX" 
# Then modify the log file manually to use # instead of ##
```

## 🔄 Organizing Multiple Projects

### With Multiple PromptTracking Folders

```
Project1/
├── PromptTracking/
│   └── Session Log *.md

Project2/
├── PromptTracking/
│   └── Session Log *.md

Project3/
├── PromptTracking/
│   └── Session Log *.md
```

**Workflow:**
```powershell
# Switch between projects
cd Project1
. .\PromptTracking\load-session-logging.ps1
logt "Working on Project1"

cd ..\Project2
. .\PromptTracking\load-session-logging.ps1
logt "Switched to Project2"
```

### Centralized Logging (Alternative)

```powershell
# Log to a central location
.\PromptTracking\session-log.ps1 -Path "C:\AllLogs\Session-$(Get-Date -Format 'yyyy-MM-dd').md"
```

## 📤 Sharing Logs

### With Team
```powershell
# Share a daily log
Copy-Item ".\PromptTracking\Session Log 20250118.md" -Destination "\\shared\team-logs\"

# Or email the file
# Logs are just markdown - open in any editor
```

### In Version Control
```powershell
# Option 1: Commit logs (preserve history)
git add "PromptTracking/Session Log *.md"
git commit -m "Add session logs from 2025-01-18"

# Option 2: Ignore logs (don't track)
echo "PromptTracking/Session Log *.md" >> .gitignore
```

### In Documentation
```powershell
# Copy log content into documentation
Get-Content ".\PromptTracking\Session Log 20250118.md" | 
  Select-Object -First 50  # Get first 50 lines
```

## 🎯 Advanced Patterns

### Pattern 1: Decision Documentation
```powershell
logt "DECISION: Database Schema - Normalized vs Denormalized"
logc  # Paste schema options and analysis
logt "Outcome: Using 3NF normalization with selective denormalization"
```

### Pattern 2: Code Review Trail
```powershell
logt "PR #123: User Authentication - Ready for Review"
logc  # Paste code changes

logt "Review Comments: Needs input validation, update docs"

logt "Addressed review feedback, pushed new commits"
```

### Pattern 3: Performance Investigation
```powershell
logt "Performance issue: Page load > 5 seconds"
logc  # Paste profiling data

logt "Root cause: N+1 query in user dashboard"

logt "Solution: Implemented join-based query"
logc  # Paste optimized query
```

### Pattern 4: Learning Documentation
```powershell
logt "Learning: PowerShell Pipeline Objects"
logc  # Paste code examples

logt "Key Insight: Understanding $_ in pipelines"

logt "Example Implementation:"
logc  # Paste your test code
```

## 🚀 Automation Ideas

### Alias for Daily Summary
```powershell
function log-daily-summary([string]$summary) {
    "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - DAILY SUMMARY: $summary" | 
    Set-Clipboard
    logt "Daily Summary"
}

# Usage: log-daily-summary "Completed auth system, 90% of tests passing"
```

### Alias for Time-based Entries
```powershell
function log-standup {
    logt "Daily Standup - $(Get-Date -Format 'HH:mm')"
}

# Usage: log-standup
```

## 🔧 Command Reference

| Command | Full Script | Purpose |
|---------|------------|---------|
| `log` | `session-log.ps1` | Basic timestamp entry |
| `logs` | `session-log.ps1 -Section` | Section heading entry |
| `logc` | `session-log.ps1 -CodeBlock` | Code block entry |
| `logt "x"` | `session-log.ps1 -Section -Title "x"` | Custom title entry |
| `logp` | `session-log.ps1 -Section -Title "Prompt:" -H1 -Markers Prompt` | AI prompt entry |
| `logr` | `session-log.ps1 -Section -Title "Response:" -H1 -Markers Response` | AI response entry |
| `logn` | `session-log.ps1 -Section -Title "Note:" -H1 -Markers Note` | General note entry |

For full parameter reference:
```powershell
Get-Help .\PromptTracking\session-log.ps1 -Detailed
```

## ❓ FAQ

**Q: How big can my logs get?**
A: Logs are just text files. A full year of daily logs is typically < 10MB.

**Q: Can I export logs to PDF?**
A: Yes - open any log in VS Code and "Export as PDF" from the command palette.

**Q: Can I search across multiple days?**
A: Yes - use `Select-String "pattern" .\PromptTracking\*.md` or VS Code's global search.

**Q: Should I commit logs to Git?**
A: That's your choice. Some teams do for history, others add to `.gitignore` for privacy.

**Q: What if I make a mistake in an entry?**
A: Just edit the markdown file directly - it's a normal text file.

Happy logging! 🎉
