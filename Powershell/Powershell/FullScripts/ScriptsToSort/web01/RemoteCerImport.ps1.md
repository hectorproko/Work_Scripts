``` powershell
#doesn not work from jumphost server, the invoke

$sharepath="\\celerrafs02.payflex.com\data\SHARED\RM Team\Performacne Cert\Prod-web certs"


Invoke-Command -ComputerName "pfx-perf-web02" {  
"C:\Users\PN492564\Desktop\Temp\CertWiKey2.ps1"
}



$serverList= Get-Content -Path "C:\Users\PN492564\Desktop\ServersToCerUser.txt"
ForEach ($server in $serverList)
{
    echo $server
    $Sesssion = New-PSSession -ComputerName pfx-perf-web02
    Copy-Item -Path ".\Temp" -Destination "C:\Users\PN492564\Desktop\" -Recurse -ToSession $Sesssion
}

Invoke-Command -FilePath c:\jkj\etest.ps1 -ComputerName server01

clear
#Testing
$Sesssion = New-PSSession -ComputerName pfx-perf-web02
Copy-Item -Path ".\Temp" -Destination "C:\Users\PN492564\Desktop\" -Recurse -ToSession $Sesssion
Enter-PSSession -Session $Sesssion
Invoke-Command -FilePath "C:\Users\PN492564\Desktop\Temp\CertWiKey2.ps1" -ToSession $Sesssion

Enter-PSSession pfx-perf-web02
Exit-PSSession

Invoke-Command -SessionName $Sesssion {echo "Test"}

```