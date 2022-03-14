```powershell
$id = "2304"

$serverList = @('pfx-uat-app01','pfx-uat-pimp01','pfx-miami-02','pfx-az-tampa02','pfx-az-qa06')

ForEach ($server in $serverList)
{
    
    Invoke-Command -ComputerName $server -ScriptBlock {
        hostname
        Get-Process -Id $args[0]

    } -Args $id

} 
```