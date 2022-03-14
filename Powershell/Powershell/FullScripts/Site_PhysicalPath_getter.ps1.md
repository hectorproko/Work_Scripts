```powershell

$servers = Get-Content "\\celerrafs02.payflex.com\data\SHARED\RM Team\Hector\webServersNonProd.txt"

echo $servers


forEach($server in $servers) 
{
    $array = $server.Split(" ")
    #$array[1]
    echo $array[0]
    Invoke-Command -ComputerName $array[1] -ScriptBlock {
    hostname
    Import-Module WebAdministration 
    Get-Website | Select-Object name, physicalPath
    }
}
```
