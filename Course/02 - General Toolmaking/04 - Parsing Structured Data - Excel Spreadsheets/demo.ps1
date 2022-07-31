#region Prep
# Install the module
Install-Module ImportExcel

#endregion

#region Creating Spreadsheets
$path = '.\Course\02 - General Toolmaking\04 - Parsing Structured Data - Excel Spreadsheets\processes.xlsx'
# Simple spreadsheet
Get-Process | Export-Excel $path

# Adding worksheets
Get-Process | Export-Excel $path -WorksheetName Worksheet2
Get-Process | Export-Excel $path -WorksheetName Worksheet3

#endregion

#region Reading spreadsheets
# Read the previously created spreadsheet
Import-Excel $path

# Getting sheet info
Get-ExcelSheetInfo $path

# Getting all sheets
$excelSheets = Get-ExcelSheetInfo $path
foreach ($sheet in $excelSheets) {
    $workSheetName = $sheet.Name
    $sheetRows = Import-Excel $path -WorksheetName $workSheetName
    $sheetRows | Select-Object -Property *, @{Name = 'Worksheet'; Expression = { $workSheetName } }
}

#endregion

#region Adding data to spreadsheets
# Process over time
Get-Process | Select-Object -Property *, @{Name = 'Timestamp'; Expression = { Get-Date -Format 'MM-dd-yy hh:mm:ss' } } | Export-Excel $path -WorksheetName 'ProcessesOverTime'

#endregion