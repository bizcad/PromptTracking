# Add this to your PowerShell Profile for global access
# Profile location: $PROFILE (usually Documents\PowerShell\Microsoft.PowerShell_profile.ps1)

# Session logging aliases - auto-load if in QuestionManager project
if (Test-Path ".\PromptTracking\session-log.ps1") {
    . ".\PromptTracking\log-aliases.ps1"
} elseif (Test-Path ".\log-aliases.ps1") {
    . ".\log-aliases.ps1"
}

# Alternative: Hard-coded path if you want it always available
# . "g:\repos\QuestionManager\PromptTracking\log-aliases.ps1"