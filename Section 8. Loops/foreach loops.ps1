## Foreach loops

## Textbook example
$array = @(1,2,3,4,5)
foreach ($item in $array) {
    Write-Host $item
}

## Real-world example
$text_files = @('file1.txt','file2.txt','file3.txt')
foreach ($file in $text_files) {
    Get-Content $file
}
