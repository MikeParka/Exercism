Function Get-NucleotideCount() {
    <#
    .SYNOPSIS
    Given a single stranded DNA string, compute how many times each nucleotide occurs in the string.
    
    .DESCRIPTION
    The genetic language of every living thing on the planet is DNA.
    DNA is a large molecule that is built from an extremely long sequence of individual elements called nucleotides.
    4 types exist in DNA and these differ only slightly and can be represented as the following symbols: 'A' for adenine, 'C' for cytosine, 'G' for guanine, and 'T' thymine.
    
    The function counts the occurances of A, C, G and T in the supplied strand.
    And returns a hashtable in the format:
    
    @{ A = 2; C = 2; G = 2; T = 3 }
    
    .PARAMETER Strand
    The DNA strand to count
    
    .EXAMPLE
    Get-NucleotideCount -Strand "ACGTAGCTT"
    
    Returns: @{ A = 2; C = 2; G = 2; T = 3 }
    #>
    [CmdletBinding()]
    Param(
    [string]$Strand
    )
    
    $nucleotide = @{ 'A' = 0;'C' = 0;'G' = 0;'T' = 0} 
    
    If ($null -NE $Strand) {
        $stringArray = $Strand.toCharArray()
        ForEach ($char in $stringArray) {
            If ($char -EQ "A") {
                $nucleotide["A"]++
            }
            Elseif ($char -EQ "C") {
                $nucleotide["C"]++
            }
            Elseif ($char -EQ "G") {
                $nucleotide["G"]++
            }
            Elseif ($char -EQ "T") {
                $nucleotide["T"]++
            }
            Else {
                Throw "Invalid nucleotide in strand"
            }
        }
    } 
    
    Return $nucleotide
    
    }