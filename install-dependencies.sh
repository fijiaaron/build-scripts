#!/usr/bin/env bash
# remove node_modules directory and install all dependencies with `npm install -d`

WORKING_DIR=.

if [ $1 ]; then
	WORKING_DIR=$1
fi

install_dependencies()
{
	echo "install dependencies"

	DEPENDENCY_FILE="package.json"

	if [ -e $WORKING_DIR/node_modules ]; then
		echo " removing existing node_modules directory"
		rm -rf $WORKING_DIR/node_modules
	fi

	if [ -f $WORKING_DIR/$DEPENDENCY_FILE ]; then
		npm install -d
		echo " finished installing dependencies"
	else
		echo " dependency file not found: " $WORKING_DIR/$DEPENDENCY_FILE 
	fi
}

# we do this so NPM CACHE will be unique for each build
# it means more packages need download per build, but should prevent collisions
export HOME=$WORKING_DIR

install_dependencies
