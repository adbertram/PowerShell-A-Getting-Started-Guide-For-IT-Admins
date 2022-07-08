#region Module discovery
# Exploring Default Modules

# Finding Modules in Your Session.
Get-Module

# Getting commands from a module
Get-Command -Module Microsoft.PowerShell.Management

# Finding Modules on Your Computer
Get-Module -ListAvailable

# Where they are located
$env:PSModulePath

# Adding your own module path
$env:PSModulePath + ';C:\MyNewModulePath'
#endregion

#region Importing modules
# What is currently imported
Get-Module

# Importing a common module
Import-Module -Name Microsoft.PowerShell.Management -Verbose

# Forcing an import
Import-Module -Name Microsoft.PowerShell.Management -Force

# Removing the module
Remove-Module -Name Microsoft.PowerShell.Management -Force

# Confirming it is gone
Get-Module -Name Microsoft.PowerShell.Management
#endregion

#region The Components of a PowerShell Module
# The .psm1 File

# The Module Manifest
New-ModuleManifest -Path '.\Course\01 - The Foundation\09 - Exploring Modules\Software.psd1'

# Importing your module
Import-Module '.\Course\01 - The Foundation\09 - Exploring Modules\Software.psm1'

# Finding commands
Get-Command -Module Software

#endregion

#region Finding and installing new modules
# Module to use
Get-Command -Module PowerShellGet

# Finding a module
Find-Module -Name *VMware*

# Installing Modules
Find-Module -Name VMware.PowerCLI | Install-Module

Get-Module -Name VMware.PowerCLI -ListAvailable | Select-Object -Property ModuleBase

# Uninstalling Modules
Uninstall-Module -Name VMware.PowerCLI

#endregion