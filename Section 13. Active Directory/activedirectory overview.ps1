Get-AdComputer -Properties *
Get-AdUser -Properties *
Get-Ad*

Get-AdComputer supportapps -Properties Description
Set-AdComputer supportapps -Properties Description

Get-AdUser abertram -Properties employeeNumber
Set-AdUser abertram -Replace @{employeeNumber='changed'}
Get-AdUser abertram -Properties employeeNumber