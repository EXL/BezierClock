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

import Qt.labs.settings 1.0

Settings {
    // Default settings
    property color backgroundColor: '#FFFFFF'
    property real visualScaling: 3 / 10
    property real animDurationUser: 1
    property bool continualAnimation: false

    property bool showFps: false
    property int frameRate: 1000 / 60

    property color digitColor: '#000000'
    property int digitWidth: 10
    property int digitCap: 1

    property bool showContinualShadows: false
    property color digitColorShadow: '#888888'
    property int digitWidthShadow: 10

    property bool drawControlLines: false
    property color linesColor: '#FF0000'
    property color rectColor: '#0000FF'
    property int linesWidth: 1
    property int radius: 3

    property bool showDots: true
    property bool blinkDots: false
    property int radiusDots: 5

    // 1 for Linear
    // 2 for Quadratic
    // 3 for Cubic
    // 4 for Sinuisoidial
    // 5 for No animation
    property int animationType: 1
}
