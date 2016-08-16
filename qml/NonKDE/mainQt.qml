/************************************************************************************
** The MIT License (MIT)
**
** Copyright (c) 2016 Serg "EXL" Koles <exlmotodev@gmail.com>
**
** Permission is hereby granted, free of charge, to any person obtaining a copy
** of this software and associated documentation files (the "Software"), to deal
** in the Software without restriction, including without limitation the rights
** to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
** copies of the Software, and to permit persons to whom the Software is
** furnished to do so, subject to the following conditions:
**
** The above copyright notice and this permission notice shall be included in all
** copies or substantial portions of the Software.
**
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
** IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
** FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
** AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
** LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
** OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
** SOFTWARE.
************************************************************************************/

import QtQuick 2.0
import QtQuick.Window 2.1

import '../'

import 'JsMainUiHelper.js' as MainUiHelper
import '../JsCoreFunctions.js' as CoreFunctions

Window {
    id: rootWindow
    visible: true
    width: 800
    height: 480
    title: qsTr('Bezier Clock')

    BezierSettingsQt {
        id: settings
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if (mouse.button == Qt.RightButton) {
                setup.continualAnimation = !setup.continualAnimation;
                setup.showContinualShadows = false;
                MainUiHelper.showOptionsOverlay(qsTr('Main Settings'), qsTr('Continual Animation'), setup.continualAnimation);
            } else {
                setup.drawControlLines = !setup.drawControlLines;
                MainUiHelper.showOptionsOverlay(qsTr('Control Lines'), qsTr('Show Control Lines'), setup.drawControlLines);
            }
        }
    }

    Rectangle {
        width: parent.width
        height: parent.height
        color: setup.backgroundColor
        focus: true

        BezierSetup {
            id: setup
        }

        BezierClock {
            id: bezierClock
            anchors.centerIn: parent
        }

        UiOptionsOverlay {
            id: overlayHelp
            anchors.centerIn: parent
            animation.duration: 6000 // 6 seconds
        }

        UiOptionsOverlay {
            id: overlayOptions
            anchors.top: bezierClock.top
            anchors.right: bezierClock.right
        }

        Keys.onPressed: {
            MainUiHelper.keyPressed(event);
        }
    }

    Component.onCompleted: {
        settings.fullscreen = false;
        MainUiHelper.showHelpOverlay();
    }

    Component.onDestruction: {
        MainUiHelper.saveSettings();
    }
}
