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

    // 1 for Linear
    // 2 for Quadratic
    // 3 for Cubic
    // 4 for Sinuisoidial
    // 5 for No animation
    property int animationType: settings.animationType

    // Bool flag for blink dots
    property bool blink: true

    property real digitSize: 480 * visualScaling
    property real digitRelAllWidth: 1900 * visualScaling

    property BezierInit init: _init

    BezierInit {
        id: _init
    }
}
