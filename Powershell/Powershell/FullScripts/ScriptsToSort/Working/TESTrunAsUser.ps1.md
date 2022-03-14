``` powershell
$serverList = Get-Content -Path "\\celerrafs02.payflex.com\data\SHARED\RM Team\Hector\Servers\TEST\GitServer.txt"
$mypwd = ConvertTo-SecureString -String "123456" -Force -AsPlainText #password to import .pfx
$certPath="C:\Windows\Temp\Certs"

#User part
Import-Module WebAdministration
$SpecifcUser = "bipfs\hhmiamiuser"


ForEach ($server in $serverList)
{
    
    Invoke-Command -ComputerName $server -ScriptBlock {
        $mypwd=$args[0]
        $certPath=$args[1]
        $SpecifcUser=$args[2]
 

        #Adding user section
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





        #AddUserToCertificate -userName $SpecifcUser -permission read -certStoreLocation \LocalMachine\My -certThumbprint $thumbprint
        #AddUserToCertificate -userName $SpecifcUser -permission full control -certStoreLocation \LocalMachine\My -certThumbprint $thumbprint
        AddUserToCertificate -userName $SpecifcUser -permission full control -certStoreLocation \LocalMachine\My -certThumbprint 5E7FEB3240EF0DB2A8D450D59DF346A64C666A6B
        AddUserToCertificate -userName $SpecifcUser -permission full control -certStoreLocation \LocalMachine\My -certThumbprint E6DAF7DE99019D2D4C6378339A428757537D339D

    } -Args $mypwd, $certPath, $SpecifcUser
} 



5E7FEB3240EF0DB2A8D450D59DF346A64C666A6B
E6DAF7DE99019D2D4C6378339A428757537D339D
```