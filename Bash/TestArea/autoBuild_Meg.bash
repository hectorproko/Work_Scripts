echo "Paste token:"
read token
#token="1121c04edd11bea8daccec11fb5bf8005e"
user=""

br="B.R.03142020"


STARTTIME=`date +%s`
echo "`date`: Starting the script."

#Framework
urlFrame='https://jenkins02.COMPANY.com/job/GB/job/.............'
#Common
urlCom='https://jenkins02.COMPANY.com/job/GB/job/.............'
#Workability
urlWork='https://jenkins02.COMPANY.com/job/GB/job/.............'
#ScriptEngine
urlScript='https://jenkins02.COMPANY.com/job/GB/job/.............'
#CustomerPortal
urlPortal='https://jenkins02.COMPANY.com/job/GB/job/.............'
#BenefitEngine
urlBene='https://jenkins02.COMPANY.com/job/GB/job/.............'
#Closure
urlClosu='https://jenkins02.COMPANY.com/job/.............'

push () {
lineMark

git status
git add --all
git commit -m "Nuget Version Update"
git push

lineMark
pwd
}

lineMark () { echo "################################"; }
#check () { grep -nir 20.*\-\-SNAPSHOT; }

check () {
lineMark
grep -nir 20.*\-\-SNAPSHOT
lineMark
}

function auto_retrive(){

cd / && cd Building/$br/$3

#Stops the push in Framework
if [ “$2” != “WorkabilityFramework.20” ]; then
    echo "Pushing" && pwd
    lineMark
    push
    lineMark
	echo "Waiting 3 seconds"
    sleep 3
fi

echo "Building" $2 | sed 's/\.20//g'
var=""
#Putting -k to ignore issue with certificate,not trusting
curl -X POST -k --user $user:$token --data-urlencode json='{"parameter": [{"name":"SourcePath", "value":"https://github.COMPANY.com/GB/'$3'/tree/'$br'"}]}' $1'build'
sleep 40

count=0


while [ -z "$var" ] #While Loop Start
do
let count++
echo "is empty" $count

#Putting -k to ignore issue with certificate,not trusting
curl -j --silent -k --user $user:$token -o consoleText.txt $1'lastBuild/consoleText'
var=$(grep -i $2 ./consoleText.txt | head -1 )

var2=$(grep -i 'Finished: ABORTED' ./consoleText.txt )
var3=$(grep -i 'Finished: FAILURE' ./consoleText.txt )
var3=$(grep -i 'Build Status: FAILURE' ./consoleText.txt )
rm consoleText.txt

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

#nupkg=".nupkg'." #easier issue with special chracter, needs to be remove from string
# | sed 's/'"${nupkg}"'//g' #last sed is to remove .nupkg'. something that appears when switching to release in mega packages
#echo $var >> debug.txt
#rm debug.txt

#On the works
FileUpdatorInput=$(echo $var | grep -o "$2.*\..*\.0" | sed 's/\.20/ 20/g') 
#FileUpdatorInput=$(echo $var | grep -o "$2.*\..*\.0" | sed 's/\.20/ 20/g')


echo 'We found' $FileUpdatorInput



day=`date +"%m-%d-%y"` #Getting date with format 02-27-07

#Navigating inside branch folder
cd / && cd Building/$br
echo 'We found' $FileUpdatorInput >> MegaArtifacts_$br'_'$day.txt
echo "Calling FileUpdator from " && pwd

#Commented when is release version
sh FileUpdator.sh $FileUpdatorInput

#Cancel Job
#curl -X POST --user IN10421:$token $1'lastBuild/stop'
#curl -X POST --user IN10421:$token $1'lastBuild/term' #/stop'
#curl -X POST --user IN10421:$token $1'lastBuild/stop'
#curl -X POST --user IN10421:$token $1'lastBuild/kill'

};#End of function

             #JobLink  #WhatToLook             #repo		 
#auto_retrive $urlFrame WorkabilityFramework.20 gb_wkab_framework_package
read -p "Press enter to continue, common"
auto_retrive $urlCom WKABCommon.20 gb_wkab_common
read -p "Press enter to continue, workability"
auto_retrive $urlWork Workability.20 gb_wkab_package
read -p "Press enter to continue, script engine"
auto_retrive $urlScript ScriptEngine.20 gb_wkab_script_engine_package
read -p "Press enter to continue, Customer portal"
auto_retrive $urlPortal WorkabilityCustomerPortal.20 gb_wkab_customer_portal_package
read -p "Press enter to continue, benefit"
auto_retrive $urlBene BENEFITENGINE.20 gb_wkab_benefit_package
read -p "Press enter to continue, closure"
auto_retrive $urlClosu WkabBulkClosure.20 gb_wkab_bulk_closure

#Time stamp
ENDTIME=`date +%s`
let DURATION=${ENDTIME}-${STARTTIME}
let DURATION=$(( $DURATION / 60 )) #turn into minutes
echo " "
echo "Script took "$DURATION" minutes"

#To check branch
#[Sonar] Check buildBranch for branch (JulyEfixBranch) and baseline (null)
