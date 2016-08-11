import QtQuick 2.0

Canvas {
    property real hue: 0
    property real lastX: width * Math.random()
    property real lastY: height * Math.random()

    onPaint: {
        var context2d = getContext('2d');
        render(context2d);
    }

    function render(context) {
        context.save()
        context.translate(canvas.width/2, canvas.height/2)
        context.scale(0.9, 0.9)
        context.translate(-canvas.width/2, -canvas.height/2)
        context.beginPath()
        context.lineWidth = 5 + Math.random() * 10
        context.moveTo(lastX, lastY)
        lastX = canvas.width * Math.random()
        lastY = canvas.height * Math.random()
        context.bezierCurveTo(canvas.width * Math.random(),
                              canvas.height * Math.random(),
                              canvas.width * Math.random(),
                              canvas.height * Math.random(),
                              lastX, lastY);

        hue += Math.random()*0.1
        if(hue > 1.0) {
           hue -= 1
        }
        context.strokeStyle = Qt.hsla(hue, 0.5, 0.5, 1.0)
        //context.shadowColor = 'white';
        //context.shadowBlur = 10;
        context.stroke()
        context.restore()
    }
}
