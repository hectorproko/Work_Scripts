```powershell
$folder="\\celerrafs02.payflex.com\data\SHARED\RM Team\Hector\NY2_cert"
$mypwd = Get-Credential -UserName $env:USERNAME -Message 'Payflex!'

#Adds all .cert
$files = Get-ChildItem $folder -Filter *.cer
foreach ($f in $files){
    Import-Certificate -FilePath $f.FullName -CertStoreLocation Cert:\LocalMachine\My
}

#Adds all .pfx
$files = Get-ChildItem $folder -Filter *.pfx
foreach ($f in $files){
    Import-PfxCertificate -FilePath $f.FullName -CertStoreLocation Cert:\LocalMachine\My -Exportable -Password $mypwd.Password
}
```

# .cert
# .pfx

<s>No need to filster files for .pfx this works</s>, you do need to filter
```powershell
$mypwd = ConvertTo-SecureString -String "123456" -Force -AsPlainText
        Get-ChildItem -Path $certPath | Import-PfxCertificate -CertStoreLocation Cert:\LocalMachine\My\ -Exportable -Password $mypwd
```