import QtQuick 2.0

Rectangle {
    width: 2300 * setup.visualScaling
    height: 600 * setup.visualScaling

    BezierCanvas {
        id: canvas
        anchors.fill: parent
    }

    UiFpsOverlay {
        id: fps
    }

    // Main Timer
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
