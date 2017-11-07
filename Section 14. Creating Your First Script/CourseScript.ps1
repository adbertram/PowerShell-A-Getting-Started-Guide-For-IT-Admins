################################################################
## A "training" way to show you an overview of what we learned
################################################################

## Find all of the modules we have in C:\Windows\system32\WindowsPowershell\v1.0\Modules that have the name 'ActiveDirectory'
## If we don't find any matching that name, write some text to the console and kill the script
if ((Get-Module -ListAvailable | Where-Object {$_.Name -eq 'ActiveDirectory'}) -eq $null) {
    Write-Host 'The Active Directory module is not available.  The script will now stop.' -ForegroundColor Red
    return
}##endif

## Assign the name of our text file with PC names to a variable for reuse, if needed
$pc_list_file = 'pc_list.txt'

## Load our list of PCs into an array so we can use the list in our script
$pc_list = Get-Content $pc_list_file

## Create a blank array to hold only the PCs that appear to be online
$online_pcs = @()

## Use the pipeline and the Where-Object construct to find all lines in our text file that are not blank
## This is essentially creating a new $pc_list variable
$pc_list = $pc_list | Where-Object {$_ -ne ''}

## Look over each of the PCs in our list, ping them to ensure they're online.  If they are, add the PC name to the $online_pcs array
$pc_list | Foreach-Object { if ((Test-Connection $_ -Quiet) -eq $true) { $online_pcs += $_ }}

## Use the count method that's on all array variables to find how many online PCs are in the array
$pc_count = $online_pcs.Count

## Set the $i variable to an integer 0.  $i is typically named variable used as a counter for use in loops
$i = 0

## Create a blank hash table that we'll use to match up the PC name and the model we'll eventually be getting
$pc_models = @{}

## Start a do/while loop.  Everything in the 'do' section will repeat while our counter $i is less than the number of PCs in our $pc_count array
do {
    ## Since our counter $i will be incrementing by 1 for each loop iteration, we can use this to point to each PC in the array
    $current_pc_name = $online_pcs[$i]

    ## Use the Get-WmiObject alias gwmi to connect to the PC in the array we're currently looking at and find out what the Model property value is in the Win32_ComputerSystem class
    $wmi_model_object = gwmi -ComputerName $current_pc_name -Class "Win32_ComputerSystem" -Property 'Model'
    
    ## Use a switch construct to test two scenarios of what our variable $wmi_model_object will be
    ## If the Get-WmiObject cmdlet outputs nothing, it will "equal" the built-in variable $null.  If this is the case, something happened and we can't get the model from the computer
    ## If we did get a model name from Get-WMIObject, it will pass up the first $null scenario and match the Default scenario.  The Default scenario is a catch-all
    ## For either case, we'll add a key/value pair to the $pc_models hash table to match up the computer name with the model we get from WMI
    switch ($wmi_model_object) {
        $null { $pc_models.Add($current_pc_name,'Unable to query WMI') }
        Default { $pc_models.Add($current_pc_name,$wmi_model_object.Model) }
    }##endswitch
    
    ## Increment the $i counter variable by 1.  Recall the '++' operator increments an integer by 1.  It's the same as $i = $i + 1
    $i++
} while ($i -lt $pc_count)


## Start the foreach loop.  foreach is an alias for ForEach-Object.  This is another way of looking through all of the PCs in $online_pcs array
foreach ($pc in $online_pcs) {
    
    ## Find the value (our model) from the PC name $pc in the $pc_model hash table.  This will be the text we push to Active Directory
    $future_active_directory_description = $pc_models.$pc
    
    ## Ensure we don't write bogus information to Active Directory
    if ($future_active_directory_description -ne 'Unable to query WMI') {
        
        ## Use the Active Directory module's Get-AdComputer cmdlet to find the computer account of the PC we're currently looking at
        ## We are telling it to also give us the Active Directory description property of the AD computer account
        $current_ad_computer = Get-AdComputer -Identity $pc -Properties Description
        
        ## When you just see if ($variable) this means it's checking if $variable is anything but $false or $null.  It's a shortcut
        if ($current_ad_computer) {
            
            ## Get-AdComputer outputs an object with a multiple default properties.  We only want to see the description attribute
            $current_active_directory_description = $current_ad_computer.Description
            
            ## Shortcut again to ensure there's something in the description AD attribute
            if ($current_active_directory_description) {
                
                ## If there's already something in the description field for this computer in Active Directory, output this text to the console and make it yellow
                ## Notice we're including variables in a long string.  When we do this, we have to use double quotes.
                Write-Host "Overwriting existing description of $current_active_directory_description for AD computer account $pc to $future_active_directory_description" -ForegroundColor Yellow
            } else {
                
                ## If there's currently nothing in the AD description for this computer, tell us about it and make it green
                Write-Host "Creating new description of $current_active_directory_description for AD computer account $pc to $future_active_directory_description" -ForegroundColor Green
            }##endif
            
            ## Finally, put the computer model text we retrieved via WMI from each PC into it's corresponding Active Directory computer account's description
            Set-ADComputer -Identity $pc -Description $future_active_directory_description   
        }##endif
    }##endif
}##endforeach


###################################################
## A "real" way this script could have been written
###################################################

$verified_pcs = $pc_list | ? { ($_ -ne $null) -and (Test-Connnection $_ -Quiet) }
$verified_pcs | % { $model = (gwmi $_ -Query "SELECT * FROM Win32_ComputerSystem").Model; if ($model) { Set-ADComputer $_ -Description $model }}