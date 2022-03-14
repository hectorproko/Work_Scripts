```powershell

Clear
Import-Module WebAdministration
$RM_Team = "\\celerrafs02.payflex.com\data\SHARED\RM Team\"
$Hector = "Hector\"
$perfServ = "PerformanceServers.txt"
$path = "$RM_Team$Hector$perfServ"

$credentials = (Get-Credential "bipfs\hhperfuser").GetNetworkCredential() #Not sure the last thing is for
$userName = $credentials.Domain + '\' + $credentials.UserName

$serverList= Get-Content -Path "$path"
ForEach ($server in $serverList)
{
    echo $server
    $s = New-PSSession -ComputerName $server
    Invoke-Command -Session $s -ScriptBlock {
        Get-Culture

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

        # update all the appPools to run under the context of the specified user
        $appPools = Get-IISAppPool 
        foreach ($pool in $appPools){
            $appPool = $pool.Name
            $appPool
            Set-ItemProperty "IIS:\AppPools\$appPool" -Name processModel.identityType -Value SpecificUser
            Set-ItemProperty "IIS:\AppPools\$appPool" -Name processModel.userName -Value $userName
            Set-ItemProperty "IIS:\AppPools\$appPool" -Name processModel.password -Value $credentials.Password
        }
    }
}
```

#Script