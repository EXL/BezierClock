import QtQuick 2.0
import QtQuick.Window 2.0

import '../'

import 'JsMainUiHelper.js' as MainUiHelper
import '../JsCoreFunctions.js' as CoreFunctions

Window {
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
        MainUiHelper.showHelpOverlay();
    }

    Component.onDestruction: {
        MainUiHelper.saveSettings();
    }
}
