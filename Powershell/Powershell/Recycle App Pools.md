```powershell
Write-Host "App Pool Recycling Started...." -ForegroundColor Green
& $env:windir\system32\inetsrv\appcmd list apppools /state:Started /xml | & $env:windir\system32\inetsrv\appcmd recycle apppools /in
Write-Host "App Pool Recycling Completed" -ForegroundColor Green
```


https://www.kittell.net/code/powershell-recycle-all-app-pools/