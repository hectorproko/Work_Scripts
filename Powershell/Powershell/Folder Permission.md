Only know how to give Full Control
Can't run it multiple times for multiple permission Ex Read and Write, the last run overwrites previous one
```powershell
$serviceUser="bipfs\hhtampauser"
$folder="C:\Users\PN492564\Desktop\New folder"
$Acl = Get-Acl $folder

$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule($serviceUser, "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$Acl.SetAccessRule($Ar)
Set-Acl $folder $Acl
```

Below #doesnt-work adds user with blank permissions
```powershell
$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule($serviceUser, "FullControl", "Allow")
$Acl.SetAccessRule($Ar)
Set-Acl $folder $Acl
```