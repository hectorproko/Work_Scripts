```powershell
$credentials = (Get-Credential "bipfs\hhperfuser").GetNetworkCredential() #Not sure the last thing is for
$userName = $credentials.Domain + '\' + $credentials.UserName


    Invoke-Command -ComputerName pfx-perf-ws01 -ScriptBlock {
        Get-Culture
        Import-Module WebAdministration

        <# update all the web applications to run under the context of the specified user
        $apps = Get-WebApplication
        ForEach($app in $apps)
        {
            $xpath = ($app | Select -Property "ItemXPath").ItemXPath
            $fullPath = "$xpath/virtualDirectory[@path='/']" 
            $fullPath = $fullPath.Substring(1)
            Set-WebConfigurationProperty $fullPath -Name "username" -Value $username
            Set-WebConfigurationProperty $fullPath -Name "password" -Value $credentials.Password
        }
        #>

        # update all the appPools to run under the context of the specified user
        $appPools = Get-IISAppPool 
        foreach ($pool in $appPools){
            $appPool = $pool.Name
            $appPool
            Set-ItemProperty "IIS:\AppPools\$appPool" -Name processModel.identityType -Value SpecificUser
            Set-ItemProperty "IIS:\AppPools\$appPool" -Name processModel.userName -Value $userName
            Set-ItemProperty "IIS:\AppPools\$appPool" -Name processModel.password -Value $credentials.Password
        }
        #>
    }
```