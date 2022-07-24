#region Reading CSV
$csvPath = '.\Course\02 - General Toolmaking\02 - Parsing Structured Data - CSV files\Example.csv'
# Reading the file
Get-Content -Path $csvPath -Raw

# Examine Output
Get-Content -Path $csvPath -Raw | Get-Member

# Import as an object
Import-Csv -Path $csvPath

# Examine output
Import-Csv -Path $csvPath | Get-Member

#endregion

#region CSV as objects
# Object things
$firstCsvRow = Import-Csv -Path $csvPath | Select-Object -First 1
$firstCsvRow
$firstCsvRow | Select-Object -ExpandProperty 'First Name'
$firstCsvRow.'First Name'

# Filtering with Where-Object
Import-Csv -Path $csvPath | Where-Object { $_.'Last Name' -eq 'Howell' }
Import-Csv -Path $csvPath | Where-Object { $_.Department -eq 'Executive Office' }

# Structured snafu
# Add random commas
Import-Csv $csvPath

# Delimiters
(Get-Content -Path $csvPath -Raw) -replace ',', "`t" | Set-Content $csvPath
Get-Content -Path $csvPath -Raw

# Reading the tab delimited data
Import-Csv -Path $csvPath -Delimiter "`t"

# Changing the header
Import-Csv -Path $csvPath -Delimiter "`t" -Header 'FName', 'LName', 'Dept', 'Manager'

#endregion

#region Making CSV files
# Processes
Get-Process | Select-Object -Property Name, Company, Description

# Export
Get-Process | Select-Object -Property Name, Company, Description | Export-Csv -Path .\Processes.csv -NoTypeInformation

# Read
Get-Content .\Processes.csv

# Type information (Windows PowerShell)
Get-Process | Select-Object -Property Name, Company, Description | Export-Csv -Path .\Processes.csv
#endregion