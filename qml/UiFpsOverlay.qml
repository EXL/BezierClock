/************************************************************************************
** The MIT License (MIT)
**
** Copyright (c) 2016 Serg "EXL" Koles <exlmotodev@gmail.com>
**
** Permission is hereby granted, free of charge, to any person obtaining a copy
** of this software and associated documentation files (the "Software"), to deal
** in the Software without restriction, including without limitation the rights
** to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
** copies of the Software, and to permit persons to whom the Software is
** furnished to do so, subject to the following conditions:
**
** The above copyright notice and this permission notice shall be included in all
** copies or substantial portions of the Software.
**
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
** IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
** FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
** AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
** LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
** OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
** SOFTWARE.
************************************************************************************/

import QtQuick 2.0

UiBaseOverlay {
    visible: setup.showFps

    // FPS Area
    property int framesCount: 0
    property int framesPerSecond: 0
    property int seconds: 0
    property int fps: 0
    property int fpsAverage: 0

    // Fps Timer
    property Timer timer: timerOneSec

    textTo: framesCount + ' Frames in ' + seconds + ' seconds\n' +
            'Current FPS: ' + fps + '\n' +
            'Average FPS: ' + (fpsAverage / ((seconds > 1) ? seconds - 1 : 1)).toFixed(2);

    Timer {
        id: timerOneSec
        interval: 1000 // 1 Second
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
