read URL
read BRANCH1
read BRANCH2
#!bin/bash
git init
git remote add origin $URL
git fetch
1>logs.txt git diff --name-status $BRANCH1 $BRANCH2
