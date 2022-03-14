#powershell
[[Credentials]]
[[List to var]]

```powershell
foreach ($f in $appPools){

    echo "Hello $f"

    #Creating AppPool
    New-WebAppPool -Name $f

    #Setting propperties of AppPools
    Set-ItemProperty "IIS:\AppPools\$f" -Name startMode -Value AlwaysRunning
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.loadUserProfile -Value True
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.idleTimeoutAction -Value Suspend
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.idleTimeout -Value ([TimeSpan]::FromMinutes(720))
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.identityType -Value SpecificUser
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.userName -Value $userName
    Set-ItemProperty "IIS:\AppPools\$f" -Name processModel.password -Value $credentials.Password
}
	
```

Might have to import
Import-Module WebAdministration