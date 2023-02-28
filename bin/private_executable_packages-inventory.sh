#!/bin/bash

TARGET_DIR=~/downloads
mkdir -p $TARGET_DIR

if command -v dpkg-query &>/dev/null; then
    PACKAGE_FILE=dpkg_packages.txt
    TARGET_FILE=$TARGET_DIR/$PACKAGE_FILE
    echo "dpkg-query found - creating package list."
    sudo dpkg-query -f '${binary:Package}\n' -W >$TARGET_FILE
    echo "Package list created: $TARGET_FILE"
    exit 0
else
    echo "dpkg-query not found!"
    exit 1
fi
