.pragma library

var DEFAULT_OVERLAY_OPACITY = 0.7;

function lerp(value1, value2, amount) {
    // amount = amount < 0 ? 0 : amount;
    // amount = amount > 1 ? 1 : amount;
    return ((value2 - value1) * amount) + value1;
}

function bezierVertexFromArrayListsRatios(context, from, to, ratio, offsetX, offsetY) {
    context.bezierCurveTo(lerp(from[0], to[0], ratio) + offsetX,
                          lerp(from[1], to[1], ratio) + offsetY,
                          lerp(from[2], to[2], ratio) + offsetX,
                          lerp(from[3], to[3], ratio) + offsetY,
                          lerp(from[4], to[4], ratio) + offsetX,
                          lerp(from[5], to[5], ratio) + offsetY);
}

function getNextInt(current, max) {
    if (current >= max) {
        return 0;
    } else {
        return current + 1;
    }
}

function getAnimStartRatio(totalDuration, animDurationUser) {
    if (animDurationUser > totalDuration) {
        return 0;
    } else {
        return 1.0 - (animDurationUser / totalDuration)
    }
}

function sq(aNumber) {
    return aNumber * aNumber;
}

function roundOne(aNumber) {
    return (aNumber < 0.5) ? 0.0 : 1.0;
}

function drawLine(context, startX, startY, endX, endY) {
    context.beginPath();
    context.moveTo(startX, startY);
    context.lineTo(endX, endY);
    context.stroke();
}

function drawCircle(context, centerX, centerY, radius, fillColor) {
    context.beginPath();
    context.arc(centerX, centerY, radius, 0, 2 * Math.PI, false);
    context.fillStyle = fillColor;
    context.fill();
    context.stroke();
}

function drawSquare(context, x, y, width, fillColor, strokeColor, baseStokeColor) {
    context.beginPath();
    context.rect(x - width / 2, y - width / 2, width, width);
    context.fillStyle = fillColor;
    context.fill();
    context.strokeStyle = strokeColor;
    context.stroke();
    context.strokeStyle = baseStokeColor;
}

function getLineCap(aNumber) {
    switch (aNumber) {
    default:
    case 0:
        return 'butt';
    case 1:
        return 'round';
    case 2:
        return 'square';
    }
}

function getAnimationType(aNumber) {
    switch (aNumber) {
    default:
    case 0:
    case 1:
        return 'linear';
    case 2:
        return 'quadratic';
    case 3:
        return 'cubic';
    case 4:
        return 'sinuisoidial';
    case 5:
        return 'no animation';
    }
}
