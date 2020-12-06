#!/bin/bash
branch=$1
echo "Doing pull branch $branch"
#cd ./Database_Items/Sept
cd /Database_Items/$branch/
git pull

sleep 5
