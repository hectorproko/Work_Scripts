``` powershell
Clear
Import-Module WebAdministration


$serverList= Get-Content -Path "\\celerrafs02.payflex.com\data\SHARED\RM Team\Hector\PerformanceServers.txt"
ForEach ($server in $serverList)
{

    echo $server
    $s = New-PSSession -ComputerName $server
    Invoke-Command -Session $s -ScriptBlock { 
        Get-Culture
        Get-Date | Select-Object DateTime
        Import-Module WebAdministration
        ##### Sites and Apps Work ####
        $Websites = Get-IISSite
        foreach ($site in $Websites){
            ""
            ""
            "###########Site_Begin##########"
            "Site: " + $site.name
            "Bindings: " + $site.bindings
            Get-Item "IIS:\Sites\$site" | Select-Object  userName, password, applicationPool, physicalPath , bindings
            "###########Site_End##########"

            "###########Apps_Begin##########"
            #Write-Host $site.Applications | Format-Custom Name
            $webApp = Get-WebApplication -Site $site 
            $path=$webApp.path #Has names of all the apps
    
            foreach ($a in $path){
                    "$a"
                    Get-Item "IIS:\Sites\$site$a" | Select-Object userName, password, preloadEnabled
            }
            "###########Apps_Ends##########"
            #
        }

        "###########AppPools_Begin##########"
        $appPools = Get-IISAppPool 
        foreach ($pool in $appPools){
            $name = $pool.Name
            "`n###$name###"
            #Checking AppPools
            (Get-Item "IIS:\AppPools\$name\").ProcessModel | Select-Object identityType, userName, password, loadUserProfile, idleTimeout, idleTimeoutAction
            $var=(Get-Item "IIS:\AppPools\$name\").startMode
            echo "startMode         : $var"
        }
        "###########AppPools_End##########"

    } | out-file -FilePath "\\celerrafs02.payflex.com\data\SHARED\RM Team\Hector\Reports\$server.txt" #end of invoke

}


```