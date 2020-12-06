#! /bin/bash
#Version 3
#When Push fails, it reclones, re-edits and pushes
#Make sure it re-edits jenkinsfile as well
#Used function for logging

br=$1
release=$2 #true or false
token=$3

log_display () {
	echo $1 #Displays to console
			#Writes to file
	echo $1 >> /Building/buildLog.txt
}

user=$(whoami | sed 's/.$//g') #This   sed removed the last character in string

log_display $(lineMark)
log_display $user
log_display "Using Branch: $br"
log_display "Release: $release"


STARTTIME=`date +%s`
log_display "`date`: Starting the script."

#Framework
urlFrame='https://jenkins02.COMPANY.com/job/.............'
#Common
urlCom='https://jenkins02.COMPANY.com/job/.............'
#Workability
urlWork='https://jenkins02.COMPANY.com/job/.............'
#ScriptEngine
urlScript='https://jenkins02.COMPANY.com/job/.............'
#CustomerPortal
urlPortal='https://jenkins02.COMPANY.com/job/.............'
#BenefitEngine
urlBene='https://jenkins02.COMPANY.com/job/.............'
#Closure
urlClosu='https://jenkins02.COMPANY.com/job/.............'


push () {
lineMark

git status
git add --all
git commit -m "Nuget Version Update Release:$release"
git push	
	if [ $? -eq 0 ]; then
		log_display "[INFO] SUCCESSFUL $1 PUSH"
	else
		log_display "[ERROR] FAILED $1 PUSH"
		log_display "[INFO] ATTEMPTING: REMOVAL, RE-CLONING, RE-EDITING, RE-PUSHING"
		rm -fr "/Building/$br/$1" #removing out of sync repo
			if [ $? -eq 0 ]; then
				log_display "[INFO] SUCCESSFUL $1 removal"
			else
				log_display "[ERROR] FAILED $1 removal"
			fi #From rm
		git clone -b $br git@github.COMPANY.com:HIG/"$1".git "/Building/$br/$1"
			if [ $? -eq 0 ]; then
				log_display "[INFO] SUCCESSFUL $1 RE-CLONE"
			else
				log_display "[ERROR] FAILED $1 RE-CLONE"
			fi #From git clone
			
		#This where we get the artifacts from file which requires change in format
		cat /Building/$br/MegaArtifacts_$br'_'$day.txt | while read line 
			do
				sh /Building/$br/FileUpdator.sh $line $release
				jenkinsfile_edit $release
			done
		push # After editing need to push again
	fi #From push
lineMark
pwd
}

lineMark () { echo "################################"; }

jenkinsfile_edit () { #Seem like when someone edits it manually might screw up scripts search
#This edits Jenkinsfile to release/snapshot
#We pass it $release boolans as parameter 1
if [ "$1" = false ] ; then
	echo "This is SNAPSHOT build"
	#Enabling artifactVersion in Jenkinsfile
	find . -name Jenkinsfile | xargs sed -i 's_// artifactVersion_   artifactVersion_g'
	find . -name Jenkinsfile | xargs sed -i 's_.*configuration_         // configuration_g'
else
	echo "This is RELEASE build"
	#Enable release configuration in Jenkinsfile
	find . -name Jenkinsfile | xargs sed -i 's_// configuration_   configuration_g'
	find . -name Jenkinsfile | xargs sed -i 's_.*artifactVersion_         // artifactVersion_g'
fi
}

