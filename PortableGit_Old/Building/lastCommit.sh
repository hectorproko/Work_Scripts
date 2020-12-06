#! /bin/bash
STARTTIME=`date +%s`
echo "`date`: Starting the script."

#branch='B.R.03142020'
branch="B.R.05092020"
#branch='master'
> /Building/$branch/lastCommit.txt
#cd / && cd Building/$branch/ ##&& sh MegaPackMover.sh

for f in /Building/$branch/*/; do
echo "$f" | cut -d '/' -f 4
echo "$f" | cut -d '/' -f 4 >> /Building/$branch/lastCommit.txt
cd $f && git pull >> /null
git log | grep "Date" | head -1
git log | grep "Date" | head -1 >> /Building/$branch/lastCommit.txt
git log | grep "    " | head -1
git log | grep "    " | head -1 >> /Building/$branch/lastCommit.txt

done

#Time stamp
ENDTIME=`date +%s`
let DURATION=${ENDTIME}-${STARTTIME}
let DURATION=$(( $DURATION / 60 )) #turn into minutes
echo " "
echo "Script took "$DURATION" minutes"
