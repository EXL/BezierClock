import QtQuick 2.0
import QtQml 2.0 // for Date()

import "AdditionalFunctions.js" as Util
import "CanvasFunctions.js" as CanvasFunctions

Canvas {
    id: canvas

    property date currentDate

    onPaint: {
        var context2d = getContext('2d');
        render(context2d);
    }

    function render(context) {
        context.save();

        // Fill Background
        CanvasFunctions.fillCanvasByColor(context, setup.backgroundColor);

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
        setup.secondsUnitsAnimator.animationStartRatio = Util.getAnimStartRatio(1.0, setup.animDurationUser);
        setup.secondsUnitsAnimator.update(context,
                                          CanvasFunctions.determineDigit(secondsUnit),
                                          CanvasFunctions.determineDigit(Util.getNextInt(secondsUnit, 9)),
                                          secondsUnitRatio);
        setup.secondsTensAnimator.animationStartRatio = Util.getAnimStartRatio(10.0, setup.animDurationUser);
        setup.secondsTensAnimator.update(context,
                                         CanvasFunctions.determineDigit(secondsTen),
                                         CanvasFunctions.determineDigit(Util.getNextInt(secondsTen, 5)),
                                         secondsTenRatio);

        // Render Minutes
        var minuteTotal = currentDate.getMinutes();
        var minutesUnit = minuteTotal % 10;
        var minutesTen = (minuteTotal % 100 - minuteTotal % 10) / 10;
        var minutesUnitRatio = (secondTotal * 1000 + millis) / 60000.0;
        var minutesTenRatio = (minutesUnit * 60000 + secondTotal * 1000 + millis) / 600000.0;
        setup.minutesTensAnimator.animationStartRatio = Util.getAnimStartRatio(600.0, setup.animDurationUser);
        setup.minutesTensAnimator.update(context,
                                         CanvasFunctions.determineDigit(minutesTen),
                                         CanvasFunctions.determineDigit(Util.getNextInt(minutesTen, 5)),
                                         minutesTenRatio);
        setup.minutesUnitsAnimator.animationStartRatio = Util.getAnimStartRatio(60.0, setup.animDurationUser);
        setup.minutesUnitsAnimator.update(context,
                                          CanvasFunctions.determineDigit(minutesUnit),
                                          CanvasFunctions.determineDigit(Util.getNextInt(minutesUnit, 9)),
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
            setup.hoursTensAnimator.animationStartRatio = Util.getAnimStartRatio(3600 * 4, setup.animDurationUser);
        } else {
            hoursUnitNext = Util.getNextInt(hoursUnit, 9);
            hoursTenRatio = (hoursUnit * 3600000 + minuteTotal * 60000 + secondTotal * 1000 + millis) / 36000000.0;
            setup.hoursTensAnimator.animationStartRatio = Util.getAnimStartRatio(3600 * 10, setup.animDurationUser);
        }
        setup.hoursTensAnimator.update(context,
                                       CanvasFunctions.determineDigit(hoursTen),
                                       CanvasFunctions.determineDigit(Util.getNextInt(hoursTen, 2)),
                                       hoursTenRatio);
        setup.hoursUnitsAnimator.animationStartRatio = Util.getAnimStartRatio(3600, setup.animDurationUser);
        setup.hoursUnitsAnimator.update(context,
                                        CanvasFunctions.determineDigit(hoursUnit),
                                        CanvasFunctions.determineDigit(hoursUnitNext),
                                        hoursUnitRatio);

        context.restore();
    }
}
