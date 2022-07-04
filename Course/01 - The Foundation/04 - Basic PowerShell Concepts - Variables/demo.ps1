#region Automatic Variables
# Example
$MaximumHistoryCount

# All variables in the current session
Get-Variable

# Change the value
$MaximumHistoryCount = 200

$MaximumHistoryCount

# Set Strict Mode
Set-StrictMode -Version Latest

# $null Variable
$foo = $null

$foo

$bar

Get-Variable -Name foo

Get-Variable -Name bar

# The LASTEXITCODE Variable
ping.exe -n 1 dfdfdfdfd.com

$LASTEXITCODE

ping.exe -n 1 google.com

$LASTEXITCODE

# The Preference Variables

Get-Variable -Name *Preference

Get-Variable -Name 'doesnotexist'

$ErrorActionPreference = 'SilentlyContinue'

Get-Variable -Name 'doesnotexist'

$ErrorActionPreference = 'Continue'
#endregion

#region User-Defined Variables
# Example
$color

# If no error:
Set-StrictMode -Version Latest

# Declare/Initialize it and set a value
$color = 'blue'

$color

# Change it
$color = 'yellow'

$color

## use the variable cmdlets
Set-Variable -Name color -Value 'blue'

Get-Variable -Name color

Get-Variable

#endregion

#region Data Types
#region Boolean
# Automatic variables
$true
$false

# Setting a value
$isOn = $true
$isOn

#endregion

#region Numbers (integers and floating points)
# Integer Types
$num = 1

$num

$num.GetType().Name

$num = 1.5

$num.GetType().Name

[Int32]$num

# Floating-Point Types
$num = 0.1234567910

$num.GetType().Name

$num + $num

[Float]$num + [Float]$num
#endregion

#region Strings
# Strings
$color = blue

# Combining Strings and Variables
$sentence = "Today, you learned that PowerShell loves the color blue"

$sentence

$language = 'PowerShell'

$color = 'blue'

$sentence = "Today, you learned that $language loves the color $color"

$sentence

'Today, $name learned that $language loves the color $color'

# Using Double vs. Single Quotes
$color = "yellow"

$color 

$color = 'red'

$color

$color = ''

$color

$color = "blue"

$color

"$color"

'$color'
#endregion

#endregion


#region Objects
# Inspecting Properties
$color = 'red'

$color

Select-Object -InputObject $color -Property *

$color.Length

# Using Get-Member
Get-Member -InputObject $color

# Calling Methods
Get-Member -InputObject $color -Name Remove

$color.Remove(1, 1)

$color

$newColor = $color.Remove(1, 1)

$newColor
#endregion


#region Data structures
# Arrays
# Defining Arrays
$colorPicker = @('blue', 'white', 'yellow', 'black')

$colorPicker

# Reading Array Elements
$colorPicker[0]

$colorPicker[2]

$colorPicker[3]

$colorPicker[4]

1..3

$colorPicker[1..3]

# Modifying Elements in an Array
$colorPicker[3]

$colorPicker[3] = 'white'

$colorPicker[3]

# Adding Elements to an Array
$colorPicker = $colorPicker + 'orange'

$colorPicker

$colorPicker += 'brown'

$colorPicker

$colorPicker += @('pink', 'cyan')

$colorPicker

# ArrayLists
$colorPicker = [System.Collections.ArrayList]@('blue', 'white', 'yellow', 'black')

$colorPicker

# Adding Elements to an ArrayList

$colorPicker.Add('gray')

$null = $colorPicker.Add('gray')

# Removing Elements from an ArrayList
$colorPicker.Remove('gray')

# Hashtables
$users = @{
    abertram  = 'Adam Bertram'
    raquelcer = 'Raquel Cerillo'
    zheng21   = 'Justin Zheng'
}

$users

# Reading Elements from Hashtables
$users['abertram']

$users.abertram

$users.Keys

$users.Values

Select-Object -InputObject $yourobject -Property *

# Adding and Modifying Hashtable Items
$users.Add('natice', 'Natalie Ice')

$users['phrigo'] = 'Phil Rigo'

$users.ContainsKey('johnnyq')

$users['phrigo'] = 'Phoebe Rigo'

$users['phrigo']

$users.Remove('natice')

# Custom objects
$myFirstCustomObject = New-Object -TypeName PSCustomObject

$myFirstCustomObject = [PSCustomObject]@{OSBuild = 'x'; OSVersion = 'y' }

Get-Member -InputObject $myFirstCustomObject

$myFirstCustomObject.OSBuild

$myFirstCustomObject.OSVersion

#endregion