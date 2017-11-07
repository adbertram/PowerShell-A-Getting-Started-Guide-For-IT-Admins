## Getting information from WMI

## Find all properties and values in the Win32_ComputerSystem class
gwmi -Class Win32_ComputerSystem

## Find only the model
gwmi -Query 'SELECT Model FROM Win32_ComputerSystem'

## Find free disk space for all hard drive partitions
gwmi -Class win32_logicaldisk | % {"Drive $($_.DeviceID) has $($_.Freespace/1GB) GB free"}
gwmi -Class win32_logicaldisk | % {"Drive $($_.DeviceID) has " + “{0:N0}” -f ($_.Freespace/1GB) + ' GB free'}

