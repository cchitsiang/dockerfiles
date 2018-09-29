#!/bin/bash

if [ -d "app" ]; then
    cd app
else
    cd api # Your local git folder
  # Control will enter here if $DIRECTORY exists.
fi


if [[ -n "$1" ]] ; then
	BRANCH=$1
else
	BRANCH=${BRANCH:-dev}
fi

echo $BRANCH

git checkout $BRANCH
git reset --hard origin/$BRANCH
git clean -xf
git pull


# Cannot do here because it blocked bcrypt module which require a lot more dependencies
#npm install

# forever stop index.js
# NODE_ENV=production forever start index.js
echo "#-----------------------------------------------#"
echo "#              Execution Completed              #"
echo "#-----------------------------------------------#"/ #
