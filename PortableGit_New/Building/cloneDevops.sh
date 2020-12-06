#! /bin/sh
# Script will clone all repos mentioned in repo.txt on your local. This would be mostly one time setup.
# Maintain values in repos.txt accordingly.
# Provide values for br as required.
STARTTIME=`date +%s`
echo "`date`: Starting the script."


#br="TEST_jan"
br="B.R.04042020"


repo=$(sed -n '1,$p' repo.txt)
if [ ! -d "./$br" ]; then
mkdir "$br"
fi

for f in $repo; do
	cd ./"$br"
	fold="./$br/$f"
	if [ -d $fold ] 
	then
		echo "Message : $f repository already exists. Failed to clone."
		continue
	else
		echo "### Message : Starting clone of $f ###"
		git clone git@github.XXXXXXXXX.com:HIG/"$f".git
		cd /c/git/"$br"/"$f" 
		git checkout $br
		echo "#####  $f is cloned and $br checkout completed.  #####"
		#sleep 60s
		cd ..
	fi
done

#Time stamp
ENDTIME=`date +%s`
let DURATION=${ENDTIME}-${STARTTIME}
let DURATION=$(( $DURATION / 60 )) #turn into minutes
echo " "
echo "Script took "$DURATION" minutes"
