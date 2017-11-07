## Simple if/then example (1 condition)
$x = 1
if ($x -eq 1) {
    Write-Host 'x is equal to 1'
}

if ($x -ne 1) {
    Write-Host 'x is not equal to 1'
}


## More advanced if/then/else example (1 condition and a catch-all)
if ($x -eq 2) {
    Write-Host 'x is equal to 2'
} else {
    Write-Host 'x is equal to something else other than 2'
}

## Most advanced if/then/elseif/else example (Multiple conditions and a catch-all)
if ($x -eq 2) {
    Write-Host 'x is equal to 2'
} elseif ($x -eq 3) {
    Write-Host 'x is equal to 3'
} elseif ($x -eq 4) {
    Write-host 'x is equal to 4'
} else {
    Write-Host 'x is equal to something other than 2, 3 or 4'
}

## A shortcut to check for a non-null value
$y = $null
#$y = 'something'

if ($y) {
    Write-Host 'y is equal to something other than null or boolean false'
} else {
    Write-Host 'y has a null or boolean false value'
}