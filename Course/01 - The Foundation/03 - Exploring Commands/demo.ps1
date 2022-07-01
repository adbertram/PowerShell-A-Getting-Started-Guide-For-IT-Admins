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