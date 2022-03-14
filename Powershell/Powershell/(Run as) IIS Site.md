[[Credentials]]

```powershell
Clear
Import-Module WebAdministration

$credentials = (Get-Credential "bipfs\hhnycuser").GetNetworkCredential() #Not sure the last thing is for
$userName = $credentials.Domain + '\' + $credentials.UserName


    $webSites = Get-Website
    ForEach($webSite in $webSites)
    {
        $siteName = ($webSite | Select -Property "Name").name
        echo $siteName
        $fullPath = "system.applicationHost/sites/site[@name='$siteName']/application[@path='/']/virtualDirectory[@path='/']"
        Set-WebConfigurationProperty $fullPath -Name "username" -Value $userName
        Set-WebConfigurationProperty $fullPath -Name "password" -Value $credentials.Password
    }
```