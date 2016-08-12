import QtQuick 2.0

Item {
    property real vertexX
    property real vertexY

    property variant controls: []

    function initDigit(control0, control1, control2, control3) {
        for (var i = 0; i < 4; ++i) {
            controls[i] = new Array(6);
        }
        controls[0] = control0;
        controls[1] = control1;
        controls[2] = control2;
        controls[3] = control3;
    }

    function getControl(index) {
        var scaledControl = new Array(6);
        for (var i = 0; i < 6; i++) {
            scaledControl[i] = controls[index][i] * setup.visualScaling;
        }
        return scaledControl;
    }

    function getVertexX() {
        return vertexX * setup.visualScaling;
    }

    function getVertexY() {
        return vertexY * setup.visualScaling;
    }

    function initialize() {
        controls = new Array(4);
    }

    Component.onCompleted: {
        initialize();
    }
}
