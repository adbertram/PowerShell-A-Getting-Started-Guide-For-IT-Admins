## How to see all the cmdlets that exist and how to narrow then down from verb or noun
Get-Command
Get-Command -Verb Get
Get-Command -Noun Content

## Use Get-Verb to see all the verbs that can be used
Get-Verb

## How to use the help system and how to see various levels of help
Get-Help
Get-Help -Examples
Get-Help -Full
Get-Help -Details
Get-Help Get-Service