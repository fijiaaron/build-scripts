#!/usr/bin/env bash
# copy config file to target directory

CONFIG_FILE=/home/ubuntu/test-config.js
WORKING_DIR="."
TARGET_DIR=test/config
TARGET_FILE=override.js

#How can we get the bamboo working directory in the script file?
#Do we need it or is . good enough?
#WORKING_DIR=${bamboo.build.working.directory}

echo "CONFIG_FILE: " $CONFIG_FILE
echo "WORKING_DIR: " $WORKING_DIR
echo "TARGET_DIR: " $TARGET_DIR
echo "TARGET_FILE:" $TARGET_FILE

echo "cp $CONFIG_FILE $WORKING_DIR/$TARGET_DIR/$TARGET_FILE"
cp $CONFIG_FILE $WORKING_DIR/$TARGET_DIR/$TARGET_FILE

echo "ls $WORKING_DIR/$TARGET_DIR"
ls $WORKING_DIR/$TARGET_DIR

