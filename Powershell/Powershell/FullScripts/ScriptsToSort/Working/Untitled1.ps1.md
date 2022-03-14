``` powershell
Import-Module WebAdministration

#Passphrase: Payflex1234!
#bipfs\hhperfuser

Get-IISSite

$appPools = Get-ChildItem IIS:\Sites\2ws-healthhubperf.payflex.com | Select-Object -ExpandProperty Name 
$appPools = Get-Content  "\\celerrafs02.payflex.com\data\SHARED\RM Team\Hector\Assignentment5\appPools.txt"

foreach ($f in $appPools){

    echo "Hello $f"
    #Delete AppPool
    Remove-WebAppPool -Name $f

}

Remove-IISSite -Name "2ws-healthhubperf.payflex.com"

function Set-IIS-ConnectAsUser($username, $password)
{
    $dir = Get-Location

    cd IIS:\Sites

    # update all the web sites to run under the context of the specified user
    $webSites = Get-Website
    ForEach($webSite in $webSites)
    {
        $siteName = ($webSite | Select -Property "Name").name
        $fullPath = "system.applicationHost/sites/site[@name='$siteName']/application[@path='/']/virtualDirectory[@path='/']"
        Set-WebConfigurationProperty $fullPath -Name "username" -Value $username
        Set-WebConfigurationProperty $fullPath -Name "password" -Value $password
    }

    # update all the web applications to run under the context of the specified user
    $apps = Get-WebApplication
    ForEach($app in $apps)
    {
        $xpath = ($app | Select -Property "ItemXPath").ItemXPath
        $fullPath = "$xpath/virtualDirectory[@path='/']" 
        $fullPath = $fullPath.Substring(1)
        Set-WebConfigurationProperty $fullPath -Name "username" -Value $userName
        Set-WebConfigurationProperty $fullPath -Name "password" -Value $credentials.Password
    }

    # update all the virtual directories to run under the context of the specified user
    $virtualDirs = Get-WebVirtualDirectory
    ForEach($vdir in $virtualDirs)
    {
        $xpath = ($vdir | Select -Property "ItemXPath").ItemXPath
        $fullPath = $xpath.Substring(1)
        Set-WebConfigurationProperty $fullPath -Name "username" -Value $username
        Set-WebConfigurationProperty $fullPath -Name "password" -Value $password
    }


    cd $dir
}
```