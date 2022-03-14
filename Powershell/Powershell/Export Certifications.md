```powershell
$thumbprints = Get-ChildItem -Path Cert:\LocalMachine\My\ | Select-Object -ExpandProperty Thumbprint
$destino = "\\celerrafs02.payflex.com\data\SHARED\RM Team\Hector\NY2_cert\"

$counter = 0
foreach ($thumbprint in $thumbprints){
    $counter++
    echo $counter $thumbprint
    #exports a certificate to the file system as a DER-encoded .cer file without its private key
    $cert = Get-ChildItem -Path Cert:\LocalMachine\My\$thumbprint
    Export-Certificate -Cert $cert -FilePath "\\celerrafs02.payflex.com\data\SHARED\RM Team\Hector\NY2_cert\$counter.cert"
}

echo $thumbprint 



$cert = Get-ChildItem -Path Cert:\LocalMachine\My\FD371AEF30109DC1DC6241A00058F17DC6A186E4
Export-Certificate -Cert $cert -FilePath "\\celerrafs02.payflex.com\data\SHARED\RM Team\Hector\NY2_cert\Test.cert"
```


Hides the title of colum
```powershell
-ExpandProperty
```
