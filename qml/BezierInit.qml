import QtQuick 2.0

Item {
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
