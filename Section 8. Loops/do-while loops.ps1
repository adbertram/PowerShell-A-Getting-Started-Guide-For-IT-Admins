## Do/While loops

## Textbook example
$x = 0
do {
    Write-Host $x
    $x += 1
} while ($x -le 5)

## Real-world example

Notepad

do {

} While (get-process notepad -ErrorAction SilentlyContinue)

$strTime = get-date

Write-Host “The Application Notepad was closed on: $strTime”

## Real-world example from http://www.powershellpro.com/powershell-tutorial-introduction/logic-using-loops/