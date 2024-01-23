$colorData = @('black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white')

$multiplierData = @{
    Black = 1
    Brown = 10
    Red = 100
    Orange = 1000
    Yellow = 10000
    Green = 100000
    Blue = 1000000
    Violet = 10000000
    Grey = 100000000
    White = 1000000000
    Gold = 0.1
    Silver = 0.01
}

$toleranceData = @{
    Grey = 0.05
    Violet = 0.1
    Blue = 0.25
    Green = 0.5
    Brown = 1
    Red = 2
    Gold = 5
    Silver = 10
}

Function Get-ResistorLabel() {

    [CmdletBinding()]
    Param(
        [string[]]$Colors
    )
    
    If ($Colors.Count -eq 1)
    {
        $Value_1 = 0
        Return "$Value_1 ohms"
    }

    If ($Colors.Count -eq 4)
    {
        $Value_1 = $colorData.IndexOf($Colors[0].ToLower())
        $Value_2 = $colorData.IndexOf($Colors[1].ToLower())
        $Multiplier = $multiplierData.Get_Item($Colors[2].ToLower())
        $Tolerance = $toleranceData.Get_Item($Colors[3])
        $resistor = "$Value_1" + "$Value_2"
        $multiplied = [int64]$resistor * [int64]$Multiplier
        If ($multiplied -lt 1000) {
            $want = "$multiplied ohms ±$Tolerance%"
        }
        Elseif ($multiplied -lt 1000000){
            $multiplied = $multiplied / 1000
            $want = "$multiplied kiloohms ±$Tolerance%"
        }
        Else {
            $multiplied = $multiplied / 1000000
            $want = "$multiplied megaohms ±$Tolerance%"
        }

        Return $want
        
    }

    If ($Colors.Count -eq 5)
    {
        $Value_1 = $colorData.IndexOf($Colors[0].ToLower())
        $Value_2 = $colorData.IndexOf($Colors[1].ToLower())
        $Value_3 = $colorData.IndexOf($Colors[2].ToLower())
        $Multiplier = $multiplierData.Get_Item($Colors[3].ToLower())
        $Tolerance = $toleranceData.Get_Item($Colors[4])
        $resistor = "$Value_1" + "$Value_2" + "$Value_3"
        $multiplied = [int64]$resistor * [int64]$Multiplier
        If ($multiplied -lt 1000) {
            $want = "$multiplied ohms ±$Tolerance%"
        }
        Elseif ($multiplied -lt 1000000) {
            $multiplied = $multiplied / 1000
            $want = "$multiplied kiloohms ±$Tolerance%"
        }
        Else {
            $multiplied = $multiplied / 1000000
            $want = "$multiplied megaohms ±$Tolerance%"
        }

        Return $want
    }

}