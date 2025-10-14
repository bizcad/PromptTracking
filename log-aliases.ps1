# Session Log Aliases - Source this file to get simple commands
# Usage: . .\PromptTracking\log-aliases.ps1

# Simple function aliases for session logging
function log { 
    & "$PSScriptRoot\session-log.ps1" @args 
}

function logs { 
    & "$PSScriptRoot\session-log.ps1" -Section @args 
}

function logc { 
    & "$PSScriptRoot\session-log.ps1" -CodeBlock @args 
}

function logt([string]$title) { 
    & "$PSScriptRoot\session-log.ps1" -Section -Title $title 
}

# Show available commands
function log-help {
    Write-Host "Session Log Aliases:" -ForegroundColor Green
    Write-Host "  log        - Append clipboard with timestamp" -ForegroundColor Yellow
    Write-Host "  logs       - Append clipboard as section" -ForegroundColor Yellow  
    Write-Host "  logc       - Append clipboard as code block section" -ForegroundColor Yellow
    Write-Host "  logt 'title' - Append clipboard as section with custom title" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Examples:" -ForegroundColor Green
    Write-Host "  log" -ForegroundColor Cyan
    Write-Host "  logs" -ForegroundColor Cyan
    Write-Host "  logc" -ForegroundColor Cyan
    Write-Host "  logt 'Bug Fix'" -ForegroundColor Cyan
}

Write-Host "Session log aliases loaded! Type 'log-help' for commands." -ForegroundColor Green