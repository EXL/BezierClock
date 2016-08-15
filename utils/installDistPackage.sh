#!/bin/bash

# Name
VERSION=v1.0
PACKAGE_NAME=bezier-clock-$VERSION.tar.xz

# Dirs
CURRENT_DIR=`pwd`
DEPLOY_DIR=$HOME/.local/share/plasma/wallpapers

# Create dirs
mkdir -p $DEPLOY_DIR

# Unpack package
tar -xJf $PACKAGE_NAME -C $DEPLOY_DIR
