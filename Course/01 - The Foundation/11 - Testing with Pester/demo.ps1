#region Introducing Pester
# Introducing Pester

# Pester Basics

# A Pester File
C:\Sample.Tests.ps1
Describe
Context
It
assertions

# The describe Block
Describe 'IIS' {
}

# The context Block
Describe 'IIS' {
    Context 'Windows features' {
    }
}

# The it Block
Describe 'IIS' {
    Context 'Windows features' {
        It 'installs the Web-Server Windows feature' {
        }
    }
}

# Assertions
(Get-WindowsFeature -ComputerName WEBSRV1 -Name Web-Server).Installed
#endregion

#region Pester example
Describe 'IIS' {
    Context 'Windows features' {
        It 'installs the Web-Server Windows feature' {
            $parameters = @{}
        }
    }
}

## Executing a Pester Test
Invoke-Pester -Path '.\Course\01 - The Foundation\11 - Testing with Pester\sample.tests.ps1'
#endregion