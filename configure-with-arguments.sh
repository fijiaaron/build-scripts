#!/usr/bin/env bash
# copy config file to target directory

CONFIG_FILE="/home/ubuntu/test-config.js"
WORKING_DIR="."
TARGET_DIR="test/config"
TARGET_FILE="override.js"

#How can we get the bamboo working directory in the script file?
#Do we need it or is . good enough?
#if [ "${bamboo.build.working.directory}" ]; then
#	WORKING_DIR=${bamboo.build.working.directory}
#fi

usage() {
	echo "test-config.sh [-c CONFIG_FILE] [-f TARGET_FILE] [-d TARGET_DIR] [-w WORKING_DIR]"
}

set_config_file() {
	NEW_CONFIG_FILE=$1
	if [ $NEW_CONFIG_FILE ]; then
		if [ -f $NEW_CONFIG_FILE ]; then
			echo "setting CONFIG_FILE=$NEW_CONFIG_FILE"
			CONFIG_FILE=$NEW_CONFIG_FILE
		else
			echo "Argument '$NEW_CONFIG_FILE' is not a valid CONFIG_FILE"
			exit 1
		fi
	fi
}

set_target_file() {
	NEW_TARGET_FILE=$1
	if [ $NEW_TARGET_FILE ]; then
		echo "setting TARGET_FILE-$NEW_TARGET_FILE"
		TARGET_FILE=$NEW_TARGET_FILE
	fi
}

set_target_dir() {
	NEW_TARGET_DIR=$1
	if [ $NEW_TARGET_DIR ]; then
		echo "setting TARGET_DIR=$NEW_TARGET_DIR"
		TARGET_DIR=$NEW_TARGET_DIR
	fi	
}

set_working_dir() {
	NEW_WORKING_DIR=$1
	if [ $NEW_WORKING_DIR ]; then
		if [ -d $NEW_WORKING_DIR ]; then
			echo "setting WORKING_DIR=$NEW_WORKING_DIR"
			WORKING_DIR=$NEW_WORKING_DIR
		else
			echo "Argument '$NEW_WORKING_DIR' is not a valid WORKING_DIR"
			exit 1
		fi
	fi
}

set_options() {
	while getopts ":c:f:d:w:" opt; do
	case $opt in 
		c)
			set_config_file $OPTARG
			;;
		f)
			set_target_file $OPTARG
			;;
		d)
			set_target_dir $OPTARG
			;;
		w)
			set_working_dir $OPTARG
			;;
		\?)
			usage
			exit 1
			;;
		:)
			echo "$OPTARG requires a parameters"
			exit 1
			;;
	esac
	done	
}

set_options $@

shift $OPTIND 
echo "optind: "  $OPTIND
echo "args: " $#

set_config_file $1
set_target_file $2
set_target_dir  $3
set_working_dir $4

if [ ! -d $WORKING_DIR/$TARGET_DIR ]; then
	mkdir $WORKING_DIR/$TARGET_DIR
	echo "created directory $WORKING_DIR/$TARGET_DIR"
	# this will still fail if the parent directory does not exist
fi

echo "CONFIG_FILE: " $CONFIG_FILE
echo "TARGET_FILE:" $TARGET_FILE
echo "TARGET_DIR: " $TARGET_DIR
echo "WORKING_DIR: " $WORKING_DIR

#####
#This is the actual script - yeah, its a one liner stretched over 100+
#####

echo "cp $CONFIG_FILE $WORKING_DIR/$TARGET_DIR/$TARGET_FILE"
cp $CONFIG_FILE $WORKING_DIR/$TARGET_DIR/$TARGET_FILE

echo "ls $WORKING_DIR/$TARGET_DIR"
ls $WORKING_DIR/$TARGET_DIR
