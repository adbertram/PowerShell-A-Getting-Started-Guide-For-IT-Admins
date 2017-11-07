## Manipulating Loops - Using break and continue

## Break textbook example
$array = @(1,2,3,4,5)

foreach ($item in $array) {
    Write-Host $item
    if ($item -eq 3) {
        break
    }
}

## Break real-world example
$animals = @('gerbil','dog','cat','whale','snake')
foreach ($animal in $animals) {
    if ($animals -eq 'gerbil') {
        write-host "The gerbil is in the animals set"
        break
    }
}

## Continue textbook example
$array = @(1,2,3,4,5)
for ($i = 0; $i -lt $array.count; $i++) { 
    if ($array[$i] -ne 3) {
        continue
    }
    echo $array[$i]
}

## Continue real-world example
$text_files = @('file1.txt','file2.txt','file3.txt')
foreach ($file in $text_files) {
    if ((Get-Content $file) -contains 'this is content from file 2') {
        continue
    }
    Write-Host $file
}