WORKING_DIR=.

CONFIG_SOURCE_DIR="/home/ubuntu"
CONFIG_SOURCE_FILE="config.js"
CONFIG_DEST_DIR="test/config"
CONFIG_DEST_FILE="override.js"

function print() {
	INDENT="\t"
	echo -e "$INDENT $1"
}

function configure() {
	print "checking for configuration file"

	SOURCE_FILE=$CONFIG_SOURCE_DIR/$CONFIG_SOURCE_FILE
	DEST_DIR=$WORKING_DIR/$CONFIG_DEST_DIR
	DEST_FILE=$DEST_DIR/$CONFIG_DEST_FILE

	print " WORKING_DIR: " $WORKING_DIR
	print " SOURCE_FILE: " $SOURCE_FILE
	print " DEST_FILE:" $DEST_FILE

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

	print " config file: "
	cat $DEST_FILE
}

function build() {
	print "checking for build script"

	BUILD_FILE="build"

	if [ -e $WORKING_DIR/$BUILD_FILE ]; then
		print " build script found"
		if [ -x $WORKING_DIR/$BUILD_FILE ]; then
			$WORKING_DIR/$BUILD_FILE
		else
			print " build script is not executable"
		fi
	else
		print " no build script found"
	fi
}

function install_dependencies()
{
	echo "install dependencies"
	
	DEPENDENCY_FILE="package.json"

	if [ -e $WORKING_DIR/node_modules ]; then
		print " removing existing node_modules directory"
		rm -rf $WORKING_DIR/node_moules
	fi

	if [ -f $WORKING_DIR/$DEPENDENCY_FILE ]; then
		npm install -d
		print " finished installing dependencies"
	else
		print " no dependency file found"
	fi
}
