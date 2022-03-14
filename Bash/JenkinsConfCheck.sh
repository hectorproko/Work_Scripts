#!/bin/bash
clear

#Put some color in text
RED='\033[0;31m'
GRE='\033[0;32m'
YE='\033[1;33m'
NC='\033[0m' # No Color

user=$(whoami | sed 's/S//g') #This   sed removed the last character in string

echo "Paste token:"
read token

branch=$1 #parameter option #if you leave it replaces with null, leaving links in .txt broken
	if [ -z "$branch" ]
	then
		printf "\n${YE}Pass a Branch as parameter${NC}\nExiting..\n" #Exiting script before it breaks links
		exit 1
	else
		#echo ""
		printf "\nChecking ${GRE}$branch${NC}"
	fi

log_display () {
	if [ "$3" == 0 ] #If 3th parameter is 0 there is mismatch
	then
		printf "${YE}$1${NC} $2\n"
	else
		printf "${GRE}$1${NC} $2\n"
	fi

	#Writes to file
	#echo $1 $2 >> ConfigCheckResult.txt
}

check () { # parameter what and action
	if [ $? -eq 0 ]; then
		log_display "[INFO] SUCCESSFUL $1 $2"
	else
		log_display "[ERROR] FAILED $1 $2"
	fi #From rm
}

function loop_Urls(){
	#Changing link in file to corresponing branch
	sed -i 's/master/'"${branch}"'/g' $1
    #Putting links to variables
	file=$(cat $1)
	#Putting links back to default master
	sed -i 's/'"${branch}"'/master/g' $1

	
	printf "\nNumber of links in $2 $(echo "$file" | wc -l)\n\n"
		
	for url in $file #First Argument passed is links
	do
		
		repo=$(echo $url | cut -d '/' -f 19)
	    curl -silent -k --user $user:$token -o ConfigPage.txt $url'configure' #this link need to be set for config page
			var=$(grep -i 'https://github.COMPANY.com/HIG' ./ConfigPage.txt | cut -d '/' -f 7 | cut -d '"' -f 1)
				#If var is empty most likely curl failed to download .txt e.g. bad token/credentials
				if [ -z "$var" ]
				then
					error=$(grep "Error" ConfigPage.txt | cut -d '>' -f 2 | cut -d '<' -f 1) #outputting the error
					printf "${RED}[ERROR] ${NC}${YE}$error${NC} \nCheck link: $url \n\n"
				else
					if [ "$branch" == "$var" ] #comparing to see if the expected branch is there
					then
						log_display "Branch:($var)" "Repo: $repo" #var is not empty
					else
						#Does not match, send 3th parameter
						log_display "Branch:($var)" "Repo: $repo" 0 #var is not empty
					fi
				fi
		let counter++ 

	done #End of for loop
	#cleaning
	rm ConfigPage.txt
};#End of function

#We going to pass it the path of file, and web,windows
loop_Urls "./Links/BuildJobs/JenkinsLinksPackages.txt" "MegaPackages" #first paratmer is array/file of links second parameter section name
loop_Urls "./Links/BuildJobs/JenkinsLinksWeb.txt" "Web"
loop_Urls "./Links/BuildJobs/JenkinsLinksWindows.txt" "Windows"
loop_Urls "./Links/BuildJobs/JenkinsLinksScheduled.txt" "Scheduled"

echo " "
echo '###############'
echo 'Links accessed '$counter
echo '###############'
echo " "
