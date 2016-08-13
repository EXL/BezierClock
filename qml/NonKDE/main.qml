import QtQuick 2.0

import '../'

Rectangle {
    id: root
    width: 800
    height: 480
    color: setup.backgroundColor

    BezierSetupQt {
        id: setup
    }

    BezierClock {
        id: bezierClock
        anchors.centerIn: parent
    }
}
