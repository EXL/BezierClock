import QtQuick 2.0

Item {
    // FPS Area
    property bool showFps: true
    property int framesCount: 0
    property int framesPerSecond: 0
    property int seconds: 0
    property int fps: 0
    property int fpsAverage: 0

    // Fps Timer
    property Timer timer: timerOneSec

    Text {
        id: fpsLabel
        visible: showFps

        text: framesCount + " Frames in " + seconds + " seconds\n" +
              "FPS: " + fps + "\n" +
              "Average FPS: " + (fpsAverage / ((seconds > 1) ? seconds - 1 : 1)).toFixed(2);
    }

    Timer {
        id: timerOneSec
        interval: 1000 // 1 sec
        repeat: true
        triggeredOnStart: true

        onTriggered: {
            if (seconds != 0) {
                fps = framesPerSecond;
                fpsAverage += framesPerSecond;
                framesPerSecond = 0;
            }
            seconds++;
        }
    }
}
