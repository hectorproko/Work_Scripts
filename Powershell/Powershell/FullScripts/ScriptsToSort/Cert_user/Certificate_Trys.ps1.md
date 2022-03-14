``` powershell
Import-Module WebAdministration

$thumbprints = Get-ChildItem -Path Cert:\LocalMachine\My\ | Select-Object -ExpandProperty Thumbprint
$SpecifcUser = "bipfs\hhuatuser"
#$path = "\\celerrafs02.payflex.com\data\SHARED\RM Team\Hector\Ua\"

$credentials = (Get-Credential $SpecifcUser).GetNetworkCredential() #Not sure the last thing is for
$userName = $credentials.Domain + '\' + $credentials.UserName

$counter = 0
foreach ($thumbprint in $thumbprints){
    $thumbprint
    .\AddUserToCertificate.ps1 -userName $SpecifcUser -permission read -certStoreLocation \LocalMachine\My -certThumbprint $thumbprint

}
```