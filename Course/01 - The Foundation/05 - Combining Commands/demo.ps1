#region *-Service as an example
# Starting a Windows Service

$serviceName = 'wuauserv'

Get-Service -Name $serviceName

Start-Service -Name $serviceName
#endregion

#region Using the Pipeline
command1 | command2

# Piping Objects Between Commands
Get-Service -Name 'wuauserv' | Start-Service

# We can pipe simple data types as well
'wuauserv' | Get-Service | Start-Service

# How to know what and how to pipe
help Get-Service -Parameter Name, InputObject
help Start-Service -Parameter Name, InputObject

# Piping Arrays Between Commands
Get-Content -Path .\Services.txt

Get-Content -Path .\Services.txt | Get-Service

# Looking at Parameter Binding
'string' | Get-Process

help Get-Process -Parameter Name, InputObject

'wuauserv' | Get-Service

$serviceObject = [PSCustomObject]@{Name = 'wuauserv'; ComputerName = 'SERV1' }

$serviceObject | Get-Service
#endregion

#region Using Scripts
# Writing Scripts
C:\FolderPathToScript\Script.ps1

# Setting the Execution Policy
.\Script.ps1

Get-ExecutionPolicy

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# Scripting in PowerShell

powershell_ise.exe

C:\WriteHostExample.ps1
#endregion