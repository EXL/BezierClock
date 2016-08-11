import QtQuick 2.0

Item {
    property real animationStartRatio
    property bool continualAnimation: false
    property real origX
    property real origY

    function tick(currentDigit, nextDigit, ratio, context) {
        var current = currentDigit;
        var next = nextDigit;

        var animationRatio = 0.0;
        if (ratio > animationStartRatio) {
            animationRatio = (ratio - animationStartRatio) / (1 - animationStartRatio);
        }
        if (continualAnimation) {
            animationRatio = ratio;
        }
        if (ratio < 0.0) {
            animationRatio = 0.0;
        }
        if (ratio > 1.0) {
            animationRatio = 1;
        }
        if (animationType == 2) { // Quad
            animationRatio = Math.sqrt(animationRatio);
            ratio = Math.sqrt(ratio);
        } else if (animationType == 3) { // Cube
            animationRatio = animationRatio * Math.sqrt(animationRatio);
            ratio = ratio * Math.sqrt(ratio);
        } else if (animationType == 4) { // Sin
            animationRatio = 0.5 * (-Math.cos(animationRatio * Math.PI) + 1);
            ratio = 0.5 * (-Math.cos(ratio * Math.PI) + 1);
        }
//        var rad = 5.0;
//        // First point
//        vertex(lerp(current.getVertexX(), next.getVertexX(), animationRatio) + origX, lerp(current.getVertexY(), next.getVertexY(), animationRatio) + origY);
//        for (int i = 0; i < 4; i++) {
//          // actual curve
//          bezierVertexFromArrayListsRatios(current.getControl(i), next.getControl(i), animationRatio, origX, origY);
//        }
//        endShape();
//        fill(255);
//        strokeWeight(1);
    }

    function lerp(value1, value2, amount) {
        amount = amount < 0 ? 0 : amount;
        amount = amount > 1 ? 1 : amount;
        return value1 + (value2 - value1) * amount;
    }
}