function auto_retrive(){

cd /Building/$br/$3 #If the repo does not exist this will clone it and change it to the needed branch
	if [ $? -eq 0 ]; then
		log_display "[INFO] SUCCESSFUL $3 CD"
	else
		log_display "[ERROR] FAILED $3 CD"
		git clone -b $br git@github.COMPANY.com:HIG/"$3".git "/Building/$br/$3"
	fi #From cd
cd /Building/$br/$3

jenkinsfile_edit $release #Calling function

#Pushing all repos
lineMark
push $3 #we would push with a parameter for the message
lineMark

echo "Building" $2 | sed 's/\.20//g' #removing the .20
var=""
#Putting -k to ignore issue with certificate,not trusting
curl -X POST -k --user $user:$token --data-urlencode json='{"parameter": [{"name":"SourcePath", "value":"https://github.COMPANY.com/GB/'$3'/tree/'$br'"}]}' $1'build'
sleep 40

count=0
while [ -z "$artifact" ] #While Loop Start
do
let count++
echo "is empty" $count

#Putting -k to ignore issue with certificate,not trusting
curl -j --silent -k --user $user:$token -o consoleText.txt $1'lastBuild/consoleText'

#There are two strings found in this search
artifact=$(grep -i "Build Status" ./consoleText.txt | head -1 | cut -d ' ' -f 9) 


var2=$(grep -i 'Finished: ABORTED' ./consoleText.txt )
var3=$(grep -i 'Finished: FAILURE' ./consoleText.txt )
var3=$(grep -i 'Build Status: FAILURE' ./consoleText.txt )
rm consoleText.txt
	#Exits script if build fails or is aborted
    if [ -z "$var2" ]
        then
        log_display ""
    else
        log_display "Build Aborted, Exiting"
        exit 1
    fi

    if [ -z "$var3" ]
    then
        log_display ""
    else
        log_display "Build Failed, Exiting"
        exit 1
    fi

sleep 10
done #While Loop End


#Removing -SNAPSHOT
#FileUpdatorInput=$(echo $2 $artifact)
FileUpdatorInput=$(echo $2 $artifact | sed 's/-SNAPSHOT//g') #This added issue "We found WorkabilityFramework.20 20064.1203.0"
#Cleaning after having issues with framework artifact appear on all
artifact=""

echo 'We found' $FileUpdatorInput


day=`date +"%m-%d-%y"` #Getting date with format 02-27-07

#Navigating inside branch folder
cd / && cd Building/$br
echo $FileUpdatorInput >> MegaArtifacts_$br'_'$day.txt

echo "Calling FileUpdator from " && pwd

sh FileUpdator.sh $FileUpdatorInput $release
	if [ $? -eq 0 ]; then # If push fails stops scripts
		echo "[INFO] Executing FileUpdator in " && pwd
	else
		log_display "[ERROR] FileUpdator missing in folder $br"
		#If FileUpdator.sh is missing, get it from ./Building
		cp /Building/FileUpdatorV3.sh /Building/$br/FileUpdator.sh #We renaming whatever version of FileUpdator by removing V3
			if [ $? -eq 0 ]; then # If push fails stops scripts
				log_display "[INFO] Copied FileUpdator to $br"
				sh FileUpdator.sh $FileUpdatorInput $release
			else
				log_display "[ERROR] FileUpdator missing in folder /Building"
			fi #End if, for copying fileupdator
	fi #End if, executing fileupdator

};#End of function

             #JobLink  #WhatToLook             #repo		 
auto_retrive $urlFrame WorkabilityFramework gb_wkab_framework_package
#read -p "Press enter to continue, common"
auto_retrive $urlCom WKABCommon gb_wkab_common
#read -p "Press enter to continue, workability"
auto_retrive $urlWork Workability gb_wkab_package #Not Putting snapshot
#read -p "Press enter to continue, script engine"
auto_retrive $urlScript ScriptEngine gb_wkab_script_engine_package
#read -p "Press enter to continue, Customer portal"
auto_retrive $urlPortal WorkabilityCustomerPortal gb_wkab_customer_portal_package
#read -p "Press enter to continue, benefit"
auto_retrive $urlBene BENEFITENGINE gb_wkab_benefit_package
#read -p "Press enter to continue, closure"
auto_retrive $urlClosu WkabBulkClosure gb_wkab_bulk_closure

#Time stamp
ENDTIME=`date +%s`
let DURATION=${ENDTIME}-${STARTTIME}
let DURATION=$(( $DURATION / 60 )) #turn into minutes
echo " "
echo "Script took "$DURATION" minutes"


sh /Building/Push_StepV3_Full.sh $br $token
