clear
$gitPortable = "E:\WKABDeployScript\PortableGit"
$buildTeam = $gitPortable+"\BuildTeam"
$links = $buildTeam + "\Links"
$servers = $links + "\Servers"

#Getting List of Envs
$environments = Get-Content $servers\Environments.txt
$message = ""
Set-Alias -Name email -Value E:\WKABDeployScript\PortableGit\BuildTeam\SendEmail.ps1
#email list
#$generic = "Hector.Rodriguez@COMPANY.com"
#$dev2Recipients = @("Hector.Rodriguez@COMPANY.com")
$dev2Recipients = @("GBITAABuildDeploy@COMPANY.com")

$qa2Recipients = @("GBITAABuildDeploy@COMPANY.com")


function Get-Status ($env)
{ 
    #if env -eq X variable recipient equals, then loop throu recipients arrays
    switch ($env)
    {
        "Dev2" {$recipients = $dev2Recipients}
        "QA2" {$recipients = $qa2Recipients}
        3 {""}
        4 {""}
        Default {$recipients = "GBITAABuildDeploy@COMPANY.com"}
    }

    $counter=0
    $WebServers = Get-Content $servers\$env"_Web.txt"

    $timeStamp = Get-Date
    Write-Output "[$timeStamp]"

    foreach($server in $WebServers)
    { 
        $counter++
        Write-Output "($env) ($server) Server [$counter]"
        
        "[IIS Sites]"
        $iisSites = Invoke-Command  -ComputerName $server { Install-Module -Name IISAdministration; Get-IISSite }
        $stoppedSite = $iisSites | Where-Object {$_.State -eq "Stopped"}

        if($stoppedSite | Where-Object {$_.State -eq "Stopped"}) 
        {
            Write-Host "Something Stopped" -ForegroundColor Red
            $message = $stoppedSite | Where-Object {$_.State -eq "Stopped"} | Select-Object PSComputerName, Name, state | Out-String #| Format-Table 
            $message
            $name = $stoppedSite | Select-Object Name | Format-Table -HideTableHeaders | Out-String
            $name = $name.Trim()
            $message += "Starting $name, Re-Checking... `n"
            $name.GetType();
            Invoke-Command  -ComputerName $server { Start-IISSite -Name $using:name } #need the put using or get error of empty
            
            $message += Invoke-Command  -ComputerName $server { Get-IISSite } | Where-Object {$_.Name -eq "$name"} | Select-Object Name, state | Out-String

            #email "$generic" "$env [IIS Sites] Stopped" "$message"
            foreach($email in $recipients)
            {
                email "$email" " " "$env [IIS Sites] Stopped" "$message"
            } 
        } 
        else 
        {
            Write-Host " Everything UP" -ForegroundColor Green 
        }

        "[IIS App Pool]"  
        $iisAppPool = Invoke-Command  -ComputerName $server { Install-Module -Name IISAdministration; Get-IISAppPool }
        $stoppedApp = $iisAppPool | Where-Object {($_.State -eq "Stopped") -and ($_.Name -ne "test")}#making sure test is ignored

        
        if($stoppedApp | Where-Object {$_.State -eq "Stopped"}) 
        {
            Write-Host "Something Stopped" -ForegroundColor Red
            $message = $stoppedApp | Where-Object {$_.State -eq "Stopped"} | Select-Object PSComputerName, Name, state | Out-String #| Format-Table 
            $message
            $name = $stoppedApp | Select-Object Name | Format-Table -HideTableHeaders | Out-String
            $name = $name.Trim()
            $message += "Starting $name, Re-Checking... `n"
            $name.GetType();
            Invoke-Command  -ComputerName $server { Start-WebAppPool -Name $using:name } #need to put using or get error of empty
            
            $message += Invoke-Command  -ComputerName $server { Get-IISAppPool } | Where-Object {$_.Name -eq "$name"} | Select-Object Name, state | Out-String

            #email "$generic" "$env [IIS Sites] Stopped" "$message"
            foreach($email in $recipients)
            {
                email "$email" " " "$env [IIS App Pool] Stopped" "$message"
                #email "Hector.rodriguez@COMPANY.com" "blank@blank.com" "$env [IIS App Pool] Stopped" "$message" #blank emai to avoid error message

            }#>
        }
        else 
        {
            Write-Host " Everything UP" -ForegroundColor Green 
        }


    }

}

    
foreach($enviro in $environments)
{
   Write-Host " Checking $enviro" -ForegroundColor Yellow

   Get-Status $enviro 
}
#>
