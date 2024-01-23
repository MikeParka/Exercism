$data = @('black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white')

Function Get-ResistorLabel() {

    [CmdletBinding()]
    Param(
        [string[]]$Colors
    )

    $color1 = $Colors[0].ToLower()
    $color2 = $Colors[1].ToLower()
    $color3 = $Colors[2].ToLower()
    
    $code1 = $data.IndexOf($color1)
    $code2 = $data.IndexOf($color2)
    
    switch ( $color3 )
{
    "black" { $multiplier = 1    }
    "brown" { $multiplier = 10    }
    "red" { $multiplier = 100   }
    "orange" { $multiplier = 1000 }
    "yellow" { $multiplier = 10000  }
    "green" { $multiplier = 100000    }
    "blue" { $multiplier = 1000000  }
    "violet" { $multiplier = 10000000  }
    "grey" { $multiplier = 100000000  }
    "white" { $multiplier = 1000000000  }
    "gold" { $multiplier = 0.1  }
    "silver" { $multiplier = 0.01  }
}
    $fullCode = "$code1" + "$code2"
    $multiplied = [int]$fullCode * $multiplier
    $label = $multiplied.ToString()

    If ($label.Length -lt 4) {
        $label += " ohms"
    } Elseif ($label.Length -lt 7) {
        $label = $label.Substring(0,$label.Length - 3)
        $label += " kiloohms"
    } Elseif ($label.Length -lt 10) {
        $label = $label.Substring(0,$label.Length - 6)
        $label += " megaohms"
    } Elseif ($label.Length -lt 13) {
        $label = $label.Substring(0,$label.Length - 9)
        $label += " gigaohms"
    } Else {
        $label += " ohms"
    }

    Return $label

}