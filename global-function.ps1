# Add this to your PowerShell profile: $PROFILE
# E:\OneDrive - Personal\OneDrive\Documents\PowerShell\Microsoft.PowerShell_profile.ps1

function PromptTrack {
    <#
    .SYNOPSIS
    Global session log appender - works from any directory
    
    .PARAMETER Path
    Explicit file path (otherwise finds repo root and uses PromptTracking/Session Log yyyyMMdd.md)
    
    .PARAMETER Section
    Create a level-2 heading for this entry
    
    .PARAMETER Title
    Custom section title (requires -Section)
    
    .PARAMETER CodeBlock
    Wrap clipboard content in ``` fences
    
    .PARAMETER Quiet
    Suppress confirmation output
    
    .EXAMPLE
    PromptTrack
    
    .EXAMPLE
    PromptTrack -Section -Title "Bug Fix"
    
    .EXAMPLE
    PromptTrack -CodeBlock
    #>
    param(
        [string]$Path,
        [switch]$Section,
        [string]$Title,
        [switch]$CodeBlock,
        [switch]$Quiet
    )
    
    # Call the actual script with all parameters
    & "g:\repos\QuestionManager\PromptTracking\session-log.ps1" @PSBoundParameters
}