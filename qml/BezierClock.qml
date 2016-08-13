import QtQuick 2.0

Rectangle {
    width: parent.width / 1.187
    height: parent.height / 3.2

    BezierCanvas {
        id: canvas
        anchors.fill: parent
    }

    UiFpsOverlay {
        id: fps
    }

    Timer {
        id: timer
        interval: setup.frameRate
        repeat: true
        triggeredOnStart: true

        onTriggered: {
            fps.framesCount++;
            fps.framesPerSecond++;

            canvas.requestPaint();
        }
    }

    Component.onCompleted: {
        timer.start();
        fps.timer.start();
    }
}
