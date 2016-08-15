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
        renderDots: true
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
        renderDots: true
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
