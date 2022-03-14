Need to be carefull with version of windows

```powershell
New-WebApplication -Name "OnPointAPI" -Site "ws-OnPointApi" -PhysicalPath "\\hhcode\code\NonProd\$env\Sites\api\OnPointAPI" -Force -Verbose
```
Below did not work on windows 2019

```powershell
#Converting Direcotry to app
foreach ($f in $appPools){

    echo "Hello $f"
    ConvertTo-WebApplication "IIS:\Sites\$site\$f" #Converting directory to app
}
```

Might have to import
Import-Module WebAdministration

[[List to var]]
[[Set AppPool in WebApp]]
[[(Run as) for WebApp]]