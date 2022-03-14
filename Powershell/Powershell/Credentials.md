```Powershell
$user="hector"
$credentials = (Get-Credential "bipfs\$user").GetNetworkCredential() 
$userName = $credentials.Domain + '\' + $credentials.UserName
```

Might have to import
Import-Module WebAdministration

Code above