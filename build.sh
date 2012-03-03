WORKING_DIR=.

if [ $1 ]; then
	WORKING_DIR=$1
fi

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

build