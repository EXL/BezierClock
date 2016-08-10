import QtQuick 2.0

Rectangle {
    width: 800
    height: 480

    FpsCounter {
        id: fps
        anchors.fill: parent
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            fps.showFps = !fps.showFps;
        }
    }

    Timer {
        id: timer
        interval: 16 // ~60 FPS (1000/60) TODO: 17?
        repeat: true
        triggeredOnStart: true

        onTriggered: {
            fps.framesCount++;
            fps.framesPerSecond++;
        }
    }

    Component.onCompleted: {
        timer.start();
        fps.timer.start();
    }
}
