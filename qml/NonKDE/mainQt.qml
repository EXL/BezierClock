import QtQuick 2.0
import QtQuick.Window 2.0

import '../'

Window {
    visible: true
    width: 800
    height: 480
    title: qsTr("Bezier Clock")

    Rectangle {
        id: root
        width: parent.width
        height: parent.height
        color: setup.backgroundColor

        BezierSetupQt {
            id: setup
        }

        BezierClock {
            id: bezierClock
            anchors.centerIn: parent
        }
    }
}
