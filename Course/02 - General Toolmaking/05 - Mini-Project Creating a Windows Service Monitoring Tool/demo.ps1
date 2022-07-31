#region Building the spreadsheet
# Returning just name and state of all services
Get-Service | Select-Object Name, Status

# Adding a timestamp
Get-Service | Select-Object Name, Status, @{Name = 'TimeStamp'; Expression = { Get-Date -Format 'MM-dd-yy hh:mm:ss' } }

# Export to an excel file
$path = '.\Course\02 - General Toolmaking\05 - Mini-Project Creating a Windows Service Monitoring Tool\ServiceStatus.xlsx'
Get-Service | Select-Object Name, Status, @{Name = 'TimeStamp'; Expression = { Get-Date -Format 'MM-dd-yy hh:mm:ss' } } | Export-Excel $path -WorksheetName 'Services' -Append

#endregion

#region Analyzing the data
# Creating a pivot table
Import-Excel $path -WorksheetName 'Services' | Export-Excel $path -Show -IncludePivotTable -PivotRows Name, Timestamp -PivotData @{Timestamp = 'count' } -PivotColumns Status

#endregion