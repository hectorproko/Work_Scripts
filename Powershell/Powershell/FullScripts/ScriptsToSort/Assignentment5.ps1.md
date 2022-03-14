``` powershell

#$ip = "10.46.208.212"
$ip = "10.46.208.213"
Import-Module WebAdministration

$site = "CardTransactionBroker"
$port = "9292"
$physicalPath = "\\hhcode\code\NonProd\NYC2\CardApp\CardTransactionBroker"
New-IISSite -Name "$site" -PhysicalPath $physicalPath -BindingInformation $ip":"$port":"
Set-ItemProperty iis:\Sites\$site -Name applicationpool -Value "PIMP"  #This AppPool might not exits
Set-ItemProperty iis:\Sites\$site -Name applicationDefaults.preloadEnabled -Value True                                         
                            

$site = "MigrationService"
$port = "9191"
$physicalPath = "\\hhcode\code\NonProd\NYC2\CardApp\MigrationService"
New-IISSite -Name "$site" -PhysicalPath $physicalPath -BindingInformation $ip":"$port":"
Set-ItemProperty iis:\Sites\$site -Name applicationpool -Value "$site"  #This AppPool might not exits
Set-ItemProperty iis:\Sites\$site -Name applicationDefaults.preloadEnabled -Value True
                                                           

$site = "CardManagementBroker"
$port = "9090"
$physicalPath = "\\hhcode\CODE\NonProd\NYC2\CardApp\CardManagementBroker"
New-IISSite -Name "$site" -PhysicalPath $physicalPath -BindingInformation $ip":"$port":"
Set-ItemProperty iis:\Sites\$site -Name applicationpool -Value "PIMP"  #This AppPool might not exits
Set-ItemProperty iis:\Sites\$site -Name applicationDefaults.preloadEnabled -Value True


$site = "CardAppAdmin"
$port = "9000"
$physicalPath = "\\hhcode\code\NonProd\NYC2\CardApp\CardAppAdmin"
New-IISSite -Name "$site" -PhysicalPath $physicalPath -BindingInformation $ip":"$port":"
Set-ItemProperty iis:\Sites\$site -Name applicationpool -Value "PIMP"  #This AppPool might not exits
Set-ItemProperty iis:\Sites\$site -Name applicationDefaults.preloadEnabled -Value True
                            
                                 
$site = "healthhub-NYC2.payflex.com"
$port = "8040"
$physicalPath = "\\hhcode\code\NonProd\NYC2\Sites\HealthHub"
New-IISSite -Name "$site" -PhysicalPath $physicalPath -BindingInformation $ip":"$port":"
Set-ItemProperty iis:\Sites\$site -Name applicationpool -Value $site  #This AppPool might not exits
Set-ItemProperty iis:\Sites\$site -Name applicationDefaults.preloadEnabled -Value True
                                                                    
                   
$site = "hh-admin-NYC2.payflex.com"
$port = "8041"
$physicalPath = "\\hhcode\CODE\NonProd\NYC2\Sites\HealthHubAdmin"
New-IISSite -Name "$site" -PhysicalPath $physicalPath -BindingInformation $ip":"$port":"
Set-ItemProperty iis:\Sites\$site -Name applicationpool -Value $site  #This AppPool might not exits
Set-ItemProperty iis:\Sites\$site -Name applicationDefaults.preloadEnabled -Value True
                                                                         
                      
$site = "hh-hsasupport-NYC2.payflex.com"
$port = "8045"
$physicalPath = "\\hhcode\CODE\NonProd\NYC2\Sites\Service"
New-IISSite -Name "$site" -PhysicalPath $physicalPath -BindingInformation $ip":"$port":"
Set-ItemProperty iis:\Sites\$site -Name applicationpool -Value $site  #This AppPool might not exits
Set-ItemProperty iis:\Sites\$site -Name applicationDefaults.preloadEnabled -Value True
                                                                    
                 
$site = "mobileapi-NYC2.payflex.com"
$port = "8442"
$physicalPath = "\\hhcode\CODE\NonProd\NYC2\MobileAPI"
New-IISSite -Name "$site" -PhysicalPath $physicalPath -BindingInformation $ip":"$port":"
Set-ItemProperty iis:\Sites\$site -Name applicationpool -Value $site  #This AppPool might not exits
Set-ItemProperty iis:\Sites\$site -Name applicationDefaults.preloadEnabled -Value True
                                                                           
                      
$site = "mypayflex-NYC2.payflex.com"
$port = "8046"
$physicalPath = "\\hhcode\code\NonProd\NYC2\MyPayflex"
New-IISSite -Name "$site" -PhysicalPath $physicalPath -BindingInformation $ip":"$port":"
Set-ItemProperty iis:\Sites\$site -Name applicationpool -Value $site  #This AppPool might not exits
Set-ItemProperty iis:\Sites\$site -Name applicationDefaults.preloadEnabled -Value True
                                                                               
                  
$site = "nba-NYC2.payflex.com"
$port = "8443"
$physicalPath = "\\hhcode\CODE\NonProd\NYC2\ToDoService"
New-IISSite -Name "$site" -PhysicalPath $physicalPath -BindingInformation $ip":"$port":"
Set-ItemProperty iis:\Sites\$site -Name applicationpool -Value $site  #This AppPool might not exits
Set-ItemProperty iis:\Sites\$site -Name applicationDefaults.preloadEnabled -Value True
                                                                               
                          
$site = "VettingService-NYC2"
$port = "9500"
$physicalPath = "\\hhcode\CODE\NonProd\NYC2\Sites\VettingService"
New-IISSite -Name "$site" -PhysicalPath $physicalPath -BindingInformation $ip":"$port":"
Set-ItemProperty iis:\Sites\$site -Name applicationpool -Value $site  #This AppPool might not exits
Set-ItemProperty iis:\Sites\$site -Name applicationDefaults.preloadEnabled -Value True
                                                                                                          
$site = "ws-healthhub-NYC2.payflex.com"
$port = "8440"
$physicalPath = "\\hhcode\CODE\NonProd\NYC2\Sites\ws.healthhub.com"
New-IISSite -Name "$site" -PhysicalPath $physicalPath -BindingInformation $ip":"$port":"
Set-ItemProperty iis:\Sites\$site -Name applicationpool -Value $site  #This AppPool might not exits
Set-ItemProperty iis:\Sites\$site -Name applicationDefaults.preloadEnabled -Value True
                                                                    
 #https 10.42.112.115:: sslFlags=0                   
                   
$site = "wss-healthhub-NYC2.payflex.com"
$port = "8441"
$physicalPath = "\\hhcode\CODE\NonProd\NYC2\Sites\wss.healthhub.com"
New-IISSite -Name "$site" -PhysicalPath $physicalPath -BindingInformation $ip":"$port":"
Set-ItemProperty iis:\Sites\$site -Name applicationpool -Value $site  #This AppPool might not exits
Set-ItemProperty iis:\Sites\$site -Name applicationDefaults.preloadEnabled -Value True
                                        
$site = "www-NYC2.payflex.com"
$port = "8048"
$physicalPath = "\\hhcode\code\NonProd\NYC2\Payflex"
New-IISSite -Name "$site" -PhysicalPath $physicalPath -BindingInformation $ip":"$port":"
Set-ItemProperty iis:\Sites\$site -Name applicationpool -Value $site  #This AppPool might not exits
Set-ItemProperty iis:\Sites\$site -Name applicationDefaults.preloadEnabled -Value True
                                                                                                                                                                    
```