#! /bin/bash
#Put color green matches yellow for donts
#Output to file only when nuget is not the last
clear
STARTTIME=`date +%s`
echo "`date`: Starting the script."

#Put some color in text
RED='\033[0;31m'
GRE='\033[0;32m'
YE='\033[1;33m'
NC='\033[0m' # No Color


#branch='master'
#branch="B.R.10102020"
application=$1
branch=$2
#> /Building/Application/$application/$branch/lastCommit.txt
> /Building/Application/$application/$branch/LastCom_Report.txt

#cd / && cd /Building/Application/$application/$branch/ ##&& sh MegaPackMover.sh
#nugetM="Merging B.R.09122020 branch to master"
nugetM="Nuget Version Update"

#nugetM="nuget version update"

counter=0
for f in /Building/Application/$application/$branch/*/; do
	repo=$(echo "$f" | cut -d '/' -f 6)
	#echo "$f" | cut -d '/' -f 4 >> /Building/Application/$application/$branch/lastCommit.txt
	cd $f && git pull >> /null
	date=$(git log | grep "Date" | head -1)
	#git log | grep "Date" | head -1 >> /Building/Application/$application/$branch/lastCommit.txt
	inTitle=$(git log | grep "    " | head -1 | sed 's/    //g')
	#inTitle=$(echo $inTitle | cut -d ' ' -f 5-7)
	#echo "##$inTitle##"
	#echo "##${inTitle//[[:blank:]]/}##" #remoces all spaces
	#echo "##$nugetM##"
	if [ "$inTitle" == "$nugetM" ] #comparing to see if the expected branch is there
	then
		#echo "$f" | cut -d '/' -f 4
		printf "${GRE}[Good]${NC} $repo\n" #| cut -d '/' -f 4 #cut messes up the color
		printf "${GRE}$inTitle${NC}\n$date\n\n" #log_display "Branch:($var)" "Repo: $repo" #var is not empty
		#echo "#$date#"
		#printf "${GRE}$f${NC}" | cut -d '/' -f 4
	else
		let counter++
		printf "${YE}[$counter][Check]${NC} $repo\n" #| cut -d '/' -f 4 #cut messes up the color
		printf "${YE}$inTitle${NC}\n\n" 
		git log > gitlog.txt
		lineN=$(grep -n -m 1 nuget gitlog.txt | cut -d : -f 1) #line where first Nuget was found
		let "lineN+=1" #Incrementing the line, done want to deleted line where nuget appears
		sed -i ''"${lineN}"',$d' gitlog.txt #Cut/extract eveything before the line
		echo "####-----------####" >> /Building/Application/$application/$branch/LastCom_Report.txt
		echo "$f" | cut -d '/' -f 4 >> /Building/Application/$application/$branch/LastCom_Report.txt
		cat gitlog.txt >> /Building/Application/$application/$branch/lastCommitTest.txt
	fi
	#git log | grep "    " | head -1 >> /Building/Application/$application/$branch/lastCommit.txt
	#After Nuget
done

printf "${YE}[$counter] repo(s) need(s) to be checked${NC}"

#Time stamp
ENDTIME=`date +%s`
let DURATION=${ENDTIME}-${STARTTIME}
let DURATION=$(( $DURATION / 60 )) #turn into minutes
echo " "
echo "Script took "$DURATION" minutes"
