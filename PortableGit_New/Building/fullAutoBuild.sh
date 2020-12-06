#! /bin/sh
#Full build automated by calling all parts
br=$1
release=$2

echo "Using Branch: $br"
echo "Release: $release"

echo "Paste token:"
read token

clear
STARTTIME=`date +%s`
echo "`date`: Starting the script."

check () { # parameter what and action
	if [ $? -eq 0 ]; then
		log_display "[INFO] SUCCESSFUL $1 $2"
	else
		log_display "[ERROR] FAILED $1 $2"
		exit 1
	fi #From rm
}

sh /Building/Pull_Step_Full.sh $br

sh /TestArea/autoBuildV3_Full.bash $br $release $token
	check "build" "run"


sh /Building/Push_StepV3_Full.sh $br


#Time stamp
ENDTIME=`date +%s`
let DURATION=${ENDTIME}-${STARTTIME}
let DURATION=$(( $DURATION / 60 )) #turn into minutes
echo " "
echo "Script took "$DURATION" minutes"