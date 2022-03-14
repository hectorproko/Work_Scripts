``` powershell
#Pending
#conect as, and bindings with certifacte
#Passphrase: Payflex1234!
#bipfs\hhperfuser
Import-Module WebAdministration

$user="hector"
$credentials = (Get-Credential "bipfs\$hector").GetNetworkCredential() #Not sure the last thing is for
$userName = $credentials.Domain + '\' + $credentials.UserName
$ip = "10.46.208.134"
$port = "8445"
#$physicalPath = "\\hhcode\code\Performance\HealthHub\ws.healthhub.com"
#$site = "ws-healthhubperf.payflex.com"
$physicalPath = "\\hhcode\code\Performance\HealthHub\ws.payflex.com"
$site = "ws-perf.payflex.com"

New-IISSite -Name "$site" -PhysicalPath $physicalPath -BindingInformation $ip":"$port":"
Set-ItemProperty iis:\Sites\$site -Name applicationpool -Value $site  #This AppPool might not exits
Set-ItemProperty iis:\Sites\$site -Name applicationDefaults.preloadEnabled -Value True

<#Note working
Set-ItemProperty "iis:\Sites\$site" -Name applicationDefaults.identityType -Value SpecificUser
Set-ItemProperty "iis:\Sites\$site" -Name applicationDefaults.processModel.userName -Value $userName
Set-ItemProperty "iis:\Sites\$site" -Name applicationDefaults.processModel.password -Value $credentials.Password
#>


#Getting list of names for AppPool
$appPools = Get-ChildItem IIS:\Sites\$site | Select-Object -ExpandProperty Name 
$appPools = Get-Content  "\\celerrafs02.payflex.com\data\SHARED\RM Team\Hector\Assignentment5\appPools.txt"

#Creating and configuring appPool
foreach ($f in $appPools){

    echo "Hello $f"

    #Creating AppPool
    New-WebAppPool -Name $f

    #Setting propperties of AppPools
    Set-ItemProperty "IIS:\AppPools\$f" -Name startMode -Value AlwaysRunning
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.loadUserProfile -Value True
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.idleTimeoutAction -Value Suspend
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.idleTimeout -Value ([TimeSpan]::FromMinutes(720))
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.identityType -Value SpecificUser
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.userName -Value $userName
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.password -Value $credentials.Password
}

#Converting Direcotry to app
foreach ($f in $appPools){

    echo "Hello $f"
    ConvertTo-WebApplication "IIS:\Sites\$site\$f" #Converting directory to app
}

#Setting up appPool for webApp
foreach ($f in $appPools){
    echo "Hello $f"
    Set-ItemProperty "IIS:\Sites\$site\$f" -Name applicationPool -Value $f #Referencing an appPool from newly Converted
}


   
# update all the web applications to run under the context of the specified user
$apps = Get-WebApplication
ForEach($app in $apps)
{
    $xpath = ($app | Select -Property "ItemXPath").ItemXPath
    $fullPath = "$xpath/virtualDirectory[@path='/']" 
    $fullPath = $fullPath.Substring(1)
    Set-WebConfigurationProperty $fullPath -Name "username" -Value $username
    Set-WebConfigurationProperty $fullPath -Name "password" -Value $credentials.Password
}
```