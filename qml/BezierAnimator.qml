import QtQuick 2.0

import 'CoreFunctions.js' as CoreFunctions

Item {
    property real origX
    property real origY

    property real animationStartRatio

    function update(context, currentDigit, nextDigit, ratio) {
        var current = currentDigit;
        var next = nextDigit;

        // Set animationRatio
        var animationRatio = 0.0;
        if (ratio > animationStartRatio) {
            animationRatio = (ratio - animationStartRatio) / (1 - animationStartRatio);
        }
        if (setup.continualAnimation) {
            animationRatio = ratio;
        }

        // Reset animationRatio
        if (ratio < 0.0) {
            animationRatio = 0.0;
        }
        if (ratio > 1.0) {
            animationRatio = 1.0;
        }

        // Calculate animationRatio
        // 1 - is Linear
        if (setup.animationType == 2) { // Quadratic
            animationRatio = CoreFunctions.sq(animationRatio);
            ratio = CoreFunctions.sq(ratio);
        } else if (setup.animationType == 3) { // Cubic
            animationRatio = animationRatio * CoreFunctions.sq(animationRatio);
            ratio = ratio * CoreFunctions.sq(ratio);
        } else if (setup.animationType == 4) { // Sinuisoidial
            animationRatio = 0.5 * (-Math.cos(animationRatio * Math.PI) + 1);
            ratio = 0.5 * (-Math.cos(ratio * Math.PI) + 1);
        }

        // if (setup.showContinualShadows && !setup.continualAnimation) { }

        // Stroke Settings
        context.lineWidth = setup.digitWidth;
        context.strokeStyle = setup.digitColor;
        context.lineCap = setup.digitCap;

        context.beginPath();
        // First point
        context.moveTo(CoreFunctions.lerp(current.getVertexX(),
                                 next.getVertexX(),
                                 animationRatio) + origX,
                       CoreFunctions.lerp(current.getVertexY(),
                                 next.getVertexY(),
                                 animationRatio) + origY);
        for (var i = 0; i < 4; ++i) {
            // Actual Curve
            CoreFunctions.bezierVertexFromArrayListsRatios(context,
                                                  current.getControl(i),
                                                  next.getControl(i),
                                                  animationRatio,
                                                  origX, origY);
        }
        context.stroke();
    }
}
