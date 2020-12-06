#! /bin/bash
STARTTIME=`date +%s`
echo "`date`: Starting the script."

br=$1

path="/E/Users/XXXXX/PortableGit/Building"
pullMesg="Nuget Version Update"

echo "Using branch: $br"
read -p "Press enter to continue"

for f in /Building/$br/*/; do
cd $f && git status && git add --all && git commit -m "$pullMesg" && git push origin $br
done


#Time stamp
ENDTIME=`date +%s`
let DURATION=${ENDTIME}-${STARTTIME}
let DURATION=$(( $DURATION / 60 )) #turn into minutes
echo " "
echo "Script took "$DURATION" minutes"
