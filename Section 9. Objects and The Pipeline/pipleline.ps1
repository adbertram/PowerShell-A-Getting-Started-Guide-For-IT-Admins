Get-Cats | Pet-Cat
Get-Cats | Where-Object {$_.Color -eq 'Brown'} | Sort-Object Color

Get-ChildItem C:\Windows | Where-Object {$_.Length -gt 200KB} | Sort-Object Length

Get-Service | Sort-Object Status | Format-Table