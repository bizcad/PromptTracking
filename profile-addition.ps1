# Add this to your PowerShell Profile for global access
# Profile location: $PROFILE (usually Documents\PowerShell\Microsoft.PowerShell_profile.ps1)
# 
# Adjust the path to point to wherever you installed the PromptTracking folder

# Example: If you installed PromptTracking at C:\MyProject\PromptTracking
# Set $PromptTrackingPath = "C:\MyProject\PromptTracking\load-session-logging.ps1"

# Auto-load session logging from project folder if available
$projectPath = Get-Location
$PromptTrackingPath = Join-Path $projectPath "PromptTracking" "load-session-logging.ps1"

if (Test-Path $PromptTrackingPath) {
    & $PromptTrackingPath
}
else {
    # Fallback: Look for PromptTracking in common locations
    $commonPaths = @(
        ".\PromptTracking\load-session-logging.ps1",
        ".\PromptTracking\log-aliases.ps1"
    )
    
    foreach ($path in $commonPaths) {
        if (Test-Path $path) {
            . $path
            break
        }
    }
}
