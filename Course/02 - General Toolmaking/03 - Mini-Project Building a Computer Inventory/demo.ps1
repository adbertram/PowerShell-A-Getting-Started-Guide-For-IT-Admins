#region Intro
$rows = Import-Csv -Path '.\Course\02 - General Toolmaking\03 - Mini-Project Building a Computer Inventory\IPAddresses.csv'
foreach ($row in $rows) {
    Test-Connection -ComputerName $row.IPAddress -Count 1 -Quiet
}

foreach ($row in $rows) {
    (Resolve-DnsName -Name $row.IPAddress -ErrorAction Stop).Name
}
#endregion