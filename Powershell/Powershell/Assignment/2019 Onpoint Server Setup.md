Final Script [[OnPointSetup.ps1]]

Tampa Server:
	pfx-tampa-web01
	pfx-tampa-web02
Reference
	check pfx-buff-web01 and pfx-buff-web02

Wrong roles-features:

pfx-az-qa13 Bufffalo ot
pfx-az-tampa01 Tampa #undo-sites-pool #cleanup

1. Server Manager [[Copy Roles-Features from A to B]]
	1. Server roles
	2. Features

           

RESTART THE SERVER after server roles and features are installed

2. Under L drive create Folder “Log” .add below subfolders: [[Invoke]] [[Create Empty Folder Structure]]
~~3. ADD f5XforwardedFor2008 folder under “Program Files” you can copy this folder from any existing server
	1. Map f5XforwardedFor2008 in iis using ‘ISAPI Filter” from iis homepage
4. Add respective service account to “Temporary ASP .NET files [[Folder Permission]]
	1. Path: C:\Windows\Microsoft.NET\Framework64\v4.0.30319

5. Certificates:
	1. Highlighted certificate names will vary as per the environment [[Import Certifcations]]
	2. Add service accounts to the certificates with private key. Right click->All tasks->manage private keys [[Add User To Certificate]]

6. Pools
	- OnpointApi
	- Ws-Sftp- need to enable 32 bit from advance settings for sftp-service only
	- Ws-onpointapi
	
7. Sites: use numerically highest IP [[Custom Object]]

Port:
- Onpoint: 8049
- Ws- OnpointApi: 8050
- sftpService: 8051

           

OnPoint site setup:
- Map to respective env path:
- Map onpoint certificate for respective env
	- Site Name: OnPoint
	- Pool: OnPointApi
	- Physical Path: \\hhcode\code\OnPoint\$env
    
SFTP service site: (Still a Site)
- Map to parent “API” folder for the respective env. Convert only SFTP folder to application(refer pfx-buff-web01 setup)
 - Map ws-sftp certificate for respective env.
	- Site Name: SFTPservice
	- Pool: ws-SFTP-$env
	- Physical Path: ~~\\hhcode\code\HealthHub\$env\api
	- \\hhcode\code\NonProd\Tampa\Sites\api\SFTPService
	
Ws-onpointapi site: (Still a Site)
- Map ws-onpointapi certificate for the respective environment
- Use same process as SFTP service , convert only ws-onpointapi to application
	- Site Name: ws-OnPointApi
	- Pool: ws-OnPointApi-$env
	- Physical Path: ~~\\hhcode\code\HealthHub\$env\api
	- \\hhcode\code\NonProd\Tampa\Sites\api\OnPointAPI


           

Converted applications paths should automatically be created as follows:
- SFTP application:
	- Alias: SFTPService
	- Pool: ws-SFTP-$env
	- \\hhcode\code\HealthHub\$env\api\SFTPService

- Ws-onpointapi application
	- Alias: OnPointAPI
	- Pool: ws-OnPointApi-$env
	- \\hhcode\code\HealthHub\$env\api\OnPointAPI
	
8. Add environmental variable
    Search for “Edit environment variable for your account”
	Var name: ASPNETCORE_ENVIRONMENT
	Var value: $env
	
9. Install scom service
- Run Register_COM_DLL.ps1 power shell scripts to register COM dll on webservers.
- Copy “SFTPCOMInterface” folder from C : drive in pfx-buff-web01