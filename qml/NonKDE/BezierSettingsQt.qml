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
