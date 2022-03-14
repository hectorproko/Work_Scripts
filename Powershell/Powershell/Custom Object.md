```Powershell
$me = @{name=’Hector’;title=’DevOps Engineer’}

$me.name
$me.title
```

[source](https://devblogs.microsoft.com/scripting/create-custom-objects-in-your-powershell-script/)


```Powershell
$Onpoint = @{SiteName=’OnPoint’;port=’8049’;Pool=’OnPointApi’;PhyPath="\\hhcode\code\OnPoint\$env"}
$WsOnpointApi = @{SiteName=’ws-OnPointApi’;port=’8050’;Pool="ws-OnPointApi-$env";PhyPath="\\hhcode\code\HealthHub\$env\api"}
$sftpService = @{SiteName=’SFTPservice’;port=’8051’;Pool=’ws-SFTP-$env’;PhyPath=" \\hhcode\code\HealthHub\$env\api"}

$env="Tampa"

$sftpService.SiteName
$sftpService.port
$sftpService.Pool
$sftpService.PhyPath
```