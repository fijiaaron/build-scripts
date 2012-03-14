BUILD_SCRIPTS_DIR=~/build-scripts

$BUILD_SCRIPTS_DIR/configure.sh
$BUILD_SCRIPTS_DIR/build.sh
$BUILD_SCRIPTS_DIR/install-dependencies.sh
$BUILD_SCRIPTS_DIR/execute-tests.sh $1

