#! /bin/sh

#TimeStamp
STARTTIME=`date +%s`
echo "`date`: Starting the script."

from="B.R.11072020"
newBr="B.R.12122020"

repo=$(sed -n '1,$p' repo.txt)

#Start Loop
for f in $repo; do  
                               
	git clone git@github.COMPANY.com:HIG/$f.git ./$f
	cd ./$f
	git checkout $from #fromm
	git checkout -b $newBr #Creation
	git push --set-upstream origin $newBr
	cd ..
	
done #End loop


#Time stamp
ENDTIME=`date +%s`
let DURATION=${ENDTIME}-${STARTTIME}
let DURATION=$(( $DURATION / 60 )) #turn into minutes
echo " "
echo "Script took "$DURATION" minutes"
