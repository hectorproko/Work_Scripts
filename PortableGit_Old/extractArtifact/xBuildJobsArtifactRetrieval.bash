#!/bin/bash
#This script gets artifact version from Jenkins build jobs and puts them in a file ArtifactsVersions.txt, a second file
#toRetry.txt is created, where the failed retrivals (links) are stored for manual search, the same links appear in ArtifactsVersions.txt
#If you get error 'curl: (3) Illegal characters found in URL' is an issue with .txt files, need to do search and replace \r /r on them, replace with nothing

echo "Paste token:"
read token
user=""

STARTTIME=`date +%s`
echo "`date`: Starting the script."
>ArtifactsVersions.txt
>toReTry.txt
>Details.txt
counter=0 #To count how many url are executed, warning: counts empty lines between urls
failed=0 #To count failures


#Putting links to variables
file1=$(cat BuildWebUrlConsole.txt) #No need for links to point to FullLog
file2=$(cat BuildWindowsUrlConsole.txt)

function loop_Urls(){
arr=( "$@" )
#${arr[@]}
echo $2 >> ArtifactsVersions.txt #Second parameter tells weather Web or app

	for url in $arr #First Argument passed is links
	do
	    curl --user $user:$token -o outPutLog.txt $url #this link need to be set for lastsuccesfulbuild, in .txt, here we get date
		buildDate=$(grep -i 'sast-full-start-date' ./outPutLog.txt) #get date build started
		
		test=`date +%s`

		
		url="$url""consoleFull" #concatonates console to url to access full consolelog page, here we get artifact version and branch
		curl --user $user:$token -o outPutLog.txt $url
		
		var=$(grep -i '##### ARTIFACT:' ./outPutLog.txt) #Putting in variable to trim string
		echo $var
		branch=$(grep -i 'buildBranch for' ./outPutLog.txt)
		rm outPutLog.txt
		
		
		
		var=${var#*.}  # retain the part after the first .
		var=${var% *}  # retain the part before the space
			
			if [ -z "$var" ]
				then
					 echo "\$var is empty"
					 echo $url >> ArtifactsVersions.txt
					 echo $url >> toReTry.txt #Putting on the retry 
					 let failed++
				else
					 echo "\$var is NOT empty"
					 echo $var >> ArtifactsVersions.txt
					 
					 echo $var >> Details.txt
					 echo $branch >> Details.txt
					 echo $buildDate >> Details.txt
			fi	
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

counter=0 #Resetting to reflect the retry only
failed=0

file3=$(cat toReTry.txt) # toReTry is generated after web and app have run
loop_Urls "${file3[@]}" "#####ReTry#####"

echo " "
echo '###############'
echo 'Links retried '$counter
echo 'There were '$failed' failures to retrieve.'
echo '###############'

#Time stamp
ENDTIME=`date +%s`
let DURATION=${ENDTIME}-${STARTTIME}
let DURATION=$(( $DURATION / 60 )) #turn into minutes
echo " "
echo "Script took "$DURATION" minutes"



#Ideas
#Trimming of variable/string needs work, to get artifact version
#Try using html instead of .txt avoid tags
#put the links to check manuall append on top or bottom from other
#Have failed links retried
#have link files dowloaded from a repo
#identify branch, confirmation, repo