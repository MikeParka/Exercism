Function Invoke-Darts() {
    <#
    .SYNOPSIS
    Calculate the earned points in a single toss of a Darts game.

    .DESCRIPTION
    Take a coordinate of a point and calculate the distance from the center of the dartboard.
    Then depending on the distance and which concentric circle the point lies in, return the
    number of points earned.

    .PARAMETER X
    The X coordinate of the dart.

    .PARAMETER Y
    The Y coordinate of the dart.

    .EXAMPLE
    Invoke-Darts -X 0 -Y 10
    #>
    [CmdletBinding()]
    Param(
        [Double]$X,
        [Double]$Y
    )

    # Define the centre
    $centerX = 0
    $centerY = 0

    # Define the circle radius
    $outer = 10
    $middle = 5
    $centre = 1

    # Calculate the distance between the point and the center of the circle
    $distance = [Math]::Sqrt([Math]::Pow($X - $centerX, 2) + [Math]::Pow($Y - $centerY, 2))

    # Check if the point is inside the circle
    If($distance -le $centre) {
        Return 10
    } ElseIf ($distance -le $middle) {
        Return 5
    } ElseIf ($distance -le $outer) {
        Return 1
    } Else {
        Return 0
    }
}