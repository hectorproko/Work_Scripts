#!/bin/bash
#This Script pushes to any given repo with a give message

#$1 repo path
#$2 commit message
cd $1
git add --all && git commit -m "$2" && git push

echo $1 $2
