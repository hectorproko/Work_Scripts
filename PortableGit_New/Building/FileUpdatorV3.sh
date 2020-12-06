#Version3 #Include --Snapshot as part of search/replace
#Tested with manual imputs works

megaPack=$1 #The mega package
artifact=$2 #The artifact version
release=$3 #false or true
#release=false
#This one add "--snapshot" when need it
#Need to put safety for if $artifact is empty, if is empty, it creates versions="", a second run wont fix, because of extact amount of wild cards for artifact dont exit anymore

#Input Check
#if [[ $artifact != 20???.????.0 ] || [ $artifact != 20???.???.0 ] ]; then echo "Input Error" && exit; fi
########################################
#TESTING################################ Start of input check
#########################################

#Going for specific mega,digit combination
#Only framework has 4 digits on second set
            # if [[ $artifact != 20???.???.0 && $artifact != 20???.????.0 ]]; then #If is neither 3 or 4 digits is error
			   # echo "Input Error Line16" && exit 1
            # else
               # if [[ $artifact = 20???.????.0 && $megaPack != 'WorkabilityFramework' ]]; then echo "Input Error Line18" && exit 1; fi #If we have 4 digits and is not Framework is an error
			   # if [[ $artifact = 20???.???.0 && $megaPack = 'WorkabilityFramework' ]]; then echo "Input Error Line19" && exit 1; fi #If we have 3 digits and it is Framework is an error
            # fi

######################################### End of input check

echo ""
echo 'You are now going to update' $megaPack 'in packages.config with artifcat' $artifact
#read -p "Press enter to continue"

#Snapshot variable will have content weather release or snapshot
if [ "$release" = false ] ; then
	echo "This is SNAPSHOT build"
	snap="--SNAPSHOT"
else
	echo "This is RELEASE build"
	snap=""
fi

