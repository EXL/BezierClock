.pragma library

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
