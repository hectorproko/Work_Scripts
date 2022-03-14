clear
$gitPortable = "E:\WKABDeployScript\PortableGit"
$buildTeam = $gitPortable+"\BuildTeam"
$links = $buildTeam + "\Links"
$servers = $links + "\Servers"
#Getting List of Envs
$environments = Get-Content $servers\Environments.txt

function Get-Status ($env)
{ 
    $counter=0
    $WebServers = Get-Content $servers\$env"_Web.txt"
    #New-Item -Path "E:\WKABDeployScript\PortableGit\IIS_StatusLog_Repo\" -Name $env'_IIS_Status.txt' -ItemType "file" -Value ""

    $timeStamp = Get-Date
    Write-Output "[$timeStamp]"

    foreach($server in $WebServers)
    { 
        $counter++
        Write-Output "################ ($env) ($server) Server [$counter]"
        "#######[IIS Sites]#######"
        Invoke-Command  -ComputerName $server { Install-Module -Name IISAdministration; Get-IISSite | Select-Object Name, state | Format-Table }
        "######[IIS App Pool]######"
        Invoke-Command  -ComputerName $server { Install-Module -Name IISAdministration; Get-IISAppPool | Select-Object Name, state | Format-Table }
    }

}

    

foreach($enviro in $environments)
{
   "Checking $enviro"
   $logPath = $gitPortable + "\IIS_StatusLog_Repo\" + $enviro + "_IIS_Status.txt"

   Get-Status $enviro | Out-File -FilePath $logPath
}




Set-Alias -Name git -Value $gitPortable\git-bash.exe
Set-Alias -Name push -Value $buildTeam\push.sh
#$time=Get-Date -Format "HH:mm"
$time=Get-Date -Format "dddd MM/dd/yyyy HH:mm hh:mm tt"
git $buildTeam\push.sh "/IIS_StatusLog_Repo" $time








