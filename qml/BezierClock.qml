import QtQuick 2.0

Rectangle {
    width: parent.width / 1.187
    height: parent.height / 3.2

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
    }

    Timer {
        id: timer
        interval: 16 // ~60 FPS (1000/60 = 16)
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
