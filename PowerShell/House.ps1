$House = @{
    1 = "This is the house that Jack built."
    2 = "This is the malt that lay in the house that Jack built."
    3 = "This is the rat that ate the malt that lay in the house that Jack built."
    4 = "This is the cat that killed the rat that ate the malt that lay in the house that Jack built."
    5 = "This is the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    6 = "This is the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    7 = "This is the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    8 = "This is the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    9 = "This is the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    10 = "This is the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    11 = "This is the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    12 = "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    }
    
    Function Get-Rhyme() {
        <#
        .SYNOPSIS
        Recite the nursery rhyme 'This is the House that Jack Built'.
    
        .DESCRIPTION
        Given the start verse and the end verse, return a string reciting the rhyme from that range.
    
        .PARAMETER Start
        The start verse.
    
        .PARAMETER End
        The end verse.
    
        .EXAMPLE
        Get-Rhyme -Start 1 -End 2
        Return:
        @"
        This is the house that Jack built.
        This is the malt that lay in the house that Jack built.
        "@
         #>
        [CmdletBinding()]
        Param(
            [int]$Start,
            [int]$End
        )

        $Result = ""

        If (($End - $Start) -eq 0) {
            return $House[$Start]
        }

        For ($i = $Start; $i -le $End; $i++) {
            $Result += $House[$i]
            $Result += "\n"
        }

        return $Result
    }