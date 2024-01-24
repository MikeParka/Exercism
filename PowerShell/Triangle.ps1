Enum Triangle {
    EQUILATERAL
    ISOSCELES
    SCALENE
}

Function Get-Triangle() {
    <#
    .SYNOPSIS
    Determine if a triangle is equilateral, isosceles, or scalene.

    .DESCRIPTION
    Given 3 sides of a triangle, return the type of that triangle if it is a valid triangle.

    An equilateral triangle has all three sides the same length.

    An isosceles triangle has at least two sides the same length.

    A scalene triangle has all sides of different lengths.
    
    .PARAMETER Sides
    The lengths of a triangle's sides.

    .EXAMPLE
    Get-Triangle -Sides @(1,2,3)
    Return: [Triangle]::SCALENE
    #>
    
    [CmdletBinding()]
    Param (
        [double[]]$Sides
    )

    $a = $Sides[0]
    $b = $Sides[1]
    $c = $Sides[2]

    If ($null -EQ $Sides) {
        Throw "Invalid value"
    }

    If ($Sides.Length -NE 3) {
        Throw "Side lengths violate triangle inequality."
    }

    If (($a -LT 0 -OR $b -LT 0 -OR $c -LT 0) -OR ($a + $b +$c) -LT 1) {
        Throw "All side lengths must be positive."
    }

    If ((($a + $b) -GE $c) -AND (($b + $c) -GE $a) -AND (($a + $c) -GE $b)) {
        If ($a -EQ $b -AND $b -EQ $c -AND $c -EQ $a) {
            return [Triangle]::EQUILATERAL
        }
        
        If (($a -EQ $b -AND $b -NE $c) -OR ($a -eq $c -AND $c -ne $b) -OR ($b -eq $c -AND $c -ne $a)) {
            return [Triangle]::ISOSCELES
        }
        
        If ($a -NE $b -AND $b -NE $c -AND $a -NE $c) {
            return [Triangle]::SCALENE
        }

    } Else {
        Throw "Side lengths violate triangle inequality."
    }
}