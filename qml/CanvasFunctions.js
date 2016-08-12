
function fillCanvasByColor(context, color) {
    context.fillStyle = color;
    context.fillRect(0, 0, canvas.width, canvas.height);
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
