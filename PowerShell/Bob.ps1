Function Get-BobResponse() {
    <#
    .SYNOPSIS
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.
    
    .DESCRIPTION
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.

    Bob answers 'Sure.' if you ask him a question.

    He answers 'Whoa, chill out!' if you yell at him.

    He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

    He says 'Fine. Be that way!' if you address him without actually saying
    anything.

    He answers 'Whatever.' to anything else.
    
    .PARAMETER HeyBob
    The sentence you say to Bob.
    
    .EXAMPLE
    Get-BobResponse -HeyBob "Hi Bob"
    #>
    Param(
        [string]$HeyBob
    )

    # Remove any trailing spaces from the string.
    $HeyBob = $HeyBob.trim()

    # First check if the string is a question.
    If ($HeyBob[-1] -eq '?') 
    {
        If (($HeyBob -ceq $HeyBob.ToUpper()) -And ($HeyBob -match "[a-zA-z]")) {return "Calm down, I know what I'm doing!"}
        Else {return "Sure."}
    }
    # Then check if the string is empty or only has whitespaces.
    ElseIf ([string]::IsNullOrWhitespace($HeyBob)) {return "Fine. Be that way!"}
    # Then check if the string is in all caps.
    ElseIf (($HeyBob -ceq $HeyBob.ToUpper()) -And ($HeyBob -match "[a-zA-z]")) {return "Whoa, chill out!"}
    # Finally, for everything else return "Whatever."
    Else {return "Whatever."}

}