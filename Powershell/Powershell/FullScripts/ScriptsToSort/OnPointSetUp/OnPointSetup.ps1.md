``` powershell
Import-Module WebAdministration

$user="hhmiamiuser"
$credentials = (Get-Credential "bipfs\$user").GetNetworkCredential() 
$userName = $credentials.Domain + '\' + $credentials.UserName
#Wk*yka&N5p@f-E-t
$env="Miami"
#Step 6 Pools
#OnpointApi
#Ws-Sftp- need to enable 32 bit from advance settings for sftp-service only
#Ws-onpointapi

#Done In All Prods
#1. Features/Roles
$buffalo=Get-WindowsFeature -computerName pfx-buff-web01 | ? { $_.Installed } | Select Name #| ForEach-Object { Install-WindowsFeature $($_.Name) }
$current=Get-WindowsFeature | ? { $_.Installed } | Select Name #| ForEach-Object { Install-WindowsFeature $($_.Name) }

Compare-Object $buffalo $current 

#uat
Install-WindowsFeature -Name File-Services            
Install-WindowsFeature -Name FS-FileServer            
Install-WindowsFeature -Name FS-BranchCache           
Install-WindowsFeature -Name FS-DFS-Namespace         
Install-WindowsFeature -Name Web-WebSockets           
Install-WindowsFeature -Name Web-Scripting-Tools      
Install-WindowsFeature -Name NET-WCF-HTTP-Activation45
Install-WindowsFeature -Name NET-WCF-MSMQ-Activation45
Install-WindowsFeature -Name NET-WCF-Pipe-Activation45
Install-WindowsFeature -Name NET-WCF-TCP-Activation45 
Install-WindowsFeature -Name MSMQ                     
Install-WindowsFeature -Name MSMQ-Services            
Install-WindowsFeature -Name MSMQ-Server              
Install-WindowsFeature -Name RSAT                     
Install-WindowsFeature -Name RSAT-Role-Tools          
Install-WindowsFeature -Name RSAT-File-Services       
Install-WindowsFeature -Name RSAT-DFS-Mgmt-Con        
Install-WindowsFeature -Name FS-SMB1                  
Install-WindowsFeature -Name FS-SMB1-CLIENT           
Install-WindowsFeature -Name FS-SMB1-SERVER           
Install-WindowsFeature -Name WAS                      
Install-WindowsFeature -Name WAS-Process-Model        
Install-WindowsFeature -Name WAS-Config-APIs

#2 The Log folders, all prod servers
New-Item -ItemType Directory -Path  L:\Log\OnPOINT
New-Item -ItemType Directory -Path  L:\Log\OnPOINTAPI
New-Item -ItemType Directory -Path  L:\Log\SFTPService


#3 Actual Step 3, all prod servers
Add-WebConfiguration -PSPath "IIS:\" -Filter /system.webServer/isapiFilters -Value @{
name = 'F5 X-Forwarded-For';
path = 'C:\Program Files\F5XForwardedFor2008\x64\Release\F5XForwardedFor.dll'
}




#4 Give full control, all prod servers
$serviceUser="bipfs\$user"
$folder="C:\Windows\Microsoft.NET\Framework64\v4.0.30319"
$Acl = Get-Acl $folder
$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule($serviceUser, "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$Acl.SetAccessRule($Ar)
Set-Acl $folder $Acl



#PENDING#####
#5 Certificate
$folder="\\celerrafs02.payflex.com\data\SHARED\RM Team\Hector\MiamiCerts"
$mypwd = Get-Credential -UserName $env:USERNAME -Message 'Payflex1234!'
#Adds all .cert Not Needed her
#Adds all .pfx
$files = Get-ChildItem $folder -Filter *.pfx
foreach ($f in $files){
    Import-PfxCertificate -FilePath $f.FullName -CertStoreLocation Cert:\LocalMachine\My -Exportable -Password $mypwd.Password
}
#To run as user
#Do it using the other two seperate scripts




#6 pools, all prod servers
$appPools = ("OnpointApi-$env", "Ws-Sftp-$env", "Ws-onpointapi-$env")
foreach ($f in $appPools){

    echo "Creaing Pool $f"

    #Creating AppPool
    New-WebAppPool -Name $f

    #Setting propperties of AppPools
    Set-ItemProperty "IIS:\AppPools\$f" -Name startMode -Value AlwaysRunning
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.loadUserProfile -Value True
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.idleTimeoutAction -Value Suspend
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.idleTimeout -Value ([TimeSpan]::FromMinutes(720))
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.identityType -Value SpecificUser
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.userName -Value $userName #can be hardcoded
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.password -Value $credentials.Password #can be hardcoded
}
    #Fixing Ws-Sftp for 32bits
    Set-ItemProperty "IIS:\AppPools\Ws-Sftp-$env" -Name enable32BitAppOnWin64 -Value True

#7)Sites: use numerically highest IP
#Port:
#Onpoint: 8049
#Ws-OnpointApi:8050
#sftpService: 8051nPointAPI


#Missing IP##
############################## pick one
#WebApp Objects that go inside Site objects 
$WebAppWsOnpointApi = @{Name='OnPointAPI' ;Pool="ws-OnPointApi-$env";PhyPath="\\hhcode\code\NonProd\$env\Sites\api\O"}
$WebAppSFTPService = @{Name='SFTPService' ;Pool="ws-SFTP-$env";PhyPath="\\hhcode\code\NonProd\$env\Sites\api\SFTPService"}
#Site Objects 
$Onpoint = @{SiteName=’OnPoint’;port=’8049’;Pool=’OnPointApi’;PhyPath="\\hhcode\code\OnPoint\$env"}
$WsOnpointApi = @{SiteName=’ws-OnPointApi’;port=’8050’;Pool="ws-OnPointApi-$env";PhyPath="\\hhcode\code\NonProd\$env\Sites\api\";WebApp=$WebAppWsOnpointApi}
$sftpService = @{SiteName=’SFTPservice’;port=’8051’;Pool="ws-SFTP-$env";PhyPath="\\hhcode\code\NonProd\$env\Sites\api\";WebApp=$WebAppSFTPService}

##########################

#####Miami
#uat has different path: \\hhcode\code\NonProd\UAT\HealthHub\api
#WebApp Objects that go inside Site objects 
$WebAppWsOnpointApi = @{Name='OnPointAPI' ;Pool="ws-OnPointApi-$env";PhyPath="\\hhcode\code\HealthHub\$env\api\OnPointAPI"}
$WebAppSFTPService = @{Name='SFTPService' ;Pool="ws-SFTP-$env";PhyPath="\\hhcode\code\HealthHub\$env\api\SFTPService"}
#Site Objects 
$Onpoint = @{SiteName=’OnPoint’;port=’8049’;Pool=’OnPointApi’;PhyPath="\\hhcode\code\OnPoint\$env"}
$WsOnpointApi = @{SiteName=’ws-OnPointApi’;port=’8050’;Pool="ws-OnPointApi-$env";PhyPath="\\hhcode\code\HealthHub\$env\api\";WebApp=$WebAppWsOnpointApi}
$sftpService = @{SiteName=’SFTPservice’;port=’8051’;Pool="ws-SFTP-$env";PhyPath="\\hhcode\code\HealthHub\$env\api\";WebApp=$WebAppSFTPService}
#####
#Manual all
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
    Set-WebConfigurationProperty $fullPath -Name "username" -Value $userName
    Set-WebConfigurationProperty $fullPath -Name "password" -Value $credentials.Password
}


#Manual all
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

#Done all servers
#Look for all web app and set the follwoing user
$WebApps = Get-WebApplication
ForEach($webApp in $WebApps)
{
    $xpath = ($webApp | Select -Property "ItemXPath").ItemXPath
    $fullPath = "$xpath/virtualDirectory[@path='/']" 
    $fullPath = $fullPath.Substring(1)
    Set-WebConfigurationProperty $fullPath -Name "username" -Value $username
    Set-WebConfigurationProperty $fullPath -Name "password" -Value $credentials.Password
}


#Steps Left

#8 #all prod servers
[System.Environment]::SetEnvironmentVariable('ASPNETCORE_ENVIRONMENT',"$env",
[System.EnvironmentVariableTarget]::Machine)

#9 Done on all manually

```