``` powershell
$serverList= Get-Content -Path "C:\Users\PN492564\Desktop\ServersToCerUser.txt"
ForEach ($server in $serverList)
{
    echo $server
    $Sesssion = New-PSSession -ComputerName $server
    Copy-Item -Path ".\Temp" -Destination "C:\Users\PN492564\Desktop\" -Recurse -ToSession $Sesssion
    Exit-PSSession
}
```