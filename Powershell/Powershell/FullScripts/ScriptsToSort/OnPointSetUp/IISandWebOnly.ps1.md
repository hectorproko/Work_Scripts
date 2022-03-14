``` powershell
hostname
Import-Module WebAdministration

#WebApp Objects that go inside Site objects 
$WebAppWsOnpointApi = @{Name='OnPointAPI' ;Pool="ws-OnPointApi-PROD";PhyPath="\\hhcode\code\Production\Sites\Api\OnPointAPI"}
$WebAppSFTPService = @{Name='SFTPService' ;Pool="ws-SFTP-PROD";PhyPath="\\hhcode\code\Production\Sites\Api\SFTPService"}
#Site Objects 
$Onpoint = @{SiteName=’OnPoint’;port=’8049’;Pool=’OnPointApi’;PhyPath="\\hhcode\code\OnPoint\Production"}
$WsOnpointApi = @{SiteName=’ws-OnPointApi’;port=’8050’;Pool="ws-OnPointApi-PROD";PhyPath="\\hhcode\code\Production\Sites\Api\";WebApp=$WebAppWsOnpointApi}
$sftpService = @{SiteName=’SFTPservice’;port=’8051’;Pool="ws-SFTP-PROD";PhyPath="\\hhcode\code\Production\Sites\Api\";WebApp=$WebAppSFTPService}
#####

#Putting custom objects inside of sites
$sites = ($Onpoint, $WsOnpointApi, $sftpService)
foreach ($f in $sites){
    #Gettign info from object to vars
    $site=$f.SiteName
    $port=$f.port
    $pool=$f.Pool
    $physicalPath=$f.PhyPath

    #Creating site
    New-IISSite -Name "$site" -PhysicalPath $physicalPath -BindingInformation $ip":"$port":"
    Set-ItemProperty iis:\Sites\$site -Name applicationpool -Value $pool  #This AppPool might not exits
    Set-ItemProperty iis:\Sites\$site -Name applicationDefaults.preloadEnabled -Value True


    #Set site to run as user
    $siteName=$f.SiteName
    echo $siteName
    $fullPath = "system.applicationHost/sites/site[@name='$siteName']/application[@path='/']/virtualDirectory[@path='/']"
    Set-WebConfigurationProperty $fullPath -Name "username" -Value "bipfs\hhproduser"
    Set-WebConfigurationProperty $fullPath -Name "password" -Value '$6oP#t1B4&jYmrh8QLywgCb5cO%^xG'
}



#Iterating site objects to get info from webApp objects
$sites = ($WsOnpointApi, $sftpService)
foreach ($f in $sites){
    #Gettign info from object to vars
    $siteName=$f.SiteName
    $WebAppName=$f.WebApp.Name
    $pool=$f.WebApp.Pool
    $Phypath=$f.WebApp.PhyPath
    
    #Conversting folder to WebApp
    New-WebApplication -Name $WebAppName -Site $siteName -PhysicalPath $Phypath -Force -Verbose

    #Adding Pool to WebApp
    Set-ItemProperty "IIS:\Sites\$siteName\$WebAppName" -Name applicationPool -Value $pool

}


```