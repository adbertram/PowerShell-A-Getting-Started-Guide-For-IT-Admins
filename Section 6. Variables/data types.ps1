## Boolean
[bool]$boolean_true = $true
$boolean_false = $false
    
$boolean_true -eq $true
$boolean_false -eq $true

## Strings
[string]$single_quote_string = 'this is a string'
$double_quote_string = "this is a string - $x"
Write-Host $single_quote_string
Write-Host $double_quote_string

## Integers
[int]$integer_one = 1
$integer_two = 2
$integer_one + $integer_two

## Arrays
[array]$array = @(1,'string_variable',5)
$array
$array += 'add this to the end'
$array

## Hash tables
[hashtable]$hash_table = @{'key1' = 'value1'; 'key2' = 'value2'}
$hash_table

$hash_table.Get_Item('key1')
$hash_Table.key1

$hash_table.Add('added',"this is the added variable")

$hash_Table.Set_Item("key1", "modified_value1")
$hash_table.Remove('key1')