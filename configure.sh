#!/usr/bin/env bash
# copy config file to target directory

# set defaults
WORKING_DIR="."
CONFIG_FILE=/home/ubuntu/config.js
TARGET_DIR=test/config
TARGET_FILE=override.js

# get CONFIG_SOURCE_FILE from the command line
if [ $1 ]; then 
	echo "setting CONFIG_FILE=$1"
	CONFIG_FILE=$1
fi

# get WORKING_DIR from the command line
if [ $2 ]; then
	echo "setting WORKING_DIR=$2"
	WORKING_DIR=$2
fi

# debug output
echo "CONFIG_FILE: " $CONFIG_FILE
echo "WORKING_DIR: " $WORKING_DIR
echo "TARGET_DIR: " $TARGET_DIR
echo "TARGET_FILE:" $TARGET_FILE

# check to make sure the target directory exists
if [ ! -d $WORKING_DIR/$TARGET_DIR ]; then
	echo "target directory does not exist: " $WORKING_DIR/$TARGET_DIR
	exit 1
fi

# do it
echo "cp $CONFIG_FILE $WORKING_DIR/$TARGET_DIR/$TARGET_FILE"
cp $CONFIG_FILE $WORKING_DIR/$TARGET_DIR/$TARGET_FILE

# more output
echo "ls $WORKING_DIR/$TARGET_DIR"
ls $WORKING_DIR/$TARGET_DIR

echo "cat $WORKING_DIR/$TARGET_DIR/$TARGET_FILE"
cat $WORKING_DIR/$TARGET_DIR/$TARGET_FILE
