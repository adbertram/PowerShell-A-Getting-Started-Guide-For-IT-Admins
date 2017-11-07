## WMI Namespaces/Classes/Properties

## Find all namespaces
gwmi -Namespace root -Class __Namespace | select name

## Find all classes in root\cimv2
Get-WmiObject -List

## Real-world example
gwmi -List | ? {($_.Name -like 'Win32_*') -and ($_.Name -like '*Disk*')} | Sort-Object Name
