Function Invoke-Panagram() {
    <#
    .SYNOPSIS
    Determine if a sentence is a pangram.
    
    .DESCRIPTION
    A pangram is a sentence using every letter of the alphabet at least once.
    
    .PARAMETER Sentence
    The sentence to check
    
    .EXAMPLE
    Invoke-Panagram -Sentence "The quick brown fox jumps over the lazy dog"
    
    Returns: $true
    #>
    [CmdletBinding()]
    Param(
        [string]$Sentence
    )

    If($null -EQ $Sentence) {
        Return $false
    }

    $alphabet = "abcdefghijklmnopqrstuvwxyz" -split '';

    $lettersOnly = $Sentence -replace "[^a-zA-Z]", "" -split ''
    $lettersOnly = $lettersOnly.ToLower()

    $missingLetters = $alphabet | Where-Object {$_ -notin $lettersOnly};

    If($missingLetters.Length -GT 0) {
        Return $false
    } Else {
        Return $true
    }
}