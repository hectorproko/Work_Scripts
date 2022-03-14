``` powershell
Get-ScheduledTask | Where-Object State -EQ "Running" | Select-Object State, TaskName

#Disable Jobs
Get-ScheduledTask | Where-Object State -EQ "Disable" | Select-Object State, TaskName | Out-File -FilePath "C:\Users\zz492564\Desktop\Report.txt"
$jobCount = (Get-ScheduledTask | Where-Object State -EQ "Disable" | Select-Object State, TaskName).Count 
Write-Output "Number of jobs Disable: $jobCount" | Out-File -FilePath "C:\Users\zz492564\Desktop\Report.txt" -Append

#Ready Jobs
Get-ScheduledTask | Where-Object State -EQ "Ready" | Select-Object State, TaskName | Out-File -FilePath "C:\Users\zz492564\Desktop\Report.txt" -Append
(Get-ScheduledTask | Where-Object State -EQ "Ready" | Select-Object State, TaskName).Count


(Get-ScheduledTask).Count
Get-ScheduledTask -TaskName "\H
```