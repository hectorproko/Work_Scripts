

br="TEST"
T_F="false" # For checkmarx
#T_F="true"

push () {
lineMark

git status
git add --all
git commit -m "Jenkinsfile"
git push

lineMark
pwd
}

lineMark () { echo "################################"; }

checkmarx () {

#Used as parameter
value=$1

#Give value manually as you go for each individual repo
# read -p "checkmarx 'true' or 'false' ? " value
# echo "Your input was" ">"$value"<"
# read -p "Press enter to continue"

# #Validating Input
# true="true"
# false="false"
# if [ $value != $true ] || [ $value != $false ] ; then
    # echo "Your input" $value "is invalid."
	# checkmarx
# fi


replace="checkmarx:'$value',"
find . -name 'Jenkinsfile' | xargs sed -i 's/checkmarx.*/'"${replace}"'/g'


}


to_release () {

}


to_snapshot () {

}


editor () {

read -p "Press enter to cd to $1"
cd ./$1
git pull
checkmarx $2 #This only edits check
push


cd ..

}

#Moving inside branch folder
cd "$br"
echo "Inside of: " && pwd


# _dbpassword
# _kofax_service_interop
# _data_collections
# _utils


editor _framework_package $T_F
editor _common $T_F
editor _package $T_F
editor _script_engine_package $T_F
editor _customer_portal_package $T_F
editor _benefit_package $T_F
editor _bulk_closure $T_F


