# Workspace Initialization Script
# This script runs automatically when a VS Code workspace is opened
# It loads the session logging system and displays available commands

Write-Host "🚀 Initializing workspace..." -ForegroundColor Cyan
Write-Host ""

# Ensure we're in the correct project root directory
$projectRoot = Split-Path -Parent $PSScriptRoot
Set-Location $projectRoot

Write-Host "📁 Project root: $projectRoot" -ForegroundColor Gray
Write-Host ""

# Load session logging system
$sessionLogPath = ".\PromptTracking\session-log.ps1"
$aliasesPath = ".\PromptTracking\log-aliases.ps1"

if (Test-Path $sessionLogPath) {
    Write-Host "📝 Loading session logging system..." -ForegroundColor Yellow
    
    # Load main session logging functions
    . $sessionLogPath
    
    # Load command aliases
    if (Test-Path $aliasesPath) {
        . $aliasesPath
        Write-Host "✅ Session logging system loaded successfully!" -ForegroundColor Green
        Write-Host ""
        Write-Host "📋 Available commands:" -ForegroundColor Cyan
        Write-Host "   log      - Append clipboard with timestamp" -ForegroundColor Gray
        Write-Host "   logs     - Append clipboard as section" -ForegroundColor Gray
        Write-Host "   logc     - Append clipboard as code block" -ForegroundColor Gray
        Write-Host "   logt     - Append with custom title" -ForegroundColor Gray
        Write-Host "   logp     - Append as 'Prompt:' section" -ForegroundColor Gray
        Write-Host "   logr     - Append as 'Response:' section" -ForegroundColor Gray
        Write-Host "   logn     - Append as 'Note:' section" -ForegroundColor Gray
        Write-Host "   Show-LogHelp - Show all logging commands" -ForegroundColor Gray
    } else {
        Write-Host "⚠️  Session log aliases not found at: $aliasesPath" -ForegroundColor Yellow
    }
} else {
    Write-Host "⚠️  Session log script not found at: $sessionLogPath" -ForegroundColor Yellow
    Write-Host "   Make sure the PromptTracking folder contains session-log.ps1" -ForegroundColor Gray
}

Write-Host ""
Write-Host "🎯 Workspace ready!" -ForegroundColor Green
Write-Host "   Current directory: $(Get-Location)" -ForegroundColor Gray
Write-Host ""