#!/bin/bash

# Name
VERSION=v1.0
PACKAGE_NAME=bezier-clock-$VERSION.tar.xz

# Dirs
CURRENT_DIR=`pwd`
PACKAGE_DIR=$CURRENT_DIR/ru.exlmoto.bezierclock
UI_DIR=$PACKAGE_DIR/contents/ui
ICON_DIR=$PACKAGE_DIR/contents/icon
CONFIG_DIR=$PACKAGE_DIR/contents/config

# Create dirs
mkdir -p $PACKAGE_DIR
mkdir -p $UI_DIR
mkdir -p $ICON_DIR
mkdir -p $CONFIG_DIR

# Copy package files
cp metadata.desktop $PACKAGE_DIR
cp ../qml/{*.qml,*.js} $UI_DIR
cp ../images/BC_icon.png $ICON_DIR
cp ../xml/main.xml $CONFIG_DIR

# Archive files
tar -cJf $PACKAGE_NAME ru.exlmoto.bezierclock

# Clean
rm -Rf $PACKAGE_DIR
