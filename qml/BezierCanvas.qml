import QtQuick 2.0
import QtQml 2.0 // for Date()

import "AdditionalFunctions.js" as Util

Canvas {
    property date currentDate

    onPaint: {
        var context2d = getContext('2d');
        render(context2d);
    }

    function determineDigit(digit) {
        switch (digit) {
        default:
        case 0:
            return setup.digits.digit_0;
        case 1:
            return setup.digits.digit_1;
        case 2:
            return setup.digits.digit_2;
        case 3:
            return setup.digits.digit_3;
        case 4:
            return setup.digits.digit_4;
        case 5:
            return setup.digits.digit_5;
        case 6:
            return setup.digits.digit_6;
        case 7:
            return setup.digits.digit_7;
        case 8:
            return setup.digits.digit_8;
        case 9:
            return setup.digits.digit_9;
        }
    }

    function render(context) {
//        context.save();

        setup.animTypeChangeCounter++;

        context.fillStyle = setup.backgroundColor;
        context.fillRect(0, 0, canvas.width, canvas.height);

        // Seconds
        currentDate = new Date();
        var millis = currentDate.getMilliseconds();
        var secondTotal = currentDate.getSeconds();
        var secondsUnit = secondTotal % 10;
        var secondsTen = (secondTotal % 100 - secondTotal % 10) / 10;
        var secondsUnitRatio = millis / 1000.0;
        var secondsTenRatio = (secondsUnit * 1000 + millis) / 10000.0;
        setup.secondsUnitsAnimator.animationStartRatio = Util.getAnimStartRatio(1.0, setup.animDurationUser);
        setup.secondsUnitsAnimator.update(context,
                                          determineDigit(secondsUnit),
                                          determineDigit(Util.getNextInt(secondsUnit, 9)),
                                          secondsUnitRatio);
        setup.secondsTensAnimator.animationStartRatio = Util.getAnimStartRatio(10.0, setup.animDurationUser);
        setup.secondsTensAnimator.update(context,
                                         determineDigit(secondsTen),
                                         determineDigit(Util.getNextInt(secondsTen, 5)),
                                         secondsTenRatio);

        // Minutes
        var minuteTotal = currentDate.getMinutes();
        var minutesUnit = minuteTotal % 10;
        var minutesTen = (minuteTotal % 100 - minuteTotal % 10) / 10;
        var minutesUnitRatio = (secondTotal * 1000 + millis) / 60000.0;
        var minutesTenRatio = (minutesUnit * 60000 + secondTotal * 1000 + millis) / 60000.0;
        setup.minutesTensAnimator.animationStartRatio = Util.getAnimStartRatio(600.0, setup.animDurationUser);
        setup.minutesTensAnimator.update(context,
                                         determineDigit(minutesTen),
                                         determineDigit(Util.getNextInt(minutesTen, 5)),
                                         minutesTenRatio);
        setup.minutesUnitsAnimator.animationStartRatio = Util.getAnimStartRatio(60.0, setup.animDurationUser);
        setup.minutesUnitsAnimator.update(context,
                                         determineDigit(minutesUnit),
                                         determineDigit(Util.getNextInt(minutesUnit, 9)),
                                         minutesUnitRatio);
        //console.log(minutesUnitRatio)
        // Hours
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
                                       determineDigit(hoursTen),
                                       determineDigit(Util.getNextInt(hoursTen, 2)),
                                       hoursTenRatio);
        setup.hoursUnitsAnimator.animationStartRatio = Util.getAnimStartRatio(3600, setup.animDurationUser);
        setup.hoursUnitsAnimator.update(context,
                                        determineDigit(hoursUnit),
                                        determineDigit(hoursUnitNext),
                                        hoursUnitRatio);
//        context.restore();
        //console.log("ci")
    }
}
