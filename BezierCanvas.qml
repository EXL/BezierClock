import QtQuick 2.0

Canvas {
    property real hue: 0
    //property real lastX: width * Math.random()
    //property real lastY: height * Math.random()
    property real animationStartRatio
    property bool continualAnimation: false
    property int animationType: 1

    property real origX: 0
    property real origY: 0

    property real ratio: 0.0

    onPaint: {
        var context2d = getContext('2d');
        render(context2d, digits.digit_0, digits.digit_1);
        ratio+=0.02;
    }

    function lerp(value1, value2, amount) {
        amount = amount < 0 ? 0 : amount;
        amount = amount > 1 ? 1 : amount;
        return value1 + (value2 - value1) * amount;
    }

    function render(context, currentDigit, nextDigit) {
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
        if (animationType == 2) { // quad
          animationRatio = Math.sqrt(animationRatio);
          ratio = Math.sqrt(ratio); // we don't need ratio any more
        }
        else if (animationType == 3) { // cub
          animationRatio = animationRatio * Math.sqrt(animationRatio);
          ratio = ratio * Math.sqrt(ratio);
        }
        else if (animationType == 4) { // sin
          animationRatio = 0.5 * (-Math.cos(animationRatio * Math.PI) + 1);
          ratio = 0.5 * (-Math.cos(ratio * Math.PI) + 1);
        }

        context.save()
        context.fillStyle = 'rgb(255, 255, 255)';
        context.fillRect(0, 0, context.canvas.width, context.canvas.height);
        context.translate(canvas.width/2, canvas.height/2)
        context.scale(0.9, 0.9)
        context.translate(-canvas.width/2, -canvas.height/2)
        context.beginPath()
        context.lineWidth = 15
        console.log(animationRatio + " " + ratio)
        context.moveTo(lerp(digits.digit_0.getVertexX(), digits.digit_1.getVertexX(), animationRatio) + origX,
                       lerp(digits.digit_0.getVertexY(), digits.digit_1.getVertexY(), ratio) + origY)
        //context.moveTo(lastX, lastY)
        //lastX = canvas.width * Math.random()
        //lastY = canvas.height * Math.random()
//        context.bezierCurveTo(canvas.width * Math.random(),
//                              canvas.height * Math.random(),
//                              canvas.width * Math.random(),
//                              canvas.height * Math.random(),
//                              lastX, lastY);
        for (var i = 0; i < 4; i++) {
          // actual curve
          bezierVertexFromArrayListsRatios(context, digits.digit_0.getControl(i), digits.digit_1.getControl(i),
                                           ratio, origX, origY);
        }
//        hue += Math.random()*0.1
//        if(hue > 1.0) {
//           hue -= 1
//        }
        context.strokeStyle = Qt.hsla(hue, 0.5, 0.5, 1.0)
        context.lineCap = 'round';
        //context.shadowColor = 'white';
        //context.shadowBlur = 10;
        context.stroke()
        context.restore()
    }

    function bezierVertexFromArrayListsRatios(context, from, to, ratio, offsetX, offsetY) {
      context.bezierCurveTo(lerp(from[0], to[0], ratio) + offsetX,
                 lerp(from[1], to[1], ratio) + offsetY,
                 lerp(from[2], to[2], ratio) + offsetX,
                 lerp(from[3], to[3], ratio) + offsetY,
                 lerp(from[4], to[4], ratio) + offsetX,
                 lerp(from[5], to[5], ratio) + offsetY);
    }
}
