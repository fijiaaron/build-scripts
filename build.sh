#!/usr/bin/env bash

WORKING_DIR=.

if [ $1 ]; then
	WORKING_DIR=$1
fi

build() {
        echo "checking for build script"

        BUILD_FILE="build"

        if [ -e $WORKING_DIR/$BUILD_FILE ]; then
                echo " build script found"
                if [ -x $WORKING_DIR/$BUILD_FILE ]; then
                        $WORKING_DIR/$BUILD_FILE
                else
                        echo " build script is not executable"
                fi
        else
                echo " no build script found"
        fi
}

build

