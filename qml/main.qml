import QtQuick 2.0

Rectangle {
    id: root
    width: 800
    height: 480
    color: setup.backgroundColor

    BezierSettings {
        id: settings
    }

    BezierSetup {
        id: setup
    }

    BezierClock {
        id: bezierClock
        anchors.centerIn: parent
    }
}
