#region CMD commands
# Change Current Working Directory
cd .\Windows\

# Display current directory contents
dir

# Clears the console screen
cls

# Ping an IP address
ping 1.1.1.1

#endregion

#region Aliases
# cd
Get-Alias -Name 'cd'

# dir
Get-Alias -Name 'dir'

# cls (Positional)
Get-Alias cls

#endregion

#region Using Tab
# Path
cd .\

# Command
Get-

# Parameters
Get-Content -

#endregion

#region Commands
# Command not recognized
foo

# Executable as a command
ping

# Find all PowerShell commands
Get-Command

# Group by type
Get-Command | Group-Object CommandType

# Filter by using a parameter: Verb
Get-Command -Verb Get
Get-Command Get-*

# Narrow it down futher by noun: Content
Get-Command -Verb Get -Noun Content
Get-Command *-Content

# Get a specific command
Get-Command -Name Get-Alias
#endregion

#region Help
# Finding help for commands
Get-Help Add-Content

# Common sections of help for all commands

# Examples are king!
Get-Help Add-Content -Examples

# General topics (about topics)
Get-Help about_Core_Commands

# Using wildcards (wildcards can typically be used to specify one or more characters)
Get-Help -Name About*

# Updating help
# help gets stale. Need to keep it up to date
# Sometimes works. Up to the module author

##Look! error. Needs to update system-level files
Update-Help

# Need to run as administrator. how? why?
#endregion