#!/bin/bash
#This script gets artifact version from Jenkins build jobs and puts them in a file ArtifactsVersions.txt, a second file
#toRetry.txt is created, where the failed retrivals (links) are stored for manual search, the same links appear in ArtifactsVersions.txt
#If you get error 'curl: (3) Illegal characters found in URL' is an issue with .txt files, need to do search and replace \r /r on them, replace with nothing
clear
echo "Paste token:"
read token
user=""

STARTTIME=`date +%s`
echo "`date`: Starting the script."

counter=0 #To count how many url are executed, warning: counts empty lines between urls
failed=0 #To count failures


#Putting links to variables
file1=$(cat BuildWebUrlConsole.txt) #No need for links to point to FullLog
file2=$(cat BuildWindowsUrlConsole.txt)

function loop_Urls(){
arr=( "$@" )
#${arr[@]}

	for url in $arr #First Argument passed is links
	do
		
		#Cancel Job         #Started using -k to ignore and certifacte error, after SDF updated certificate		
		curl -k -X POST --user $user:$token $url'lastBuild/stop'
		curl -k -X POST --user $user:$token $url'lastBuild/term' #/stop'
		curl -k -X POST --user $user:$token $url'lastBuild/stop'
		curl -k -X POST --user $user:$token $url'lastBuild/kill'


		let counter++ 

	done #End of for loop

};#End of function

loop_Urls "${file1[@]}" "#####WEB#####" #first paratmer is array/file of links second parameter section name
loop_Urls "${file2[@]}" "#####APP#####"


echo " "
echo '###############'
echo 'Links accessed '$counter
echo 'There were '$failed' failures to retrieve.'
echo '###############'
echo " "


#Time stamp
ENDTIME=`date +%s`
let DURATION=${ENDTIME}-${STARTTIME}
let DURATION=$(( $DURATION / 60 )) #turn into minutes
echo " "
echo "Script took "$DURATION" minutes"

