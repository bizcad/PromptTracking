# QuestionManager Workspace Initialization Script
# This script runs automatically when the workspace is opened in VS Code

Write-Host "🚀 Initializing QuestionManager workspace..." -ForegroundColor Cyan
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
        Write-Host "   logt    - Log text entry" -ForegroundColor Gray
        Write-Host "   logs    - Log section header" -ForegroundColor Gray
        Write-Host "   logc    - Log code block" -ForegroundColor Gray
        Write-Host "   log-help - Show all logging commands" -ForegroundColor Gray
    } else {
        Write-Host "⚠️  Session log aliases not found at: $aliasesPath" -ForegroundColor Yellow
    }
} else {
    Write-Host "⚠️  Session log script not found at: $sessionLogPath" -ForegroundColor Yellow
    Write-Host "   Make sure the PromptTracking folder contains session-log.ps1" -ForegroundColor Gray
}

Write-Host ""
Write-Host "🎯 QuestionManager workspace ready!" -ForegroundColor Green
Write-Host "   Current directory: $(Get-Location)" -ForegroundColor Gray
Write-Host ""