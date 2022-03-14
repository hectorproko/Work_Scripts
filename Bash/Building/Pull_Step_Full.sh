#! /bin/sh
# Script will clone all repos mentioned in repo.txt on your local. This would be mostly one time setup.
# Maintain values in repos.txt accordingly.
# Provide values for br as required.
clear
STARTTIME=`date +%s`
echo "`date`: Starting the script."

d=$(date +'%m.%d.%Y')

br=$1
release=$2
#If br and release are empty exit script?

echo "Using Branch: $br"
echo "Release: $release"
echo "Paste token:"
read token

repo=$(sed -n '1,$p' /Building/repo.txt)
if [ ! -d "/Building/$br" ]; then
mkdir "/Building/$br"
fi


for f in $repo; do
	cd /Building/"$br"
	fold="/Building/$br/$f"
	if [ -d $fold ] 
	then
		cd /Building/"$br"/"$f" >> /Building/"$d"_"$br""_Pull".log
		echo "### Message : Starting pull of $f ###" >> /Building/"$d"_"$br""_Pull".log
		git pull origin $br >> /Building/"$d"_"$br""_Pull".log
			if [ $? -eq 0 ]; then
				echo "[INFO] SUCCESSFUL $f pull"
			else
				echo "[ERROR] FAILED $f pull"
				rm -fr "/Building/$br/$f" #removing out of sync repo
					if [ $? -eq 0 ]; then
						echo "[INFO] SUCCESSFUL $f removal"
					else
						echo "[ERROR] FAILED $f removal"
					fi #From rm
				git clone -b $br git@github.XXXXX.com:HIG/"$f".git "/Building/$br/$f"
					if [ $? -eq 0 ]; then
						echo "[INFO] SUCCESSFUL $f CLONE"
					else
						echo "[ERROR] FAILED $f CLONE"
					fi #From git clone	
					fi #From pull
		
		echo "Message : Pull of $f completed ###" >> /Building/"$d"_"$br""_Pull".log
		echo " " >> /Building/"$d"_"$br""_Pull".log
		continue
	else
		echo "### Message : $f does not exist. Starting clone of $f ###"
		git clone git@github.XXXXX.com:HIG/"$f".git
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

#Calling scriptsh
sh /TestArea/autoBuildV3_Full.bash $br $release $token
