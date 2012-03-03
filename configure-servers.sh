WORKING_DIR=.

CONFIG_SOURCE_DIR="/home/ubuntu"
CONFIG_SOURCE_FILE="test-config.js"
CONFIG_DEST_DIR="test/config"
CONFIG_DEST_FILE="override.js"

function configure() {
	print "checking for server configuration file"

	SOURCE_FILE=$CONFIG_SOURCE_DIR/$CONFIG_SOURCE_FILE
	DEST_DIR=$WORKING_DIR/$CONFIG_DEST_DIR
	DEST_FILE=$DEST_DIR/$CONFIG_DEST_FILE

	if [ ! -f $SOURCE_FILE ]; then
		print " no source config file found at " $SOURCE_FILE
		#exit 1;
	elif [ ! -d $DEST_DIR ]; then
		print " no destination config folder found at " $DEST_DIR
		#exit 1;
	else
		print " copying configuration file " $SOURCE_FILE " to " $DEST_FILE
		cp $SOURCE_FILE $DEST_FILE
	fi
}