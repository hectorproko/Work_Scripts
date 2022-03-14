#! /bin/sh is cloning with https, so push wont work
clear
#This script clones does it job and then deletes eveything afterwards
STARTTIME=`date +%s`
echo "`date`: Starting the script."


repo=$(sed -n '1,$p' repo.txt)

#Never leave this empty, it might delete master, dont think  this is ture
#Dont use variables
#$toDel="NO-SFD-B.R.10122019"

#Start Loop
# for f in $repo; do                                 ##Turns out it is there but explorer does not see it, bash does
                                                   # ##Everytime I speify location says is already there, but dont see the folders
	# #git clone git@github.COMPANY.com:HIG/$f.git ##/e/Users/IN10421S/PortableGit/Building/TestArea/$refBr$newBr/$f
	# echo "scip"
# done #End loop



#Start Loop 
for f in $repo; do 
	echo $f
	#echo 'Number of Branches'

	cd ./$f
	git branch -a | wc -l
	#git branch -a | cat 
	cd ..
	
	#echo "Deleting" $f
    # rm -rf $f #Removing Folder after creation
	
done #End loop 

#Time stamp
ENDTIME=`date +%s`
let DURATION=${ENDTIME}-${STARTTIME}
let DURATION=$(( $DURATION / 60 )) #turn into minutes
echo " "
echo "Script took "$DURATION" minutes"
