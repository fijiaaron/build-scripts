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

install_dependencies
