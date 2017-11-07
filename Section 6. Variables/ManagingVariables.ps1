## Most comment method to create a variable
$MyVariable
$MyVariable = 'SomeValue'
$MyVariable

## Explicitly setting the data type
[string]$MyVariable = SomeValue

## Other methods
New-Item Variable:\MyVariable -value 'SomeValue'
New-Variable:\MyVariable -value 'SomeValue'

## Removing a variable
$MyVariable
Remove-Item Variable:\MyVariable
$MyVariable
$MyVariable = $null