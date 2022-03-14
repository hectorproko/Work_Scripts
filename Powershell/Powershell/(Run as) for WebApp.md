```powershell
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

[[Credentials]]