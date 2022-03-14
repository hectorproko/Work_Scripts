#Task-Scheduler
#Jobs
#Import-Schedule-Jobs

```powershell
$credentials = (Get-Credential "bipfs\hhnycuser").GetNetworkCredential() #Not sure the last thing is for
$userName = $credentials.Domain + '\' + $credentials.UserName

$source = "\\celerrafs02.payflex.com\data\SHARED\RM Team\Hector\HDApps\"
#$job = "BatchEnrollment"
$format = ".xml"
#$xmlFile = "$job$format"

$xmlFiles = ls $source | Select-Object Name

foreach ($xmlFile in $xmlFiles){
    $xmlFile = $xmlFile | Select-Object -ExpandProperty Name #Getting a wrid object name
    $job = $xmlFile.Split('.')[0].split('')
    $job = [String]$job
    Register-ScheduledTask -xml (Get-Content "$source$xmlFile" | Out-String) -TaskName $job -TaskPath "\HD Apps\" -User $userName –Password $credentials.Password
}
```
