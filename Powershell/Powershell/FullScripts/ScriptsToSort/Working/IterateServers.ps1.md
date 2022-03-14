``` powershell
$serverList = @('pfx-uat-app01','pfx-uat-pimp01','pfx-miami-02','pfx-az-tampa02','pfx-az-qa06')

ForEach ($server in $serverList)
{
    Invoke-Command -ComputerName $server -ScriptBlock {
        hostname
        $keyword = "copay"
        Get-ScheduledTask | Where-Object {$_.TaskName -Match $keyword}
        $task =$(Get-ScheduledTask | Where-Object {$_.TaskName -Match $keyword} | Select-Object -ExpandProperty TaskName)
        Get-ScheduledTask $task | Get-ScheduledTaskInfo | Select-Object -Property TaskName, LastRunTime, LastTaskResult
    }

}
```