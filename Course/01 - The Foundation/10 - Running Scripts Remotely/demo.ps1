#region Working with scriptblocks
# Create a scriptblock
$newThing = { Write-Host "Hi! I am in a scriptblock!" }

# Investigate a scriptblock
$newThing

# Run a scriptblock
& $newThing

Invoke-Command -ScriptBlock $newThing
#endregion

#region Using Invoke-Command to execute code remotely
Invoke-Command -ScriptBlock { hostname } -ComputerName WEBSRV1

# Running Local Scripts on Remote Computers
Invoke-Command -ComputerName WEBSRV1 -FilePath C:\GetHostName.ps1

# Using Local Variables Remotely
$serverFilePath = 'C:\File.txt'

Invoke-Command -ComputerName WEBSRV1 -ScriptBlock { Write-Host "The value of foo is $serverFilePath" }

# Passing Variables with the ArgumentList Parameter
Invoke-Command -ComputerName WEBSRV1 -ScriptBlock { Write-Host "The value of foo is $($args[0])" } -ArgumentList $serverFilePath

# Using param() to Pass Variable Values
Invoke-Command -ComputerName WEBSRV1 -ScriptBlock { param($serverFilePath); Write-Host "The value of foo is $serverFilePath" } -ArgumentList $serverFilePath

# Using the $Using Statement to Pass Variable Values
Invoke-Command -ComputerName WEBSRV1 -ScriptBlock { Write-Host "The value of foo is $using:serverFilePath" }

# Linux (PowerShell 7)
$serverFilePath = '/File.txt'

Invoke-Command -HostName Linux01 -ScriptBlock -ScriptBlock { Write-Host "The value of foo is $using:serverFilePath" }

#endregion

#region Working with Sessions
# Creating a New Session
New-PSSession -ComputerName WEBSRV1

$session = Get-PSSession

$session

# Invoking Commands in a Session
Invoke-Command -Session $session -ScriptBlock { hostname }

Invoke-Command -Session $session -ScriptBlock { $foo = 'Please be here next time' }

Invoke-Command -Session $session -ScriptBlock { $foo }

# Opening Interactive Sessions
Enter-PSSession -ComputerName WEBSRV1

# Disconnecting from and Reconnecting to Sessions
$session = Get-PSSession -ComputerName websrv1

Invoke-Command -Session $session -ScriptBlock { $foo }

Get-PSSession | Disconnect-PSSession

Connect-PSSession -ComputerName websrv1

$PSVersionTable

Invoke-Command -ComputerName WEBSRV1 -ScriptBlock { $PSVersionTable }

## Removing Sessions with Remove-PSSession
Get-PSSession | Remove-PSSession

Get-PSSession

#endregion

#region Understanding PowerShell remoting Authentication
## The Double Hop Problem
Enter-PSSession -ComputerName WEBSRV1

Get-ChildItem -Path '\\dc\c$'

## Double Hopping with CredSSP
Enable-WSManCredSSP -Role Client -DelegateComputer WEBSRV1 -Force

Invoke-Command -ComputerName WEBSRV1 -ScriptBlock { Enable-WSManCredSSP -Role Server }

Invoke-Command -ComputerName WEBSRV1 -ScriptBlock { Get-ChildItem -Path '\\dc\c$' } -Authentication Credssp -Credential (Get-Credential)
#endregion