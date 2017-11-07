Get-Service | Get-Member
$service = Get-Service wuauserv

$service.Status
$service.Stop()

## Show how it stops the service but $service still shows running
$service

## Get current status now of the service stopped
$service = Get-Service wuauserv
$service.Status


## Comparing objects
$array1 = @(1,2,3,4,5)
$array2 = @(1,6,3,8,9)
Compare-Object $array1 $array2


## Creating custom objects

$properties = @{Hair='Brown';Eyes='Blue';Weight=130;Sex='Female'}
$person = New-Object -TypeName PSObject -Property $properties;
$person

$annie = New-Object System.Object
$annie | Add-Member -type NoteProperty -name Hair -value 'Brown'
$annie | Add-Member -type NoteProperty -name Eyes -value 'Blue'
$annie | Add-Member -type NoteProperty -name Weight -value 130
$annie | Add-Member -type NoteProperty -name Sex -value 'Female'

$joe = New-Object System.Object
$joe | Add-Member -type NoteProperty -name Hair -value 'Black'
$joe | Add-Member -type NoteProperty -name Eyes -value 'Brown'
$joe | Add-Member -type NoteProperty -name Weight -value 220
$jpe | Add-Member -type NoteProperty -name Sex -value 'Male'

$people = @($annie,$joe)

$people | Sort-Object Weight | Select-Object Hair,Eyes
$people | Select-Object Hair,Eyes
