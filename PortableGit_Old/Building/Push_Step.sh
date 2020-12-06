#! /bin/bash
STARTTIME=`date +%s`
echo "`date`: Starting the script."

br='B.R.05092020'
#br="B.R.04042020_Efix2"
#br='B.R.07112020'
path="/E/Users/user/PortableGit/Building"
pullMesg="Nuget Version Update"

echo "Using branch: $br"
read -p "Press enter to continue"

cd / && cd Building/$br/ ##&& sh MegaPackMover.sh

#Moving Megas to Temp Folder
mv ./_dbpassword $path/temp/
mv ./_kofax_service_interop $path/temp/
mv ./_data_collections $path/temp/
mv ./_utils $path/temp/
mv ./_framework_package $path/temp/
mv ./_common $path/temp/
mv ./_package $path/temp/
mv ./_script_engine_package $path/temp/
mv ./_customer_portal_package $path/temp/
mv ./_benefit_package $path/temp/
mv ./_bulk_closure $path/temp/



for f in /Building/$br/*/; do
cd $f && git status && git add --all && git commit -m "$pullMesg" && git push origin $br
done

#Going inside temp/ and moving megas back to br folder
cd / && cd Building/temp/
mv ./_dbpassword $path/$br/
mv ./_kofax_service_interop $path/$br/
mv ./_data_collections $path/$br/
mv ./_utils $path/$br/
mv ./_framework_package $path/$br/
mv ./_common $path/$br/
mv ./_package $path/$br/
mv ./_script_engine_package $path/$br/
mv ./_customer_portal_package $path/$br/
mv ./_benefit_package $path/$br/
mv ./_bulk_closure $path/$br/

#Time stamp
ENDTIME=`date +%s`
let DURATION=${ENDTIME}-${STARTTIME}
let DURATION=$(( $DURATION / 60 )) #turn into minutes
echo " "
echo "Script took "$DURATION" minutes"
