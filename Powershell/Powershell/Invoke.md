
```powershell
Invoke-Command -ComputerName $server -ScriptBlock {
    hostname
    #$keyword = "investments
}
```


```powershell
$serverList = @('pfx-miami-02','pfx-az-qa14','pfx-az-tampa02','pfx-az-qa12','pfx-az-qa11','pfx-az-qa07','pfx-az-qa08','pfx-uat-app01','pfx-fqa-app01','pfx-az-qa05','pfx-az-qa06','pfx-az-qa10','pfx-uat2-app01','pfx-uat2-app02')
ForEach ($server in $serverList)
{
    Invoke-Command -ComputerName $server -ScriptBlock {
        hostname
        #$keyword = "investments"
        #Get-ScheduledTask | Where-Object {$_.TaskName -Match $keyword} | Where-Object {$_.State -Match "Ready"} | Out-File -FilePath .\BNYReport2.txt
        #Get-ScheduledTask | Where-Object {$_.TaskName -Match $keyword} | Where-Object {$_.State -Match "Ready"} | Select-Object TaskName | Out-File -FilePath .\BNYReport2.txt

    }

}
```