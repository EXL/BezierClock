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
import QtQml 2.0 // for new Date()

import 'JsCoreFunctions.js' as CoreFunctions
import 'JsCanvasFunctions.js' as CanvasFunctions

Canvas {
    id: canvas

    property date currentDate
    property int currentSec

    onPaint: {
        var context2d = getContext('2d');
        render(context2d);
    }

    function render(context) {
        context.save();

        // Fill Background
        if (setup.wallEnable) {
            context.clearRect(0, 0, canvas.width, canvas.height);
        } else {
            CanvasFunctions.fillCanvasByColor(context, setup.backgroundColor);
        }

        // Translate Context
        CanvasFunctions.translateContex(context);

        // Render Seconds
        currentDate = new Date();
        var millis = currentDate.getMilliseconds();
        var secondTotal = currentDate.getSeconds();
        var secondsUnit = secondTotal % 10;
        var secondsTen = (secondTotal % 100 - secondTotal % 10) / 10;
        var secondsUnitRatio = millis / 1000.0;
        var secondsTenRatio = (secondsUnit * 1000 + millis) / 10000.0;
        setup.init.secondsUnitsAnimator.animationStartRatio = CoreFunctions.getAnimStartRatio(1.0, setup.animDurationUser);
        setup.init.secondsUnitsAnimator.update(context,
                                          CanvasFunctions.determineDigit(secondsUnit),
                                          CanvasFunctions.determineDigit(CoreFunctions.getNextInt(secondsUnit, 9)),
                                          secondsUnitRatio);
        setup.init.secondsTensAnimator.animationStartRatio = CoreFunctions.getAnimStartRatio(10.0, setup.animDurationUser);
        setup.init.secondsTensAnimator.update(context,
                                         CanvasFunctions.determineDigit(secondsTen),
                                         CanvasFunctions.determineDigit(CoreFunctions.getNextInt(secondsTen, 5)),
                                         secondsTenRatio);

        // Blink Dots
        if (setup.showDots && setup.blinkDots) {
            CanvasFunctions.setBlinked(CanvasFunctions.getBlinked(secondsUnit));
        }

        // Render Minutes
        var minuteTotal = currentDate.getMinutes();
        var minutesUnit = minuteTotal % 10;
        var minutesTen = (minuteTotal % 100 - minuteTotal % 10) / 10;
        var minutesUnitRatio = (secondTotal * 1000 + millis) / 60000.0;
        var minutesTenRatio = (minutesUnit * 60000 + secondTotal * 1000 + millis) / 600000.0;
        setup.init.minutesTensAnimator.animationStartRatio = CoreFunctions.getAnimStartRatio(600.0, setup.animDurationUser);
        setup.init.minutesTensAnimator.update(context,
                                         CanvasFunctions.determineDigit(minutesTen),
                                         CanvasFunctions.determineDigit(CoreFunctions.getNextInt(minutesTen, 5)),
                                         minutesTenRatio);
        setup.init.minutesUnitsAnimator.animationStartRatio = CoreFunctions.getAnimStartRatio(60.0, setup.animDurationUser);
        setup.init.minutesUnitsAnimator.update(context,
                                          CanvasFunctions.determineDigit(minutesUnit),
                                          CanvasFunctions.determineDigit(CoreFunctions.getNextInt(minutesUnit, 9)),
                                          minutesUnitRatio);

        // Render Hours
        var hoursTotal = currentDate.getHours();
        var hoursUnit = hoursTotal % 10;
        var hoursTen = (hoursTotal % 100 - hoursTotal % 10) / 10;
        var hoursUnitRatio = (minuteTotal * 60000 + secondTotal * 1000 + millis) / 3600000.0;
        var hoursTenRatio;
        var hoursUnitNext;
        if (hoursTen == 2 && hoursUnit == 3) {
            hoursUnitNext = 0;
            hoursTenRatio = (hoursUnit * 3600000 + minuteTotal * 60000 + secondTotal * 1000 + millis) / (4 * 3600000.0);
            setup.init.hoursTensAnimator.animationStartRatio = CoreFunctions.getAnimStartRatio(3600 * 4, setup.animDurationUser);
        } else {
            hoursUnitNext = CoreFunctions.getNextInt(hoursUnit, 9);
            hoursTenRatio = (hoursUnit * 3600000 + minuteTotal * 60000 + secondTotal * 1000 + millis) / 36000000.0;
            setup.init.hoursTensAnimator.animationStartRatio = CoreFunctions.getAnimStartRatio(3600 * 10, setup.animDurationUser);
        }
        setup.init.hoursTensAnimator.update(context,
                                       CanvasFunctions.determineDigit(hoursTen),
                                       CanvasFunctions.determineDigit(CoreFunctions.getNextInt(hoursTen, 2)),
                                       hoursTenRatio);
        setup.init.hoursUnitsAnimator.animationStartRatio = CoreFunctions.getAnimStartRatio(3600, setup.animDurationUser);
        setup.init.hoursUnitsAnimator.update(context,
                                        CanvasFunctions.determineDigit(hoursUnit),
                                        CanvasFunctions.determineDigit(hoursUnitNext),
                                        hoursUnitRatio);

        context.restore();
    }
}
