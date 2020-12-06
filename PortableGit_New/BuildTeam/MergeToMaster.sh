#/bin/bash

#############################################################################################################
#INSTRCUTIONS:
#Make sure directory provided in all the variables is already present before running the script.
#Update the repo_list_filename, source_repo_path and dest_repo_path variables value as per your requirement
#############################################################################################################

#Declaration
date_time=`date "+%Y%m%d-%H%M%S"`

branch="B.R.09122020"
application="DQ"

#Staring fresh with new clones
sh /BuildTeam/Pull_Step.sh $application "master"
sh /BuildTeam/Pull_Step.sh $application $branch #THe branch did not exist so it automatically got master and copied master to master


source_repo_path="/Building/Application/$application/master"
dest_repo_path="/Building/Application/$application/$branch"
repo_list_filename="/Building/repo$application.txt"

branch_name=master
logfilename=1

#convert the file in Unix supported encoding
dos2unix.exe $repo_list_filename
	if [ $? -eq 0 ]; then
		echo "Message : File $repo_list_filename converted to Unix format successfully!"
		echo " "
	else
		echo "Message : File $repo_list_filename conversion to Unix format failed, please check!"
		echo " "
		exit 1;
	fi
	
for i in `cat $repo_list_filename`; do 
	repo_name=$i
	echo  "repo_name=$i" >> /Building/Application/$application/$logfilename.csv
	devops_source_repo_path=$source_repo_path/$repo_name
	devops_dest_repo_path=$dest_repo_path/$repo_name

	cd $devops_source_repo_path
		if [ $? -eq 0 ]; then
			echo "Message : Switched to $devops_repo_path repository successfully!"
		else
			echo "Message : Switching to $devops_repo_path repository failed, please check!"
			exit 1;
		fi


	cp -r $devops_dest_repo_path/* .
		if [ $? -eq 0 ]; then
			echo "Message : Copied & Replaced all files and folders from $workspace folder to local $devops_repo_path repository successfully!"
		else
			echo "Message : Failed to copy & replace contents from $workspace folder to local $devops_repo_path repository"
			exit 1;
		fi

	git add --all
		if [ $? -eq 0 ]; then
			echo "Message : All new files & folders has been added successfully into local $devops_repo_path repository!"
		else
			echo "Message : Failed to add new files & folders into local $devops_repo_path repository or nothing to add!"
		fi
		
	git commit --all -m "Merging $branch branch to master"
		if [ $? -eq 0 ]; then
			echo "Message : Committed changes into local $devops_repo_path repository!"
		else
			echo "Message : No changes to commit in local $devops_repo_path repository, exiting the script!"
			echo "No changes to commit!" >> /Building/Application/$application/$logfilename.csv
		fi

	git push origin $branch_name
		if [ $? -eq 0 ]; then
			echo "Message : Changes pushed from local $devops_repo_path repository to remote repository successfully"
			echo "Changes comitted!" >> /Building/Application/$application/$logfilename.csv
		else
			echo "Message : Failed to push changes from local $devops_repo_path repository to remote repository or nothing to push!"
		fi
done;