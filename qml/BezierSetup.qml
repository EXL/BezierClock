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

import '../'

Item {
    property int yOff: 0

    property color backgroundColor: settings.backgroundColor
    property real visualScaling: settings.visualScaling
    property real animDurationUser: settings.animDurationUser
    property bool continualAnimation: settings.continualAnimation

    property bool showFps: settings.showFps
    property int frameRate: settings.frameRate

    property color digitColor: settings.digitColor
    property int digitWidth: settings.digitWidth
    property int digitCap: settings.digitCap

    property bool showContinualShadows: settings.showContinualShadows
    property color digitColorShadow: settings.digitColorShadow
    property int digitWidthShadow: settings.digitWidthShadow

    property bool drawControlLines: settings.drawControlLines
    property color linesColor: settings.linesColor
    property color rectColor: settings.rectColor
    property int linesWidth: settings.linesWidth
    property int radius: settings.radius

    property bool showDots: settings.showDots
    property bool blinkDots: settings.blinkDots
    property int radiusDots: settings.radiusDots

    property int animationType: settings.animationType

    // Bool flag for blink dots
    property bool blink: true

    property real digitSize: 480 * visualScaling
    property real digitRelAllWidth: 1900 * visualScaling

    property string imgSource: settings.imgSource
    property int imgFillMode: settings.imgFillMode
    property int wallEnable: settings.wallEnable

    property BezierInit init: _init

    BezierInit {
        id: _init
    }
}
