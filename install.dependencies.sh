WORKING_DIR=.

if [ $1 ]; then
	WORKING_DIR=$1
fi

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

install_dependencies