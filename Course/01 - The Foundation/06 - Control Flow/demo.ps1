#region Example Script and intro
# Understanding Control Flow
Get-Content -Path "\\servername\c$\App_configuration.txt"

$servers = @('SRV1', 'SRV2', 'SRV3', 'SRV4', 'SRV5')
Get-Content -Path "\\$($servers[0])\c$\App_configuration.txt"
Get-Content -Path "\\$($servers[1])\c$\App_configuration.txt"
Get-Content -Path "\\$($servers[2])\c$\App_configuration.txt"
Get-Content -Path "\\$($servers[3])\c$\App_configuration.txt"
Get-Content -Path "\\$($servers[4])\c$\App_configuration.txt"

# Building Expressions by Using Operators
1 -eq 1

Test-Connection -ComputerName SRV2 -Quiet -Count 1

Test-Connection -ComputerName SRV1 -Quiet -Count 1

-not (Test-Connection -ComputerName offlineserver -Quiet -Count 1)
#endregion

#region If-Else
if (condition) {
    # code to run if the condition evaluates to be True
}

$servers = @('SRV1', 'SRV2', 'SRV3', 'SRV4', 'SRV5')
if (Test-Connection -ComputerName $servers[0] -Quiet -Count 1) {
    Get-Content -Path "\\$($servers[0])\c$\App_configuration.txt"
}
Get-Content -Path "\\$($servers[1])\c$\App_configuration.txt"


# The else Statement
if (Test-Connection -ComputerName $servers[0] -Quiet -Count 1) {
    Get-Content -Path "\\$($servers[0])\c$\App_configuration.txt"
} else {
    Write-Error -Message "The server $($servers[0]) is not responding!"
}

## The elseif Statement

if (Test-Connection -ComputerName $servers[0] -Quiet -Count 1) {
    if ($servers[0] –eq $problemServer) {
        Write-Error -Message "The server $servers[0] does not have the right file!"
    } else {
        Get-Content -Path "\\$servers[0]\c$\App_configuration.txt"
    }
} else {
    Write-Error -Message "The server $servers[0] is not responding!"
}


if (-not (Test-Connection -ComputerName $servers[0] -Quiet -Count 1)) {
    u
    Write-Error -Message "The server $servers[0] is not responding!"
} elseif ($servers[0] –eq $problemServer) {
    v
    Write-Error -Message "The server $servers[0] does not have the right file!"
} else {
    Get-Content -Path "\\$servers[0]\c$\App_configuration.txt" w
}
#endregion

#region The switch Statement
# Syntax
switch (expression) {
    expressionvalue {
        # Do something with code here.
    }
    expressionvalue {
    }
    default {
        # Stuff to do if no matches were found
    }
}


switch (expression) {
    expressionvalue {
        # Do something with code here.
        break
    }
}

$currentServer = $servers[0]
switch ($currentServer) {
    $servers[0] {
        # Check if server is online and get content at SRV1 path.
        break
    }
    $servers[1] {
        ## Check if server is online and get content at SRV2 path.
        break
    }
    $servers[2] {


    }
}
#endregion

#region Introducing Loops

$servers = @('SRV1', 'SRV2', 'SRV3', 'SRV4', 'SRV5')
Get-Content -Path "\\$($servers[0])\c$\App_configuration.txt"
Get-Content -Path "\\$($servers[1])\c$\App_configuration.txt"
Get-Content -Path "\\$($servers[2])\c$\App_configuration.txt"
Get-Content -Path "\\$($servers[3])\c$\App_configuration.txt"
Get-Content -Path "\\$($servers[4])\c$\App_configuration.txt"
#endregion

#region The for and foreach loops
foreach ($server in $servers) {
    Get-Content -Path "\\$server\c$\App_configuration.txt"
}

# Variable explanation
$servers = @('SRV1', 'SRV2', 'SRV3', 'SRV4', 'SRV5')
foreach ($server in $servers) {
    $server = "new $server"
}
$servers
#endregion

#region The ForEach-Object cmdlet
$servers = @('SRV1', 'SRV2', 'SRV3', 'SRV4', 'SRV5')
ForEach-Object -InputObject $servers -Process {
    Get-Content -Path "\\$_\c$\App_configuration.txt"
}

# Using the pipe
$servers = @('SRV1', 'SRV2', 'SRV3', 'SRV4', 'SRV5')
$servers | ForEach-Object {
    Get-Content -Path "\\$_\c$\App_configuration.txt"
}

# The foreach() Method
$servers.foreach({ Get-Content -Path "\\$_\c$\App_configuration.txt" })

# The for Loop
for ($i = 0; $i -lt 10; $i++) {
    $i
}

# Variable explanation
$servers = @('SERVER1', 'SERVER2', 'SERVER3', 'SERVER4', 'SERVER5')
for ($i = 0; $i -lt $servers.Length; $i++) {
    $servers[$i] = "new $($servers[$i])"
}
$servers

# Relative referencing
for ($i = 1; $i -lt $servers.Length; $i++) {
    Write-Host $servers[$i] "comes after" $servers[$i - 1]
}
#endregion

#region The while Loop
# Syntax
$counter = 0
while ($counter -lt 10) {
    $counter
    $counter++
}

# Example
while (Test-Connection -ComputerName $problemServer -Quiet -Count 1) {
    Get-Content -Path "\\$problemServer\c$\App_configuration.txt"
    break
}

# The do/while and do/until Loop
# Syntax
do {
} while ($true)

# Example
do {
    $choice = Read-Host -Prompt 'What is the best programming language?'
} until ($choice -eq 'PowerShell')
Write-Host -Object 'Correct!'
#endregion