case $megaPack in

  WorkabilityFramework ) #Inputs for Frame have 4 digits in second, there for 9dots here
	#find . -type f \( -name "*.csproj" -o -name "*.vbproj" -o -name "packages.config" \) | xargs sed -i 's/--SNAPSHOT//g'     #An extra --SNAPSHOT is being added if snapshot is already there,  this deletes it#Removes snapshot, if it is snpapshot build if wouuld be added, if is release nothing needs to be done
	find . -name packages.config | xargs sed -i 's_id="WorkabilityFramework" version="[0-9.]*\(--SNAPSHOT\)\{0,1\}_id="WorkabilityFramework" version="'"${2}"''"${snap}"'_g'
	find . -type f \( -name "*.csproj" -o -name "*.vbproj" \) | xargs sed -i 's_WorkabilityFramework.20[0-9.]*\(--SNAPSHOT\)\{0,1\}_WorkabilityFramework.'"${2}"''"${snap}"'_g'
	echo "WorkabilityFramework updated with artifact" $artifact
    ;;

  WorkabilityCustomerPortal ) #Inputs have 3 digits in second,
	#find . -type f \( -name "*.csproj" -o -name "*.vbproj" -o -name "packages.config" \) | xargs sed -i 's/--SNAPSHOT//g'
	find . -name packages.config | xargs sed -i 's_id="WorkabilityCustomerPortal" version="[0-9.]*\(--SNAPSHOT\)\{0,1\}_id="WorkabilityCustomerPortal" version="'"${2}"''"${snap}"'_g'
	find . -type f \( -name "*.csproj" -o -name "*.vbproj" \) | xargs sed -i 's_WorkabilityCustomerPortal.20[0-9.]*\(--SNAPSHOT\)\{0,1\}_WorkabilityCustomerPortal.'"${2}"''"${snap}"'_g'
	echo "WorkabilityCustomerPortal updated with artifact" $artifact
    ;;

  Workability ) #Inputs have 3 digits in second,
	#find . -type f \( -name "*.csproj" -o -name "*.vbproj" -o -name "packages.config" \) | xargs sed -i 's/--SNAPSHOT//g'
	find . -name packages.config | xargs sed -i 's_id="Workability" version="[0-9.]*\(--SNAPSHOT\)\{0,1\}_id="Workability" version="'"${2}"''"${snap}"'_g'
	find . -type f \( -name "*.csproj" -o -name "*.vbproj" \) | xargs sed -i 's_Workability.20[0-9.]*\(--SNAPSHOT\)\{0,1\}_Workability.'"${2}"''"${snap}"'_g'
	echo "Workability updated with artifact" $artifact
    ;;

  WKABCommon ) #Inputs have 3 digits in second,
	#find . -type f \( -name "*.csproj" -o -name "*.vbproj" -o -name "packages.config" \) | xargs sed -i 's/--SNAPSHOT//g'
	find . -name packages.config | xargs sed -i 's_id="WKABCommon" version="[0-9.]*\(--SNAPSHOT\)\{0,1\}_id="WKABCommon" version="'"${2}"''"${snap}"'_g'
    find . -type f \( -name "*.csproj" -o -name "*.vbproj" \) | xargs sed -i 's_WKABCommon.20[0-9.]*\(--SNAPSHOT\)\{0,1\}_WKABCommon.'"${2}"''"${snap}"'_g'
	echo "WKABCommon updated with artifact" $artifact
    ;;

  ScriptEngine ) #Inputs have 3 digits in second,
	#find . -type f \( -name "*.csproj" -o -name "*.vbproj" -o -name "packages.config" \) | xargs sed -i 's/--SNAPSHOT//g'
	find . -name packages.config | xargs sed -i 's_id="ScriptEngine" version="[0-9.]*\(--SNAPSHOT\)\{0,1\}_id="ScriptEngine" version="'"${2}"''"${snap}"'_g'
	find . -type f \( -name "*.csproj" -o -name "*.vbproj" \) | xargs sed -i 's_ScriptEngine.20[0-9.]*\(--SNAPSHOT\)\{0,1\}_ScriptEngine.'"${2}"''"${snap}"'_g'
	echo "ScriptEngine updated with artifact" $artifact
    ;;

  BENEFITENGINE ) #Inputs have 3 digits in second,
	#find . -type f \( -name "*.csproj" -o -name "*.vbproj" -o -name "packages.config" \) | xargs sed -i 's/--SNAPSHOT//g'
	find . -name packages.config | xargs sed -i 's_id="BENEFITENGINE" version="[0-9.]*\(--SNAPSHOT\)\{0,1\}_id="BENEFITENGINE" version="'"${2}"''"${snap}"'_g'
    find . -type f \( -name "*.csproj" -o -name "*.vbproj" \) | xargs sed -i 's_BENEFITENGINE.20[0-9.]*\(--SNAPSHOT\)\{0,1\}_BENEFITENGINE.'"${2}"''"${snap}"'_g'
	echo "BENEFITENGINE updated with artifact" $artifact
    ;;

  WkabBulkClosure ) #Inputs have 3 digits in second,
	#find . -type f \( -name "*.csproj" -o -name "*.vbproj" -o -name "packages.config" \) | xargs sed -i 's/--SNAPSHOT//g'
	find . -name packages.config | xargs sed -i 's_id="WkabBulkClosure" version="[0-9.]*\(--SNAPSHOT\)\{0,1\}_id="WkabBulkClosure" version="'"${2}"''"${snap}"'_g'
    find . -type f \( -name "*.csproj" -o -name "*.vbproj" \) | xargs sed -i 's_WkabBulkClosure.20[0-9.]*\(--SNAPSHOT\)\{0,1\}_WkabBulkClosure.'"${2}"''"${snap}"'_g'
	echo "WkabBulkClosure updated with artifact" $artifact
    ;;
	
  WKABDBPasswd ) #Inputs have 3 digits in second,
    #We have not push remove snapshot here
	find . -name packages.config | xargs sed -i 's_id="WKABDBPasswd" version="[0-9.]*\(--SNAPSHOT\)\{0,1\}_id="WKABDBPasswd" version="'"${2}"''"${snap}"'_g'
    find . -type f \( -name "*.csproj" -o -name "*.vbproj" \) | xargs sed -i 's_WKABDBPasswd.20[0-9.]*\(--SNAPSHOT\)\{0,1\}_WKABDBPasswd.'"${2}"''"${snap}"'_g'
	echo "WkabBulkClosure updated with artifact" $artifact
    ;;

  DataCollections ) #Inputs have 3 digits in second,
    #We have not push remove snapshot here
	find . -name packages.config | xargs sed -i 's_id="DataCollections" version="[0-9.]*\(--SNAPSHOT\)\{0,1\}_id="DataCollections" version="'"${2}"''"${snap}"'_g'
    find . -type f \( -name "*.csproj" -o -name "*.vbproj" \) | xargs sed -i 's_DataCollections.20[0-9.]*\(--SNAPSHOT\)\{0,1\}_DataCollections.'"${2}"''"${snap}"'_g'
	echo "WkabBulkClosure updated with artifact" $artifact
    ;;

  Utils ) #Inputs have 3 digits in second,
    #We have not push remove snapshot here
	find . -name packages.config | xargs sed -i 's_id="Utils" version="[0-9.]*\(--SNAPSHOT\)\{0,1\}_id="Utils" version="'"${2}"''"${snap}"'_g'
    find . -type f \( -name "*.csproj" -o -name "*.vbproj" \) | xargs sed -i 'Utils.20[0-9.]*\(--SNAPSHOT\)\{0,1\}Utils.'"${2}"''"${snap}"'_g'
	echo "WkabBulkClosure updated with artifact" $artifact
    ;;
	
  *)
    echo "MegaPackage was not provided"
    ;;
esac

