```powershell
#Setting up appPool for webApp
foreach ($f in $appPools){
    echo "Hello $f"
    Set-ItemProperty "IIS:\Sites\$site\$f" -Name applicationPool -Value $f #Referencing an appPool from newly Converted
}
```

WebApp is the result of [[Converting Directory to WebApp]] you click the dropdown menu and there are files and folders. Some of those folder become WebApps or apps within sites.

[[List to var]]