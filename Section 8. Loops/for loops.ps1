## For loops

# for (initialization; condition; repeat) {
#   code block
# }

## Textbook example
for ($i = 0; $i -le 5; $i++) {
    Write-Host $i
}


## Real-world example
$cars = @('taurus','f150','silverado')
$car_count = $cars.Count

for ($i = 0; $i -lt $car_count; $i++) {
    Write-Host $cars[$i]
}