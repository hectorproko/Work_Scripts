#! /bin/bash
STARTTIME=`date +%s`
echo "`date`: Starting the script."

pullMesg="Nuget Version Update"

application=$1
br=$2
echo "Using Branch: $br"
echo "Application: $application"
read -p "Press enter to continue"


for f in /Building/Application/$application/$br/*/; do
cd $f && git status && git add --all && git commit -m "$pullMesg" && git push origin $br
done


#Time stamp
ENDTIME=`date +%s`
let DURATION=${ENDTIME}-${STARTTIME}
let DURATION=$(( $DURATION / 60 )) #turn into minutes
echo " "
echo "Script took "$DURATION" minutes"
