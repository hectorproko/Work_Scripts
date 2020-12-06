Clear

Set-Alias -Name email -Value E:\WKABDeployScript\PortableGit\BuildTeam\SendEmail.ps1


function Get_DBs($branch) 
{
    #To path
    $sharedPath="\\wvmtwkabfs01\ashok\SQLForBuild"
    $branchFolder="\"+$branch+"_Branch" #Format: Sept_Branch
    $packageTo="\Packages"
    #schemaTo="\Schema"
    $scriptsTo="\Scripts"
    $triggersTo="\Triggers"

    #From path
    #$repoLocation="E:\Users\IN10421S\Source\Repos"
    #$repoName="\database_items_Sept"
    $repoLocation="E:\WKABDeployScript\PortableGit\Database_Items"
    $repoName="\$branch"

    $packgesFrom="\THAADatabase\Release\DBPackages"
    $scriptFrom="\THAADatabase\Release\Scripts"
    $triggersFrom="\THAADatabase\Release\Triggers"

    #Other
    $Max_days = "-1"
    #Max_mins = "-5"
    #e.g.format Wednesday, August 26, 2020 12:00:00 AM #We dont want current time so set setting it to 0
    #Files modified the same regarles of time, will go to that day's folder
    $Curr_date = get-date -Hour 0 -Minute 0 -Second 0 
    $fileCopied = $false
    $dia=Get-Date -Format "MM_dd_yyyy"
    $test=""
    $folderName="\WKB_2019Transistion_COMPANY_$branch"+"_"+"$dia$test"
    #For email
    $message=" "#DBs to be included here `n"
    $To = "Ashok.Miryalkar@COMPANY.com"#Ashok.Miryalkar@COMPANY.com
    $Cc = "GBITAABuildDeploy@COMPANY.com"

        #Checking that branch folder exist, orderwise create it
        If(Test-Path -Path $sharedPath$branchFolder) 
        { 
            "Folder $branchFolder found" 
        } 
        Else 
        { 
            "Folder $branchFolder NOT found"
            ROBOCOPY $sharedPath\BranchFolderTemplate $sharedPath$branchFolder /E #This E copies thing recursively
        }

    #Doing pull on repo
    E:\WKABDeployScript\PortableGit\git-bash.exe E:\WKABDeployScript\PortableGit\BuildTeam\pull.sh $branch

    #Need to give time for pull to finish
    Start-Sleep -s 20

    #Copying the template folder
    ROBOCOPY $sharedPath$branchFolder"\WKB_2019Transistion_COMPANY_" $sharedPath$branchFolder$folderName /E

    
    function Output-SalesTax($from, $destination, $folder) 
    {
        $counter=0

        #Checking date and then copying file from RemotePath to LocalPath
        Foreach($file in (Get-ChildItem $from))
        {
            if($file.LastWriteTime -gt ($Curr_date))
            {
                Copy-Item -Path $file.fullname -Destination $destination
                $counter++
                echo "$counter $folder $file.name"
                #$global:message += echo "$counter $folder $file.name`n" | Out-String
                $global:fileCopied = $true
            }
            ELSE
            {
                #
            }

        }    

    }

    "$folderName"
    #Calling Function 3 times for packages, triggers, scripts
    Output-SalesTax $repoLocation$repoName$packgesFrom $sharedPath$branchFolder$folderName$packageTo "Packages"
    Output-SalesTax $repoLocation$repoName$scriptFrom $sharedPath$branchFolder$folderName$scriptsTo "Scripts"
    Output-SalesTax $repoLocation$repoName$triggersFrom $sharedPath$branchFolder$folderName$triggersTo "Triggers"
    
    #Checking if folder is empty, to rename it, returns true or false
    If([bool](Get-ChildItem -Path "$sharedPath$branchFolder$folderName" -Recurse -File)) 
    { 
        $message += "There are files in $sharedPath$branchFolder$folderName"
        $message += Get-ChildItem -File -Recurse -Path $sharedPath$branchFolder$folderName | Select-Object name | Out-String

        #if you run script more then two times, first time has no dbs, generate nodbs folder, if second time has dbs, need way to get rid
        #of NoDBs folder because now we have some DBs
        Remove-Item -recurse -ErrorAction SilentlyContinue $sharedPath$branchFolder$folderName"_NoDBs"

    } 
    Else 
    {      
        #renaming throws error if folder already exists, leaving empty folder un-renamed
        Remove-Item -recurse -ErrorAction SilentlyContinue $sharedPath$branchFolder$folderName"_NoDBs" #we ignoring errors of folder not existing
        "NO DBs in Folder"
        Rename-Item $sharedPath$branchFolder$folderName $sharedPath$branchFolder$folderName"_NoDBs"
        $message += "NO DBs for $branch"
    }

    #Sending emial
    email "$to" "$Cc" "$branch branch DBs Checked" "$message"


}

#Get_DBs "Oct"
#Get_DBs "Nov"
Get_DBs "Dec"