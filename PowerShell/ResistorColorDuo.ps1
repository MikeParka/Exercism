$data = @('black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white')

Function Get-ColorCodeValue() {

    [CmdletBinding()]
    Param(
        [string[]]$Colors
    )

    $color1 = $Colors[0].ToLower()
    $color2 = $Colors[1].ToLower()
    
    $code1 = $data.IndexOf($color1)
    $code2 = $data.IndexOf($color2)

    $fullCode = "$code1" + "$code2"

    Return $fullCode

}