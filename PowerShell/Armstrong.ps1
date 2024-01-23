Function Invoke-ArmstrongNumbers() {
    <#
    .SYNOPSIS
    Determine if a number is an Armstrong number.

    .DESCRIPTION
    An Armstrong number is a number that is the sum of its own digits each raised to the power of the number of digits.

    .PARAMETER Number
    The number to check.

    .EXAMPLE
    Invoke-ArmstrongNumbers -Number 12

    9 is an Armstrong number, because 9 = 9^1 = 9
10 is not an Armstrong number, because 10 != 1^2 + 0^2 = 1
153 is an Armstrong number, because: 153 = 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153
154 is not an Armstrong number, because: 154 != 1^3 + 5^3 + 4^3 = 1 + 125 + 64 = 190

    #>
    [CmdletBinding()]
    Param(
        [Int64]$Number
    )

    If($null -EQ $Number) {
        Throw "Enter a valid number"
    }

    $Armstrong = 0

    [string]$TempString = $Number.ToString()
    $Length = $TempString.Length

    ForEach ($Char in $TempString.ToCharArray()) {
        [Int64]$Digit = [int64]"$Char"
        $Digit2 = [Math]::Pow(([Int64]"$Digit"), $Length)
        $Armstrong += $Digit2
    }

    If($Number -eq $Armstrong) {
        Return $True
    } Else {
        Return $False
    }
}