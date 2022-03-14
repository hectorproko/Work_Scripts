``` powershell
$testText="ClaimsEngine_AutopayHD.xml:39:      <Command>C:\Apps\ClaimsEngine\ClaimsEngine_AutopayHD.bat</Command>"

$pattern = '(?<=\>).+?(?=\<)'
$BatPath=[regex]::Matches($testText, $pattern).Value

$toRemove=$BatPath.Split("\")[-1]

$configPath=$BatPath.Replace($toRemove, "")


Get-Content "$configPath*.config" | Select-String ".log "
```