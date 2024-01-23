Function Invoke-RnaTranscription() {
    <#
    .SYNOPSIS
    Transcribe a DNA strand into RNA.

    .DESCRIPTION
    Given a DNA strand, return its RNA complement (per RNA transcription).

    .PARAMETER Strand
    The DNA strand to transcribe.

    .EXAMPLE
    Invoke-RnaTranscription -Strand "A"
    #>
    [CmdletBinding()]
    Param(
        [string]$Strand
    )

    If($null -EQ $Strand) {
        Return $null
    }

    $Array = $Strand.ToCharArray()
    $RNA = ""

    ForEach($Char in $Array) {
        If ($Char -EQ "C") {
            $RNA += "G"
        } ElseIf ($Char -EQ "G") {
            $RNA += "C"
        } ElseIf ($Char -EQ "T") {
            $RNA += "A"
        } ElseIf ($Char -EQ "A") {
            $RNA += "U"
        } Else {
            $RNA += ""
        }
    }
    
    Return $RNA
}