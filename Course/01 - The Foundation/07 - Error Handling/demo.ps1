#region ErrorView
# PowerShell 5.1 style
$ErrorView = 'NormalView'

Get-Service foo

# Default PowerShell 7 style
$ErrorView = 'ConciseView'

Get-Service foo

# Category view
$ErrorView = 'CategoryView'

Get-Service foo

# Detailed view
$ErrorView = 'DetailedView'

Get-Service foo

#endregion

#region Terminating vs Nonterminating
# Working with Exceptions and Errors
Get-Service bits, foo, lanmanserver

# Handling Nonterminating Errors
$folderPath = '.\bogusFolder'
$files = Get-ChildItem -Path $folderPath
Write-Host "This shouldn't run."
$files.foreach({
        $fileText = Get-Content $files
        $fileText[0]
    })

# Making the error terminating
$folderPath = '.\bogusFolder'
$files = Get-ChildItem -Path $folderPath -ErrorAction Stop
Write-Host "This shouldn't run."
$files.foreach({
        $fileText = Get-Content $files
        $fileText[0]
    })

#endregion

#region Try/Catch/Finally
# Syntax
try {
    # initial code
} catch {
    # code that runs if terminating error found
} finally {
    # code that runs at the end
}

# Example
$folderPath = '.\bogusFolder'
try {
    $files = Get-ChildItem -Path $folderPath -ErrorAction Stop
    $files.foreach({
            $fileText = Get-Content $files
            $fileText[0]
        })
} catch {
    $_.Exception.Message
}

# Non terminating error
$filePath = '.\bogusFile.txt'
try {
    Get-Content $filePath
} catch {
    Write-Host "We found an error"
}
#endregion

#region $Error Automatic Variable
Get-Item -Path C:\NotFound.txt

# Array
$Error

# Most Recent
$Error[0]
#endregion