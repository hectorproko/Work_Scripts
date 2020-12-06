#! /bin/sh
# Script will clone all repos mentioned in repo.txt on your local. This would be mostly one time setup.
# Maintain values in repos.txt accordingly.
# Provide values for br as required.
clear
STARTTIME=`date +%s`
echo "`date`: Starting the script."

d=$(date +'%m.%d.%Y')

br='TEST'
#br='B.R.05092020'
#br='B.R.04042020_Efix2'
#br='master'
application=$1
br=$2
echo "Using Branch: $br"
echo "Application: $application"
read -p "Press enter to continue"

repo=$(sed -n '1,$p' /Building/repo$application.txt)
if [ ! -d "/Building/Application/$application/$br" ]; then
mkdir "/Building/Application/$application/$br"
fi
##################

for f in $repo; do
	cd /Building/Application/$application/"$br"
	fold="/Building/Application/$application/$br/$f"
	if [ -d $fold ] 
	then
		cd /Building/Application/$application/"$br"/"$f" >> /Building/Application/$application/"$d"_"$br""_Pull".log
		echo "### Message : Starting pull of $f ###" >> /Building/Application/$application/"$d"_"$br""_Pull".log
		git pull origin $br >> /Building/Application/$application/"$d"_"$br""_Pull".log
			if [ $? -eq 0 ]; then
				echo "[INFO] SUCCESSFUL $f pull"
			else
				echo "[ERROR] FAILED $f pull"
				rm -fr "/Building/Application/$application/$br/$f" #removing out of sync repo
					if [ $? -eq 0 ]; then
						echo "[INFO] SUCCESSFUL $f removal"
					else
						echo "[ERROR] FAILED $f removal"
					fi #From rm
				git clone -b $br git@github.COMPANY.com:HIG/"$f".git "/Building/Application/$application/$br/$f"
					if [ $? -eq 0 ]; then
						echo "[INFO] SUCCESSFUL $f CLONE"
					else
						echo "[ERROR] FAILED $f CLONE"
					fi #From git clone	
					fi #From pull
		
		echo "Message : Pull of $f completed ###" >> /Building/Application/$application/"$d"_"$br""_Pull".log
		echo " " >> /Building/Application/$application/"$d"_"$br""_Pull".log
		continue
	else
		echo "### Message : $f does not exist. Starting clone of $f ###"
		git clone git@github.COMPANY.com:HIG/"$f".git
		cd /Building/Application/$application/"$br"/"$f" 
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
