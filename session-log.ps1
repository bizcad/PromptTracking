<#
Session Log Appender
Usage:  
  pwsh -File .\PromptTracking\session-log.ps1            # Append clipboard to today's log
  pwsh .\PromptTracking\session-log.ps1 -CodeBlock         # Wrap clipboard in fenced block
  pwsh .\PromptTracking\session-log.ps1 -Title "Spec Sync" -Section
  pwsh .\PromptTracking\session-log.ps1 -Path .\PromptTracking\Session\ Custom.md
Parameters:
  -Path <string>    Explicit file path (otherwise Session Log yyyyMMdd.md in PromptTracking)
  -Section          Create a level-2 heading for this entry
  -Title <string>   Custom section title (requires -Section)
  -CodeBlock        Wrap clipboard content in ``` fences
  -Quiet            Suppress confirmation output
#>
param(
  [string]$Path,
  [switch]$Section,
  [string]$Title,
  [switch]$CodeBlock,
  [switch]$Quiet
)

function Get-SessionLogPath {
  param([string]$Explicit)
  if ($Explicit) { return (Resolve-Path -LiteralPath $Explicit -ErrorAction SilentlyContinue) ?? $Explicit }
  $dir = Join-Path $PSScriptRoot '.'
  $date = Get-Date -Format 'yyyyMMdd'
  return Join-Path $dir "Session Log $date.md"
}

$target = Get-SessionLogPath -Explicit $Path
$content = Get-Clipboard -Raw
if (-not $content) { Write-Warning 'Clipboard empty – nothing appended.'; exit 1 }

$timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
$header = if ($Section) {
  if ($Title) { "`n## $Title ($timestamp)`n" } else { "`n## Entry $timestamp`n" }
} else { "`n[$timestamp]`n" }

if ($CodeBlock) { $content = "``````n$content`n``````" }

if (-not (Test-Path $target)) {
  "# Session Log $(Get-Date -Format 'yyyy-MM-dd')`n" | Out-File $target -Encoding UTF8
}
Add-Content -Path $target -Value ($header + $content + "`n") -Encoding UTF8

if (-not $Quiet) { Write-Host "Appended clipboard to $target" -ForegroundColor Green }
