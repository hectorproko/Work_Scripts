#Task-Scheduler
#Jobs
#export-Schedule-Jobs

```powershell
#Get-ScheduledTask -TaskPath "\HD Apps\" | Export-ScheduledTask | Out-File -FilePath ".\HDApps.xml"

Export-ScheduledTask -TaskName "ABG to BNY Migration" -TaskPath "\HD Apps\" | Out-File -FilePath ".\ABG to BNY Migration.xml"
Clear
$HDApps = Get-ScheduledTask -TaskPath "\HD Apps\" | Select-Object -ExpandProperty TaskName


foreach ($job in $HDApps){
    echo $job
    Export-ScheduledTask -TaskName $job -TaskPath "\HD Apps\" | Out-File -FilePath ".\HDApps\$job.xml"

}
```
