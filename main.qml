import QtQuick 2.0

Rectangle {
    id: root
    width: 800
    height: 480

    BezierDigits {
        id: digits
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        onClicked: {
            fps.showFps = !fps.showFps;
        }
    }

    BezierCanvas {
        id: canvas
        anchors.fill: parent
    }

    FpsCounter {
        id: fps
        x: 10
        y: 64
    }

    Timer {
        id: timer
        interval: 16 // ~60 FPS (1000/60 = 16) TODO: 17?
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
