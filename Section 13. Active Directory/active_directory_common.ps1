Get-ADComputer -Filter {enabled -eq $true} -Properties LastLogonDate,PasswordLastSet | ? {($_.lastLogonDate -lt [DateTime]::Now.Subtract([TimeSpan]::FromDays(60))) -or ($_.PasswordLastSet -lt [DateTime]::Now.Subtract([TimeSpan]::FromDays(60)))}


$active_directory_users = Get-AdUser -Filter {enabled -eq $true}

$employee_file = 'employee_list.csv'

$employees = Import-Csv $employee_file
$employees

foreach ($employee in $employees) {
	$ad_user_account = $active_directory_users | ? { ($_.Surname -eq $employee.LastName) -and ($_.Givenname -eq $employee.FirstName) } }
	$ad_user_account
}

Set-ADAccountPassword 'abertramtest' -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "p@ssw0rd" -Force)

Add-AdGroupMember 'Test Group' 'abertramtest'