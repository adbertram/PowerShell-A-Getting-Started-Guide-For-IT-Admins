#region Functions vs Cmdlets
Get-Command -CommandType Function

Get-Command -CommandType Cmdlet
#endregion

#region Basic Syntax
## Defining a Function
function Install-Software { Write-Host 'I installed some software, Yippee!' }

Install-Software

function Install-Software { Write-Host 'You installed some software, Yay!' }

Install-Software
#endregion

#region Adding Parameters
# Creating a Simple Parameter
function Install-Software {
    [CmdletBinding()]
    param()
    Write-Host 'I installed software version 2. Yippee!'
}

Install-Software

help Install-Software

# Adding a version parameter
function Install-Software {
    [CmdletBinding()]
    param(
        [Parameter()]
        [string] $Version
    )
    Write-Host "I installed software version $Version. Yippee!"
}

Install-Software -Version 2

help Install-Software

# The Mandatory Parameter Attribute
function Install-Software {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Version
    )
    Write-Host "I installed software version $Version. Yippee!"
}

Install-Software

help Install-Software -Parameter Version

# Default Parameter Valves
function Install-Software {
    [CmdletBinding()]
    param(
        [Parameter()]
        [string]$Version = 2
    )
    Write-Host "I installed software version $Version. Yippee!"
}

Install-Software

# Adding Parameter Validation Attributes
function Install-Software {
    param(
        [Parameter(Mandatory)]
        [string]$Version
    )
    Get-ChildItem -Path \\SRV1\Installers\SoftwareV$Version
}
Install-Software -Version 3


function Install-Software {
    param(
        [Parameter(Mandatory)]
        [ValidateSet('1', '2')]
        [string]$Version
    )
    Get-ChildItem -Path \\SRV1\Installers\SoftwareV$Version
}
Install-Software -Version 3

(Get-Command Install-Software).Parameters['Version'].Attributes.ValidValues
#endregion

#region Pipeline Support
# Adding Another Parameter
function Install-Software {
    param(
        [Parameter(Mandatory)]
        [ValidateSet('1', '2')]
        [string]$Version,
        [Parameter(Mandatory)]
        [string]$ComputerName
    )
    Write-Host "I installed software version $Version on $ComputerName. Yippee!"
}
Install-Software -Version 2 -ComputerName "SRV1"

$computers = @("SRV1", "SRV2", "SRV3")
foreach ($pc in $computers) {
    Install-Software -Version 2 -ComputerName $pc
}

# Making the Function Pipeline Com
function Install-Software {
    param(
        [Parameter(Mandatory)]
        [ValidateSet('1', '2')]
        [string]$Version,
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]$ComputerName
    )
    Write-Host "I installed software version $Version on $ComputerName. Yippee!"
}
$computers = @("SRV1", "SRV2", "SRV3")
$computers | Install-Software -Version 2

## Adding a process Block
function Install-Software {
    param(
        [Parameter(Mandatory)]
        [ValidateSet('1', '2')]
        [string]$Version,
        [Parameter(Mandatory, ValueFromPipeline)]
        [string]$ComputerName
    )

    process {
        Write-Host "I installed software version $Version on $ComputerName. Yippee!"
    }
}

$computers = @("SRV1", "SRV2", "SRV3")
$computers | Install-Software -Version 2
#endregion