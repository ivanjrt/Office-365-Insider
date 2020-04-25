<#
.SYNOPSIS
It changes the current channel Managment to 'Office Insider'

.LINK
https://insider.office.com/en-us/

.REQUIEREMENTS 
Have installed Office 365 Subscription License
Run this script as Administrator
This is script is met for easier silent installs

.DISCLAIMER
Feel free to Modify the below though, I don't offer any sort of warranty
As best practice I would advise you to test it on 1 or 2 objects first

.Author
ivanjrt @ gmail.com
#>

The below script must be run as Admin.
Clear-Host
$key = 'updatebranch'
$value = 'InsiderFast'
$registryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Office\16.0\common\officeupdate\'
$executableUpdatePath = "C:\Program Files\Common Files\Microsoft Shared\ClickToRun\OfficeC2RClient.exe"
$executableUpdateArgs = '/update user displaylevel=true'

Try{
    New-Item -Path $registryPath -Force
    New-ItemProperty -Path $registryPath -Name $key -PropertyType String -Value $value
    Start-Process $executableUpdatePath $executableUpdateArgs
}catch{
    if (!(Test-Path -Path c:\Temp)){md C:\Temp}
    Write-Error "Something went Wrong... Please check logs in c:\temp " 
    $_.Exception | Out-Null C:\Temp\insiderScript.log
}