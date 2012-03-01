function print() {
	INDENT="\t"
	echo -e "$INDENT $1"
}

function configure() {
	print "checking for server configuration"

	SRC_CONFIG_FILE=~/config.js
	CONFIG_DIR="test/config"
	CONFIG_FILE="override.js"

	if [ -d $WORKING_DIR/$CONFIG_DIR ]; then
		print " copying confiuration file"
		cp $SRC_CONFIG_FILE $WORKING_DIR/$CONFIG_DIR/$CONFIG_FILE
		ls $WORKING_DIR/$CONFIG_DIR
	else
		print " no config folder found"
	fi
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

##########

echo "starting test setup"

WORKING_DIR=.

configure
build
install_dependencies

echo "finished test setup"

##########

