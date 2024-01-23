$AlwaysTrue      = { $true }
$IsOdd           = { param($num)  $num % 2 -eq 1 }
$IsEven          = { param($num)  $num % 2 -eq 0 }
$LessThanFive    = { param($num)  $num -lt 5 }
$FiveLettersWord = { param($word) $word.Length -eq 5 }
$SumOverTen      = { param($row) ($row | Measure-Object -Sum).Sum -gt 10 }

function Invoke-Keep {
    [CmdletBinding()]
    Param(
        [Object[]]$Data,
        [ScriptBlock]$Predicate
    )

    $want = @()

    $want += $Data | Where-Object { & $Predicate $_ }

return $want

}

Function Invoke-Discard() {
    [CmdletBinding()]
    Param(
        [Object[]]$Data,
        [ScriptBlock]$Predicate
    )

    $want = @()

    $want += $Data | Where-Object { -not (& $Predicate $_) }

    return $want
}