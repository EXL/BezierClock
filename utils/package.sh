#!/bin/bash
#######################################################################################
## The MIT License (MIT)
##
## Copyright (c) 2016 Serg "EXL" Koles <exlmotodev@gmail.com>
##
## Permission is hereby granted, free of charge, to any person obtaining a copy
## of this software and associated documentation files (the "Software"), to deal
## in the Software without restriction, including without limitation the rights
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
## copies of the Software, and to permit persons to whom the Software is
## furnished to do so, subject to the following conditions:
##
## The above copyright notice and this permission notice shall be included in all
## copies or substantial portions of the Software.
##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
## SOFTWARE.
#######################################################################################

# Name
VERSION="v1.1"
PACKAGE_NAME=bezier-clock-$VERSION.tar.xz

# Dirs
CURRENT_DIR="`pwd`"
PACKAGE_DIR="$CURRENT_DIR/ru.exlmoto.bezierclock"
UI_DIR="$PACKAGE_DIR/contents/ui"
ICON_DIR="$PACKAGE_DIR/contents/icon"
CONFIG_DIR="$PACKAGE_DIR/contents/config"
DEPLOY_DIR="$HOME/.local/share/plasma/wallpapers"
APP_DIR="$DEPLOY_DIR/ru.exlmoto.bezierclock"

func_package() {
    # Create dirs
    echo -n "Prepare directory $PACKAGE_DIR for package app..."
    mkdir -p $PACKAGE_DIR
    mkdir -p $UI_DIR
    mkdir -p $ICON_DIR
    mkdir -p $CONFIG_DIR

    # Copy package files
    cp *.desktop $PACKAGE_DIR
    cp ../qml/{*.qml,*.js} $UI_DIR
    cp ../images/BC_icon.png $ICON_DIR
    cp ../xml/main.xml $CONFIG_DIR
    echo "done."

    # Archive files
    echo -n "Package files to $PACKAGE_NAME..."
    tar -cJf $PACKAGE_NAME ru.exlmoto.bezierclock
    echo "done."

    # Clean
    echo -n "Cleaning $PACKAGE_DIR..."
    rm -Rf $PACKAGE_DIR
    echo "done."
}

func_install() {
    if [ ! -f ${PACKAGE_NAME} ]; then
        echo "$PACKAGE_NAME not found! Create package first with ./package.sh -p" ;
        exit 1
    else
        if [ -d $APP_DIR ]; then
            echo "$PACKAGE_NAME already installed! Remove package first with ./package.sh -u" ;
            exit 1
        else
            # Create dirs
            mkdir -p $DEPLOY_DIR

            # Unpack package
            echo -n "Install package to $DEPLOY_DIR..."
            tar -xJf $PACKAGE_NAME -C $DEPLOY_DIR
            echo "done."
        fi
    fi
}

func_uninstall() {
    # Delete Package
    if [ -d $APP_DIR ]; then
        echo -n "Deleting $APP_DIR..."
        rm -Rf $APP_DIR
        echo "done."
    else
        echo "Package $PACKAGE_NAME already uninstalled."
    fi
}

func_usage() {
    echo -e "\nUsage ./package.sh for install package or ./package.sh <argument> for options:\n"
    echo -e "\t -i or --install\tfor create package and install it to $DEPLOY_DIR;"
    echo -e "\t -p or --package\tfor create TAR.XZ-package;"
    echo -e "\t -u or --uninstall\tfor uninstall package (removing $APP_DIR directory);"
    echo -e "\t -c or --clean\t\tfor remove package from current directory;"
    echo -e "\t -h or --help\t\tfor this help.\n"
}

func_clean() {
    if [ -f ${PACKAGE_NAME} ]; then
        echo -n "Deleting $PACKAGE_NAME..."
        rm $PACKAGE_NAME
        echo "done."
    else
        echo "$PACKAGE_NAME already deleted."
    fi
}

if test $# -ne 0; then
    case "$1" in
        "") func_usage ;;
        "-i"|"--install") func_install ;;
        "-p"|"--package") func_clean ; func_package ;;
        "-u"|"--uninstall") func_uninstall ;;
        "-c"|"--clean") func_clean ;;
        "-h"|"--help") func_usage ;;
        *) func_usage ;;
    esac
    shift
else
    func_install ;
    exit 1
fi
