#! /bin/bash

#To do
#Calle pull_step regardles of wether it exist or not, in case pull fails
#dont delete branch if creation of new one is not succesul
clear
STARTTIME=`date +%s`
echo "`date`: Starting the script."

#Put some color in text
RED='\033[0;31m'
GRE='\033[0;32m'
YE='\033[1;33m'
NC='\033[0m' # No Color


#branch='master'
oldName_branch="TEST"
newName_branch="TEST2"
counter=0


check () { # parameter what and action
	if [ $? -eq 0 ]; then
		#log_display "[INFO] SUCCESSFUL $1 $2"
		printf "${GRE}[INFO] SUCCESSFUL $1 $2${NC} \n"
	else
		#log_display "[ERROR] FAILED $1 $2"
		printf "${YE}[ERROR] FAILED $1 $2${NC} \n"
	fi #From rm
}

#If branch folder doesnt exist call Pull_Step.sh to create and clone repos.
# if [ ! -d "/Building/$oldName_branch" ]; then
	# echo "$oldName_branch  does not exist, calling Pull_Step script"
	# read -p "Press enter to continue"
	# sh /Building/Pull_Step.sh $oldName_branch
# fi

#Decided to always call Pull_Step because it can reclone if pull doesnt work
sh /Building/Pull_Step.sh $oldName_branch

for f in /Building/$oldName_branch/*/; do
	let counter++
	repo=$(echo "$f" | cut -d '/' -f 4)
	cd $f 
	git pull >> /null
	git branch -m $oldName_branch $newName_branch    # Rename branch locally    
		if [ $? -eq 0 ]; then
			#echo "[INFO] SUCCESSFUL rename in $repo"
			printf "${GRE}[$counter][INFO] SUCCESSFUL rename in $repo${NC} \n"
			git push origin :$oldName_branch                 # Delete the old branch    
				check "[Deletion] of Old Branch $oldName_branch  in repo $repo"
			git push --set-upstream origin $newName_branch   # Push the new branch, set local branch to track the new remote
				check "[Push] of New branch $newName_branch in repo $repo \n\n" 
		else
			printf "${YE}[ERROR] FAILED to rename $oldName_branch to $newName_branch in $repo${NC} \n"
		fi #From git clone
done

#Rename Folder to new branch name
mv /Building/$oldName_branch /Building/$newName_branch
	check 
#printf "${YE}[$counter] repo(s) need(s) to be checked${NC}"

#Time stamp
ENDTIME=`date +%s`
let DURATION=${ENDTIME}-${STARTTIME}
let DURATION=$(( $DURATION / 60 )) #turn into minutes
echo " "
echo "Script took "$DURATION" minutes"
