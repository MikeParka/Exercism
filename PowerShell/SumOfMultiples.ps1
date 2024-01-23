Function Get-SumOfMultiples {
    <#
    .SYNOPSIS
    Given a number, find the sum of all the unique multiples of particular numbers up to
    but not including that number.

    .DESCRIPTION
    If we list all the natural numbers below 20 that are multiples of 3 or 5,
    we get 3, 5, 6, 9, 10, 12, 15, and 18.

    .PARAMETER Multiples
    An array of the factors 

    .PARAMETER Limit
    The value BELOW which we test for

    .EXAMPLE
    Get-SumOfMultiples -Multiples @(3, 5) -Limit 10
    
    Returns 23
    #>
    [CmdletBinding()]
    Param(
        [int[]]$Multiples,
        [int]$Limit
    )

    $Total = @()

    ForEach ($BaseValue in $Multiples) {
        $Multiplier = 1
        While($BaseValue * $Multiplier -lt $Limit) {
            $NewValue = $BaseValue * $Multiplier
            If($NewValue -NotIn $Total) {
                $Total += $NewValue
            }
            $Multiplier++
        }
    }

    $want = ($Total | Measure-Object -Sum).Sum
    $want
}