``` powershell
Import-Module WebAdministration
$thumbprints = Get-ChildItem -Path Cert:\LocalMachine\My\ | Select-Object -ExpandProperty Thumbprint
$SpecifcUser = "bipfs\hhmiamiuser"
$credentials = (Get-Credential $SpecifcUser).GetNetworkCredential() #Not sure the last thing is for
$userName = $credentials.Domain + '\' + $credentials.UserName



function AddUserToCertificate {
param(
    [string]$userName,
    [string]$permission,
    [string]$certStoreLocation,
    [string]$certThumbprint
);
# check if certificate is already installed
$certificateInstalled = Get-ChildItem cert:$certStoreLocation | Where thumbprint -eq $certThumbprint

# download & install only if certificate is not already installed on machine
if ($certificateInstalled -eq $null)
{
    $message="Certificate with thumbprint:"+$certThumbprint+" does not exist at "+$certStoreLocation
    Write-Host $message -ForegroundColor Red
    exit 1;
}else
{
    try
    {
        $rule = new-object security.accesscontrol.filesystemaccessrule $userName, $permission, allow
        $root = "c:\programdata\microsoft\crypto\rsa\machinekeys"
        $l = ls Cert:$certStoreLocation
        $l = $l |? {$_.thumbprint -like $certThumbprint}
        $l |%{
            $keyname = $_.privatekey.cspkeycontainerinfo.uniquekeycontainername
            $p = [io.path]::combine($root, $keyname)
            if ([io.file]::exists($p))
            {
                $acl = get-acl -path $p
                $acl.addaccessrule($rule)
                echo $p
                set-acl $p $acl
            }
        }
    }
    catch 
    {
        Write-Host "Caught an exception:" -ForegroundColor Red
        Write-Host "$($_.Exception)" -ForegroundColor Red
        exit 1;
    }    
}

#exit $LASTEXITCODE

}



foreach ($thumbprint in $thumbprints){
    $thumbprint
    #AddUserToCertificate -userName $SpecifcUser -permission read -certStoreLocation \LocalMachine\My -certThumbprint $thumbprint
    AddUserToCertificate -userName $SpecifcUser -permission full control -certStoreLocation \LocalMachine\My -certThumbprint $thumbprint
}
```