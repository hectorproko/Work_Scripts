#! /bin/sh
# Script will clone all repos mentioned in repo.txt on your local. This would be mostly one time setup.
# Maintain values in repos.txt accordingly.
# Provide values for br as required.
clear
STARTTIME=`date +%s`
echo "`date`: Starting the script."

d=$(date +'%m.%d.%Y')

#br='TEST'
br='B.R.05092020'
#br='B.R.04042020_Efix2'
#br='master'

echo "Using Branch: $br"
read -p "Press enter to continue"

repo=$(sed -n '1,$p' /Building/repo.txt)
if [ ! -d "/Building/$br" ]; then
mkdir "$br"
fi


for f in $repo; do
	cd /Building/"$br"
	fold="/Building/$br/$f"
	if [ -d $fold ] 
	then
		cd /Building/"$br"/"$f" >> /Building/"$d"_"$br""_Pull".log
#		git reset --hard #Discard the local changes, please commit your changes or stash them before you merge. aborting
		echo "### Message : Starting pull of $f ###" >> /Building/"$d"_"$br""_Pull".log
		git pull origin $br >> /Building/"$d"_"$br""_Pull".log
		echo "Message : Pull of $f completed ###" >> /Building/"$d"_"$br""_Pull".log
		echo " " >> /Building/"$d"_"$br""_Pull".log
		continue
	else
		echo "### Message : $f does not exist. Starting clone of $f ###"
		git clone git@github.COMPANY.com:HIG/"$f".git
		cd /Building/"$br"/"$f" 
		git checkout $br
		echo "#####  $f is cloned and $br checkout completed.  #####"
		echo " "
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
