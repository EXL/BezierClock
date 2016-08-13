import QtQuick 2.0

import 'JsCoreFunctions.js' as CoreFunctions

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
        } else if (setup.animationType == 5) { // No animation
            animationRatio = CoreFunctions.roundOne(animationRatio);
            ratio = CoreFunctions.roundOne(ratio);
        }

        // Continual Shadows
        if (setup.showContinualShadows && !setup.continualAnimation) {
            context.lineWidth = setup.digitWidthShadow;
            context.strokeStyle = setup.digitColorShadow;
            context.lineCap = CoreFunctions.getLineCap(setup.digitCap);
            context.beginPath();
            context.moveTo(CoreFunctions.lerp(current.getVertexX(),
                                              next.getVertexX(),
                                              animationRatio) + origX,
                           CoreFunctions.lerp(current.getVertexY(),
                                              next.getVertexY(),
                                              ratio) + origY);
            for (var i = 0; i < 4; ++i) {
                CoreFunctions.bezierVertexFromArrayListsRatios(context,
                                                               current.getControl(i),
                                                               next.getControl(i),
                                                               ratio,
                                                               origX, origY);
            }
            context.stroke();
        }

        // Stroke Settings
        context.lineWidth = setup.digitWidth;
        context.strokeStyle = setup.digitColor;
        context.lineCap = CoreFunctions.getLineCap(setup.digitCap);

        context.beginPath();
        // First point
        context.moveTo(CoreFunctions.lerp(current.getVertexX(),
                                          next.getVertexX(),
                                          animationRatio) + origX,
                       CoreFunctions.lerp(current.getVertexY(),
                                          next.getVertexY(),
                                          animationRatio) + origY);
        for (var j = 0; j < 4; ++j) {
            // Actual Curve
            CoreFunctions.bezierVertexFromArrayListsRatios(context,
                                                           current.getControl(j),
                                                           next.getControl(j),
                                                           animationRatio,
                                                           origX, origY);
        }
        context.stroke();

        // Render control lines
        if (setup.drawControlLines) {
            context.lineWidth = setup.linesWidth;
            context.strokeStyle = setup.linesColor;

            for (var k = 0; k < 4; ++k) {
                CoreFunctions.drawLine(context,
                                       CoreFunctions.lerp(current.getControl(k)[2], next.getControl(k)[2], animationRatio) + origX,
                                       CoreFunctions.lerp(current.getControl(k)[3], next.getControl(k)[3], animationRatio) + origY,
                                       CoreFunctions.lerp(current.getControl(k)[4], next.getControl(k)[4], animationRatio) + origX,
                                       CoreFunctions.lerp(current.getControl(k)[5], next.getControl(k)[5], animationRatio) + origY);

                CoreFunctions.drawCircle(context,
                                         CoreFunctions.lerp(current.getControl(k)[2], next.getControl(k)[2], animationRatio) + origX,
                                         CoreFunctions.lerp(current.getControl(k)[3], next.getControl(k)[3], animationRatio) + origY,
                                         setup.radius, setup.backgroundColor);
                if (k < 3) {
                    CoreFunctions.drawLine(context,
                                           CoreFunctions.lerp(current.getControl(k+1)[0], next.getControl(k+1)[0], animationRatio) + origX,
                                           CoreFunctions.lerp(current.getControl(k+1)[1], next.getControl(k+1)[1], animationRatio) + origY,
                                           CoreFunctions.lerp(current.getControl(k)[4], next.getControl(k)[4], animationRatio) + origX,
                                           CoreFunctions.lerp(current.getControl(k)[5], next.getControl(k)[5], animationRatio) + origY);
                    CoreFunctions.drawCircle(context,
                                             CoreFunctions.lerp(current.getControl(k+1)[0], next.getControl(k+1)[0], animationRatio) + origX,
                                             CoreFunctions.lerp(current.getControl(k+1)[1], next.getControl(k+1)[1], animationRatio) + origY,
                                             setup.radius, setup.backgroundColor);
                }
                CoreFunctions.drawSquare(context,
                                         CoreFunctions.lerp(current.getControl(k)[4], next.getControl(k)[4], animationRatio) + origX,
                                         CoreFunctions.lerp(current.getControl(k)[5], next.getControl(k)[5], animationRatio) + origY,
                                         setup.radius * 2, setup.backgroundColor, setup.rectColor, setup.linesColor);
                if (k == 0) {
                    CoreFunctions.drawLine(context,
                                           CoreFunctions.lerp(current.getVertexX(), next.getVertexX(), animationRatio) + origX,
                                           CoreFunctions.lerp(current.getVertexY(), next.getVertexY(), animationRatio) + origY,
                                           CoreFunctions.lerp(current.getControl(0)[0], next.getControl(0)[0], animationRatio) + origX,
                                           CoreFunctions.lerp(current.getControl(0)[1], next.getControl(0)[1], animationRatio) + origY);
                    CoreFunctions.drawCircle(context,
                                             CoreFunctions.lerp(current.getControl(0)[0], next.getControl(0)[0], animationRatio)  + origX,
                                             CoreFunctions.lerp(current.getControl(0)[1], next.getControl(0)[1], animationRatio) + origY,
                                             setup.radius, setup.backgroundColor);
                    CoreFunctions.drawSquare(context,
                                             CoreFunctions.lerp(current.getVertexX(), next.getVertexX(), animationRatio) + origX,
                                             CoreFunctions.lerp(current.getVertexY(), next.getVertexY(), animationRatio) + origY,
                                             setup.radius * 2, setup.backgroundColor, setup.rectColor, setup.linesColor);
                }
            }
        }
    }
}
