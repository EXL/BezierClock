import QtQuick 2.0

import org.kde.plasma.core 2.0 // For wallpaper.configuration

Item {
    property int yOff: 0

    property color backgroundColor: wallpaper.configuration.BackgroundColor
    property real visualScaling: wallpaper.configuration.ScalingValue / 10
    property real animDurationUser: wallpaper.configuration.DurationAnim / 100
    property bool continualAnimation: wallpaper.configuration.ContinualAnimation

    property bool showFps: wallpaper.configuration.ShowFps
    property int frameRate: 1000 / wallpaper.configuration.FrameRate

    property color digitColor: wallpaper.configuration.DigitColor
    property int digitWidth: wallpaper.configuration.DigitWidth
    property int digitCap: wallpaper.configuration.DigitCap

    property bool showContinualShadows: wallpaper.configuration.ContinualShadows
    property color digitColorShadow: wallpaper.configuration.ShadowColor
    property int digitWidthShadow: wallpaper.configuration.ShadowWidth

    property bool drawControlLines: wallpaper.configuration.ControlLines
    property color linesColor: wallpaper.configuration.ControlLinesColor
    property color rectColor: wallpaper.configuration.SquaresColor
    property int linesWidth: wallpaper.configuration.LinesWidth
    property int radius: wallpaper.configuration.CirclesRadius

    property bool showDots: wallpaper.configuration.ShowDots
    property bool blinkDots: wallpaper.configuration.BlinkDots
    property int radiusDots: wallpaper.configuration.RadiusDots

    // Bool flag for blink dots
    property bool blink: true

    // 1 for Linear
    // 2 for Quadratic
    // 3 for Cubic
    // 4 for Sinuisoidial
    // 5 for No animation
    property int animationType: wallpaper.configuration.AnimationType + 1

    property real digitSize: 480 * visualScaling
    property real digitRelAllWidth: 1900 * visualScaling

    property BezierInit init: _init

    BezierInit {
        id: _init
    }
}
