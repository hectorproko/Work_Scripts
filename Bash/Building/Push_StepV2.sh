#! /bin/bash
STARTTIME=`date +%s`
echo "`date`: Starting the script."

br=$1
path="e:/WKABDeployScript/PortableGit/Building"
pullMesg="Nuget Version Update"

log_display () {
	echo $1 #Displays to console
			#Writes to file
	echo $1 >> /Building/buildLog.txt
}

check () { # parameter what and action
	if [ $? -eq 0 ]; then
		log_display "[INFO] SUCCESSFUL $1 $2"
	else
		log_display "[ERROR] FAILED $1 $2"
	fi #From rm
}

push () {
	git status
	git add --all
	git commit -m "$pullMesg"
	git push origin $br
}

echo "Using branch: $br"
read -p "Press enter to continue"

#cd /Building/$br/ ##&& sh MegaPackMover.sh

#Moving Megas to Temp Folder
# mv /Building/$br/gb_wkab_dbpassword /Building/temp/
# mv /Building/$br/gb_wkab_kofax_service_interop /Building/temp/
# mv /Building/$br/gb_wkab_data_collections Building/temp/
# mv /Building/$br/gb_wkab_utils /Building/temp/
# mv /Building/$br/gb_wkab_framework_package /Building/temp/
# mv /Building/$br/gb_wkab_common /Building/temp/
# mv /Building/$br/gb_wkab_package /Building/temp/
# mv /Building/$br/gb_wkab_script_engine_package /Building/temp/
# mv /Building/$br/gb_wkab_customer_portal_package /Building/temp/
# mv /Building/$br/gb_wkab_benefit_package /Building/temp/
# mv /Building/$br/gb_wkab_bulk_closure /Building/temp/

#mv /Building/TEST/*_package /Building/temp/ #Works if want to save space


for f in /Building/$br/*/; do
	repo=$(echo $f | cut -d '/' -f 4 | sed 's/Building//g') #So buiiding appears as repo removing it
	cd $f #Need to put something here in case repo does not exist
	push #Function
		if [ $? -eq 0 ]; then
			echo "[INFO] SUCCESSFUL $repo PUSH"
		else
			log_display "[ERROR] FAILED $repo PUSH"
			log_display "[INFO] ATTEMPTING: REMOVAL, RE-CLONING, RE-EDITING, RE-PUSHING"
			rm -fr "/Building/$br/$repo" #removing out of sync repo
				if [ $? -eq 0 ]; then
					log_display "[INFO] SUCCESSFUL $repo removal"
				else
					log_display "[ERROR] FAILED $repo removal"
				fi #From rm
			git clone -b $br git@github.XXXXX.com:HIG/"$repo".git "/Building/$br/$repo"
				if [ $? -eq 0 ]; then
					log_display "[INFO] SUCCESSFUL $repo RE-CLONE"
				else
					log_display "[ERROR] FAILED $repo RE-CLONE"
				fi #From git clone
			day=`date +"%m-%d-%y"` #Getting date with format 02-27-07	
			#This where we get the artifacts from file which requires change in format
			cat /Building/$br/MegaArtifacts_$br'_'$day.txt | while read line 
				do
					sh /Building/$br/FileUpdator.sh $line $release
				done
			push # After editing need to push again this is a function
		fi #From push	
done

#Going inside temp/ and moving megas back to br folder
#cd / && cd /Building/temp/
# mv /Building/temp/gb_wkab_dbpassword /Building/$br/
# mv /Building/temp/gb_wkab_kofax_service_interop /Building/$br/
# mv /Building/temp/gb_wkab_data_collections /Building/$br/
# mv /Building/temp/gb_wkab_utils /Building/$br/
# mv /Building/temp/gb_wkab_framework_package /Building/$br/
# mv /Building/temp/gb_wkab_common /Building/$br/
# mv /Building/temp/gb_wkab_package /Building/$br/
# mv /Building/temp/gb_wkab_script_engine_package /Building/$br/
# mv /Building/temp/gb_wkab_customer_portal_package /Building/$br/
# mv /Building/temp/gb_wkab_benefit_package /Building/$br/
# mv /Building/temp/gb_wkab_bulk_closure /Building/$br/

#Cleaning buildLog.txt of empty lines
sed -i '/^$/d' /Building/buildLog.txt

#Time stamp
ENDTIME=`date +%s`
let DURATION=${ENDTIME}-${STARTTIME}
let DURATION=$(( $DURATION / 60 )) #turn into minutes
echo " "
echo "Script took "$DURATION" minutes"
