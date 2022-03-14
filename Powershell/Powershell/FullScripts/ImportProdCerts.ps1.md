#invoke
#sharepath
```powershell
$serverList = Get-Content -Path "\\celerrafs02.payflex.com\data\SHARED\RM Team\Hector\Servers\TEST\allprod.txt"
#$mypwd = ConvertTo-SecureString -String "5LwpDzCYTKFz#8V" -Force -AsPlainText #password to import .pfx
$mypwd = ConvertTo-SecureString -String "CYTK5LwpDzFz#8V" -Force -AsPlainText #password to import .pfx
$certDest="\Windows\Temp\Certs" #Getting rid of C:,for later
$certSource="\\celerrafs02.payflex.com\data\SHARED\RM Team\Hector\PRODCerts"

ForEach ($server in $serverList)
{
    #Copying Folders with Cert
    #$certDestC="\\$server\C$"+$certDest
    #Copy-Item $certSource -Destination $certDestC -Recurse -Verbose


    Invoke-Command -ComputerName $server -ScriptBlock {
        hostname
        $mypwd=$args[0]
        $certDest=$args[1]
        $SpecifcUser=$args[2]
        
        #Delete Old Cert
        #With thumprint
        Get-ChildItem Cert:\LocalMachine\My\‎6548E78207C1434DD8443FAFB4F02E11E4CBDEE0 | Remove-Item -Verbose
        Get-ChildItem Cert:\LocalMachine\My\fb605bb10224775345a3d8989daaec6b52d19716 | Remove-Item -Verbose #Got Deleted
        #>

        #Importing section
        
        #$thumbprints=Get-ChildItem -Path $certDest -Filter comms.nga.prod.payflex.com.pfx | Import-PfxCertificate -CertStoreLocation Cert:\LocalMachine\My\ -Exportable -Password $mypwd | Select-Object -ExpandProperty Thumbprint
        #Echo "Certificates Imported: $thumbprints"
        #$thumbprints2=Get-ChildItem -Path $certDest -Filter mobile.nga.prod.payflex.com.pfx | Import-PfxCertificate -CertStoreLocation Cert:\LocalMachine\My\ -Exportable -Password $mypwd | Select-Object -ExpandProperty Thumbprint
        #Echo "Certificates Imported: $thumbprints2"
        #>

        #Cleaning#
        #Remove-Item -Recurse -Force $certDest -Verbose
   

    } -Args $mypwd, $certDestC, $SpecifcUser

} 


```