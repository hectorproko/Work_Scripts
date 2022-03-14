```powershell
Get-WindowsFeature -computerName pfx-az-qa13 | ? { $_.Installed } | Select Name | ForEach-Object { Install-WindowsFeature $($_.Name) }
```

In the example I'm using Buffalo server

[Source](https://www.normanbauer.com/2017/06/13/how-to-install-all-roles-and-features-of-one-server-on-another/)

Had to remove the quotes from original posting, otherwise it does not execute


Commands it run in Tampa
```powershell
Install-WindowsFeature FileAndStorage-Services
Install-WindowsFeature File-Services
Install-WindowsFeature FS-FileServer
Install-WindowsFeature FS-BranchCache
Install-WindowsFeature FS-DFS-Namespace
Install-WindowsFeature Storage-Services
Install-WindowsFeature Web-Server
Install-WindowsFeature Web-WebServer
Install-WindowsFeature Web-Common-Http
Install-WindowsFeature Web-Default-Doc
Install-WindowsFeature Web-Dir-Browsing
Install-WindowsFeature Web-Http-Errors
Install-WindowsFeature Web-Static-Content
Install-WindowsFeature Web-Http-Redirect
Install-WindowsFeature Web-Health
Install-WindowsFeature Web-Http-Logging
Install-WindowsFeature Web-Custom-Logging
Install-WindowsFeature Web-Log-Libraries
Install-WindowsFeature Web-Request-Monitor
Install-WindowsFeature Web-Http-Tracing
Install-WindowsFeature Web-Performance
Install-WindowsFeature Web-Stat-Compression
Install-WindowsFeature Web-Dyn-Compression
Install-WindowsFeature Web-Security
Install-WindowsFeature Web-Filtering
Install-WindowsFeature Web-Basic-Auth
Install-WindowsFeature Web-Windows-Auth
Install-WindowsFeature Web-App-Dev
Install-WindowsFeature Web-Net-Ext
Install-WindowsFeature Web-Net-Ext45
Install-WindowsFeature Web-Asp-Net
Install-WindowsFeature Web-Asp-Net45
Install-WindowsFeature Web-ISAPI-Ext
Install-WindowsFeature Web-ISAPI-Filter
Install-WindowsFeature Web-Includes
Install-WindowsFeature Web-Ftp-Server
Install-WindowsFeature Web-Mgmt-Tools
Install-WindowsFeature Web-Mgmt-Console
Install-WindowsFeature Web-Mgmt-Compat
Install-WindowsFeature Web-Metabase
Install-WindowsFeature Web-Lgcy-Scripting
Install-WindowsFeature Web-WMI
Install-WindowsFeature Web-Scripting-Tools
Install-WindowsFeature ServerEssentialsRole
Install-WindowsFeature NET-Framework-Features
Install-WindowsFeature NET-Framework-Core
Install-WindowsFeature NET-Framework-45-Features
Install-WindowsFeature NET-Framework-45-Core
Install-WindowsFeature NET-Framework-45-ASPNET
Install-WindowsFeature NET-WCF-Services45
Install-WindowsFeature NET-WCF-HTTP-Activation45
Install-WindowsFeature BranchCache
Install-WindowsFeature GPMC
Install-WindowsFeature RDC
Install-WindowsFeature RSAT
Install-WindowsFeature RSAT-Role-Tools
Install-WindowsFeature RSAT-File-Services
Install-WindowsFeature RSAT-DFS-Mgmt-Con
Install-WindowsFeature RSAT-RemoteAccess
Install-WindowsFeature RSAT-RemoteAccess-PowerShell
Install-WindowsFeature FS-SMB1
Install-WindowsFeature User-Interfaces-Infra
Install-WindowsFeature Server-Gui-Mgmt-Infra
Install-WindowsFeature Server-Gui-Shell
Install-WindowsFeature PowerShellRoot
Install-WindowsFeature PowerShell
Install-WindowsFeature PowerShell-ISE
Install-WindowsFeature WAS
Install-WindowsFeature WAS-Process-Model
Install-WindowsFeature WAS-NET-Environment
Install-WindowsFeature WAS-Config-APIs
Install-WindowsFeature Windows-Server-Backup
Install-WindowsFeature WoW64-Support
```

Output:

```powershell
Success Restart Needed Exit Code      Feature Result                               
------- -------------- ---------      --------------                               
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             Success        {DFS Namespaces}                             
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             Success        {Basic Authentication}                       
True    No             Success        {Windows Authentication}                     
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             Success        {Server Side Includes}                       
True    No             Success        {FTP Server, FTP Service}                    
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             Success        {IIS 6 Metabase Compatibility, IIS 6 Manag...
True    No             NoChangeNeeded {}                                           
True    No             Success        {IIS 6 Scripting Tools, IIS 6 WMI Compatib...
True    No             NoChangeNeeded {}                                           
True    No             Success        {IIS Management Scripts and Tools}           
True    No             Success        {BranchCache, Group Policy Management, Rem...
WARNING: You need to configure Windows Server Essentials Experience.
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             Success        {Hyper-V Module for Windows PowerShell, Hy...
True    No             NoChangeNeeded {}                                           
True    No             Success        {File Services Tools}                        
True    No             Success        {DFS Management Tools}                       
True    No             Success        {RAS Connection Manager Administration Kit...
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
Install-WindowsFeature : ArgumentNotValid: The role, role service, or feature name is not valid: 'User-Interfaces-Infra'. The name was 
not found.
At line:1 char:100
+ ...  | Select Name | ForEach-Object { Install-WindowsFeature $($_.Name) }
+                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidArgument: (User-Interfaces-Infra:String) [Install-WindowsFeature], Exception
    + FullyQualifiedErrorId : NameDoesNotExist,Microsoft.Windows.ServerManager.Commands.AddWindowsFeatureCommand
False   No             InvalidArgs    {}                                           
Install-WindowsFeature : ArgumentNotValid: The role, role service, or feature name is not valid: 'Server-Gui-Mgmt-Infra'. The name was 
not found.
At line:1 char:100
+ ...  | Select Name | ForEach-Object { Install-WindowsFeature $($_.Name) }
+                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidArgument: (Server-Gui-Mgmt-Infra:String) [Install-WindowsFeature], Exception
    + FullyQualifiedErrorId : NameDoesNotExist,Microsoft.Windows.ServerManager.Commands.AddWindowsFeatureCommand
False   No             InvalidArgs    {}                                           
Install-WindowsFeature : ArgumentNotValid: The role, role service, or feature name is not valid: 'Server-Gui-Shell'. The name was not 
found.
At line:1 char:100
+ ...  | Select Name | ForEach-Object { Install-WindowsFeature $($_.Name) }
+                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidArgument: (Server-Gui-Shell:String) [Install-WindowsFeature], Exception
    + FullyQualifiedErrorId : NameDoesNotExist,Microsoft.Windows.ServerManager.Commands.AddWindowsFeatureCommand
False   No             InvalidArgs    {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             Success        {.NET Environment 3.5}                       
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}                                           
True    No             NoChangeNeeded {}
```