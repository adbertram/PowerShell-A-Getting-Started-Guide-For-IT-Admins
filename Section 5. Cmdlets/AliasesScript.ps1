##  Show default alias examples
Get-WmiObject -Class Win32_ComputerSystem -Property Model
gwmi -Class Win32_ComputerSystem -Property Model

Get-ChildItem C:\Windows
ls C:\Windows
dir C:\Windows


## Show how to see all aliases in the current session
Get-Alias

## Show how to set user-defined aliases
Set-Alias j Get-ChildItem

## Show how to export your alias to share
Export-Alias -Path my_aliases.txt -Name j
notepad my_aliases.txt