``` powershell
#Get-ScheduledTask | Select-Object TaskName
#Get-ScheduledTask | Where-Object {$_.TaskName -eq 'sih'}

#Begging with s and while card after
#Find exact name
$keyword = "FDR - Create"
Get-ScheduledTask | Where-Object {$_.TaskName -Match $keyword}
Get-ScheduledTask | Where-Object {$_.TaskName -Match $keyword} | Start-ScheduledTask

$task =$(Get-ScheduledTask | Where-Object {$_.TaskName -Match $keyword} | Select-Object -ExpandProperty TaskName)
#$task="EOD HSA Alerts"
#Get-ScheduledTask | Where-Object {$_.TaskName -eq 'si*'}

#Start-ScheduledTask -TaskName "$task"

#Get-ScheduledTask TEST | Get-ScheduledTaskInfo

#Get-ScheduledTask TEST | Get-ScheduledTaskInfo | Get-Member

#1 is succesful
Get-ScheduledTask $task | Get-ScheduledTaskInfo | Select-Object -Property TaskName, LastRunTime, LastTaskResult

#Getting path of log
$desktop="C:\Users\PN492564\Desktop"
$job=Get-ScheduledTask $task | Get-ScheduledTaskInfo | Select-Object -ExpandProperty TaskName
$TaskPath = Get-ScheduledTask $task | Get-ScheduledTaskInfo | Select-Object -ExpandProperty TaskPath
Export-ScheduledTask -TaskName $job -TaskPath $TaskPath | Out-File -FilePath "$desktop\$job.xml"
Select-String -Path "$desktop\$job.xml" -Pattern "command" #Gets the path


$taskResult = Get-ScheduledTask $task | Get-ScheduledTaskInfo | Select-Object -ExpandProperty LastTaskResult

if ($taskResult -eq "0")
{
    Write-Host "Success" -ForegroundColor Green
}
Else
{ 
    Write-Host "Fail" -ForegroundColor Red
}



$s = New-PSSession -ComputerName pfx-nyc2-web01
Invoke-Command -Session $s -ScriptBlock {
hostname
Get-ScheduledTask
}


Get-ScheduledTask | Where-Object {$_.State -Match "Disabled"} | Select-Object State, TaskName

```