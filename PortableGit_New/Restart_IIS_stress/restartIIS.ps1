

# This file contains the list of servers you want to copy files/folders to
$computers = Get-Content ".\Servers.txt"


foreach ($computer in $computers) 
{
	invoke-command -computername $computer {cd C:\Windows\System32\; ./cmd.exe /c "iisreset /stop" }
	invoke-command -computername $computer {cd C:\Windows\System32\; ./cmd.exe /c "iisreset /start" }
}
