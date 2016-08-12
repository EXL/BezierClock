import QtQuick 2.0

Item {
    property int yOff: 0

    property real visualScaling: 0.5
    property real animDurationUser: 1.0

    property real digitSize: 480 * visualScaling
    property real digitRelAllWidth: 1900 * visualScaling

    property bool continualAnimation: false
    property bool showContinualShadows: true
    property bool drawControlLines: true

    property color backgroundColor: 'orange'

    property color digitColor: 'yellow'
    property int digitWidth: 10
    property string digitCap: 'round'

    property color digitColorShadow: 'gray'
    property int digitWidthShadow: 3

    property color linesColor: 'red'
    property color rectColor: 'blue'
    property int linesWidth: 1
    property int radius: 3

    // 1 for Linear
    // 2 for Quadratic
    // 3 for Cubic
    // 4 for Sinuisoidial
    // 5 for No animation
    property int animationType: 4

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
