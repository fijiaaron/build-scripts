echo "executing tests"

WORKING_DIR=.
TARGET="test"
REPORTER="xunit"

function usage() {

	echo "usage:i test-execute.sh [-trxlp] [target] [reporter]"
	echo "  -t target"
	echo "  -r reporter"
	echo "  -x reporter=xunit"
	echo "  -l reporter=list"
	echo "  -p reporter=tap"
}

# check for command line arguments
while getopts ":t:r:xlph" opt; do
	case $opt in
		t)
			echo "setting TARGET=$OPTARG"
			TARGET=$OPTARG
			shift
			shift
			;;
		r)
			echo "setting REPORTER=$OPTARG"
			REPORTER=$OPTARG
			shift
			shift
			;;
		x)	
			REPORTER="xunit"
			shift
			;;
		l)	
			REPORTER="list"
			shift
			;;
		p)
			REPORTER="tap"
			shift
			;;	
		h)
			usage
			exit 1
			;;
		\?)
			usage
			exit 1
			;;
		:)
			echo "using defaults"
			;;
	esac
done

if [ $1 ]; then
	TARGET=$1
fi

if [ $2 ]; then
	REPORTER=$2
fi


# set file extension for test results
if [ $REPORTER == "xunit" ]; then
	TEST_FILE_EXTENSION=".xml"
elif [ $REPORTER == "tap" ]; then
	TEST_FILE_EXTENSION=".tap"
elif [ $REPORTER == "list" ]; then
	TEST_FILE_EXTENSION=".txt"
fi

# set output file based on TARGET name and REPORTER type
TEST_OUTPUT_FOLDER=$WORKING_DIR/test-results
TEST_OUTPUT_FILE="$TARGET-tests$TEST_FILE_EXTENSION"
TEST_RESULTS=$TEST_OUTPUT_FOLDER/$TEST_OUTPUT_FILE

echo "TARGET: " $TARGET
echo "REPORTER: " $REPORTER
echo "WORKING_DIR: " $WORKING_DIR
echo "TEST_OUTPUT_FOLDER: " $TEST_OUTPUT_FOLDER
echo "TEST_OUTPUT_FILE: " $TEST_OUTPUT_FILE

# remove old test results
if [ -e $TEST_OUTPUT_FOLDER ]; then
	rm -rf $TEST_OUTPUT_FOLDER
fi
mkdir $TEST_OUTPUT_FOLDER

#wrap output in XML to catch errors and stdout
echo "<testsuites>" > $TEST_RESULTS
make -k -s $TARGET REPORTER=$REPORTER | tee -a $TEST_RESULTS
echo "</testsuites>" >> $TEST_RESULTS

if [ -f $TEST_RESULTS ]; then

	echo "TEST_RESULTS: " $TEST_RESULTS
else
	echo "no test results"
fi

echo "finished executing tests"

