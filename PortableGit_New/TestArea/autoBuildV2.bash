#! /bin/bash
#Version2

#br='B.R.05092020'
br=$1
release=$2 #true or false

echo "Using Branch: $br"
echo "Release: $release"
echo "Paste token:"
read token

#user=$(whoami) ; user=${user/S} #Gets current user and removes S #this did not work with Priyanak
#user=$(whoami | sed 's/s//g') #This works  with Priyanka but not with me, the S is capital with  me  lowercase with her
user=$(whoami | sed 's/.$//g') #This   sed removed the last character in string

STARTTIME=`date +%s`
echo "`date`: Starting the script."

#Framework
urlFrame='https://jenkins02.COMPANY.com/job/.............'
#Common
urlCom='https://jenkins02.COMPANY.com/job/GB/job/.............'
#Workability
urlWork='https://jenkins02.COMPANY.com/job/GB/job/.............'
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
	if [ $? -eq 0 ]; then # If push fails stops scripts
		echo "Message : SUCCESSFUL $1 PUSH"
	else
		echo "Message : FAILED $1 PUSH"
		echo "Exiting... "
		exit 1;
	fi

lineMark
pwd
}

lineMark () { echo "################################"; }

function auto_retrive(){

cd /Building/$br/$3

#This edits Jenkinsfile to release/snapshot
if [ "$release" = false ] ; then
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

#Stops the push in Framework #Need to disable because of Jenkinsfile editing need to push here as well
# if [ “$2” != “WorkabilityFramework” ]; then
    # echo "Pushing" && pwd
    # lineMark
    # push
    # lineMark
	# echo "Waiting 3 seconds"
    # sleep 3
# fi

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
        echo ""
    else
        echo "Build Aborted, Exiting"
        exit 1
    fi

    if [ -z "$var3" ]
    then
        echo ""
    else
        echo "Build Failed, Exiting"
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
#echo 'We found' $FileUpdatorInput >> MegaArtifacts_$br'_'$(date).txt
echo "Calling FileUpdator from " && pwd

sh FileUpdator.sh $FileUpdatorInput $release
	if [ $? -eq 0 ]; then # If push fails stops scripts
		echo "[INFO] Executing FileUpdator in " && pwd
	else
		echo "[ERROR] FileUpdator missing in folder $br"
		#If FileUpdator.sh is missing, get it from ./Building
		cp /Building/FileUpdatorV3.sh /Building/$br/FileUpdator.sh #We renaming whatever version of FileUpdator by removing V3
			if [ $? -eq 0 ]; then # If push fails stops scripts
				echo "[INFO] Copied FileUpdator to $br"
				sh FileUpdator.sh $FileUpdatorInput $release
			else
				echo "[ERROR] FileUpdator missing in folder /Building"
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

#To check branch
#[Sonar] Check buildBranch for branch (JulyEfixBranch) and baseline (null)
