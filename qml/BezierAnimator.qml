import QtQuick 2.0

import "AdditionalFunctions.js" as Util

Item {
    property real origX
    property real origY

    property real animationStartRatio

    function update(context, currentDigit, nextDigit, ratio) {
        var current = currentDigit;
        var next = nextDigit;

        // 1
        var animationRatio = 0.0;
        if (ratio > animationStartRatio) {
            animationRatio = (ratio - animationStartRatio) / (1 - animationStartRatio);
        }
        if (setup.continualAnimation) {
            animationRatio = ratio;
        }

        // 2
        if (ratio < 0.0) {
            animationRatio = 0.0;
        }
        if (ratio > 1.0) {
            animationRatio = 1.0;
        }

        // 3
        if (setup.animationType == 2) { // Quad
            animationRatio = Util.sq(animationRatio);
            ratio = Util.sq(ratio);
        } else if (setup.animationType == 3) { // Cube
            animationRatio = animationRatio * Util.sq(animationRatio);
            ratio = ratio * Util.sq(ratio);
        } else if (setup.animationType == 4) { // Sinus
            animationRatio = 0.5 * -(Math.cos(animationRatio * Math.PI) + 1);
            ratio = 0.5 * -(Math.cos(ratio * Math.PI) + 1);
        }

        // if (setup.showContinualShadows && !setup.continualAnimation) { }

        // Stroke Settings
        context.lineWidth = setup.digitWidth;
        context.strokeStyle = setup.digitColor;
        context.lineCap = setup.digitCap;

        context.beginPath();
        // First point
        context.moveTo(Util.lerp(current.getVertexX(),
                                 next.getVertexX(),
                                 animationRatio) + origX,
                       Util.lerp(current.getVertexY(),
                                 next.getVertexY(),
                                 animationRatio) + origY);
        for (var i = 0; i < 4; ++i) {
            // Actual Curve
            Util.bezierVertexFromArrayListsRatios(context,
                                                  current.getControl(i),
                                                  next.getControl(i),
                                                  animationRatio,
                                                  origX, origY);
        }
        context.stroke();
    }
}
