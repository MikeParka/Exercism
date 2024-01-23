Function Invoke-BinarySearch() {
    <#
    .SYNOPSIS
    Perform a binary search on a sorted array.

    .DESCRIPTION
    Take an array of integers and a search value and return the index of the value in the array.

    .PARAMETER Array
    The array to search.

    .PARAMETER Value
    The value to search for.

    .EXAMPLE
    Invoke-BinarySearch -Array @(1, 2, 3, 4, 5) -Value 3

    Invoke-BinarySearch -Array @(1, 3, 4, 6, 8, 9, 11) -Value 11
    #>
    [CmdletBinding()]
    param (
        [int[]]$Array,
        [int]$Value
    )

    # Check if the input parameters are valid
    If ($null -EQ $Array -OR $null -EQ $Value -OR $Value -NOTIN $Array) {
        Throw "error: value not in array"
    }

    # If the array has only one element, return its index (0)
    If ($Array.Length -EQ 1) {
        Return 0
    }

    # Initialize left and right pointers for binary search
    $left = 0
    $right = $Array.Length - 1

    # Perform binary search
    while ($left -le $right) {
        $mid = [math]::floor(($left + $right) / 2)
        $midValue = $Array[$mid]

        # If the middle value is equal to the target value, return the index
        if ($midValue -eq $Value) {
            return $mid 
        }
        # If the middle value is less than the target value, adjust left pointer
        elseif ($midValue -lt $Value) {
            $left = $mid + 1
        }
        # If the middle value is greater than the target value, adjust right pointer
        else {
            $right = $mid - 1
        }
    }
}