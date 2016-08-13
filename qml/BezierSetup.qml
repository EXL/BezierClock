import QtQuick 2.0

import org.kde.plasma.core 2.0 // For wallpaper.configuration

Item {
    property int yOff: 0

    property color backgroundColor: wallpaper.configuration.BackgroundColor
    property real visualScaling: wallpaper.configuration.ScalingValue / 10
    property real animDurationUser: wallpaper.configuration.DurationAnim / 100
    property bool continualAnimation: wallpaper.configuration.ContinualAnimation

    property int showFps: wallpaper.configuration.ShowFps
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

    // 1 for Linear
    // 2 for Quadratic
    // 3 for Cubic
    // 4 for Sinuisoidial
    // 5 for No animation
    property int animationType: wallpaper.configuration.AnimationType + 1

    property real digitSize: 480 * visualScaling
    property real digitRelAllWidth: 1900 * visualScaling

    property BezierDigits digits: _digits

    property BezierAnimator hoursTensAnimator: _hoursTensAnimator
    property BezierAnimator hoursUnitsAnimator: _hoursUnitsAnimator
    property BezierAnimator minutesTensAnimator: _minutesTensAnimator
    property BezierAnimator minutesUnitsAnimator: _minutesUnitsAnimator
    property BezierAnimator secondsTensAnimator: _secondsTensAnimator
    property BezierAnimator secondsUnitsAnimator: _secondsUnitsAnimator

    BezierDigits {
        id: _digits
    }

    BezierAnimator { // X0:00:00
        id: _hoursTensAnimator
        origX: 0.0 * visualScaling
        origY: yOff * visualScaling
        animationStartRatio: 35995.0 / (35995.0 + 5.0)
    }

    BezierAnimator { // 0X:00:00
        id: _hoursUnitsAnimator
        origX: 300.0 * visualScaling
        origY: yOff * visualScaling
        animationStartRatio: 3595.0 / (3595.0 + 5.0)
    }

    BezierAnimator { // 00:X0:00
        id: _minutesTensAnimator
        origX: 800.0 * visualScaling
        origY: yOff * visualScaling
        animationStartRatio: 595.0 / (595.0 + 5.0)
    }

    BezierAnimator { // 00:0X:00
        id: _minutesUnitsAnimator
        origX: 1100.0 * visualScaling
        origY: yOff * visualScaling
        animationStartRatio: 55.0 / (55.0 + 5.0)
    }

    BezierAnimator { // 00:00:X0
        id: _secondsTensAnimator
        origX: 1600.0 * visualScaling
        origY: yOff * visualScaling
        animationStartRatio: 5.0 / (5.0 + 5.0)
    }

    BezierAnimator { // 00:00:0X
        id: _secondsUnitsAnimator
        origX: 1900.0 * visualScaling
        origY: yOff * visualScaling
        animationStartRatio: 0.0 / (0.0 + 1.0)
    }
}
