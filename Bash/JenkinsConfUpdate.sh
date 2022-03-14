#! /bin/bash

user=$(whoami | sed 's/S//g') #This   sed removed the last character in string

echo "Paste token:"
read token
branch=''
branch=$1

function changeBranch(){

#Changing link in file to corresponing branch
sed -i 's/master/'"${branch}"'/g' $1
#Putting links to variables
file=$(cat $1)
#Putting links back to default master
sed -i 's/'"${branch}"'/master/g' $1
	
printf "\nNumber of links in $2 $(echo "$file" | wc -l)\n\n"
	
	for url in $file #First Argument passed is links
	do

		# Get current config
		curl -X GET -k --user $user:$token $url'config.xml' -o mylocalconfig.xml

		sed -i 's_tree/.*\(</string>\)_tree/'"${branch}"'</string>_g' mylocalconfig.xml 

		# Post updated config
		curl -X POST -k --user $user:$token $url'config.xml' --data-binary "@mylocalconfig.xml"

		#start chrome $url'configure'
	
	done #End of for loop

#Cleaning
rm mylocalconfig.xml
	
};#End of function

changeBranch "./Links/BuildJobs/JenkinsLinksPackages.txt" "MegaPackages"
changeBranch "./Links/BuildJobs/JenkinsLinksWeb.txt" "Web"
changeBranch "./Links/BuildJobs/JenkinsLinksWindows.txt" "Windows"
changeBranch "./Links/BuildJobs/JenkinsLinksScheduled.txt" "Scheduled" 