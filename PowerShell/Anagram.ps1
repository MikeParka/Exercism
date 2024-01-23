Function Invoke-Anagram() {
    <#
    .SYNOPSIS
    Determine if a word is an anagram of other words in a list.

    .DESCRIPTION
    An anagram is a word formed by rearranging the letters of another word, e.g., spar, formed from rasp.
    Given a word and a list of possible anagrams, find the anagrams in the list.

    .PARAMETER Subject
    The word to check

    .PARAMETER Candidates
    The list of possible anagrams

    .EXAMPLE
    Invoke-Anagram -Subject "solemn" -Candidates @("lemons", "cherry", "melons")
    #>
    [CmdletBinding()]
    Param(
        [string]$Subject,
        [string[]]$Candidates
    )

    $SubjectSorted = @($Subject.ToLower().ToCharArray() | Sort-Object) -join ""
    $Anagrams = @()

    ForEach ($Candidate in $Candidates) {
        $CandidateSorted = @($Candidate.ToLower().ToCharArray() | Sort-Object) -join ""
        If ($SubjectSorted -EQ $CandidateSorted -AND $Subject.ToLower() -NE $Candidate.ToLower()) {
            $Anagrams += $Candidate
        }
    }

    return $Anagrams
}