```powershell
New-IISSite -Name "$site" -PhysicalPath $physicalPath -BindingInformation $ip":"$port":"
Set-ItemProperty iis:\Sites\$site -Name applicationpool -Value $site  #This AppPool might not exits
Set-ItemProperty iis:\Sites\$site -Name applicationDefaults.preloadEnabled -Value True
```

Might have to import
Import-Module WebAdministration

[[(Run as) IIS Site]]