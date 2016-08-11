import QtQuick 2.0

Item {
    property real vertexX
    property real vertexY

    property real visualScaling: 1.0

    property variant controls: []

    function getControl(index) {
        var scaledControl = new Array(6);
        for (var i = 0; i < 6; i++) {
            scaledControl[i] = controls[index][i] * visualScaling;
        }
        return scaledControl;
    }

    function getVertexX() {
        return vertexX * visualScaling;
    }

    function getVertexY() {
        return vertexY * visualScaling;
    }

    function initialize() {
        console.log("initializing");
        controls = new Array(4);
    }

    Component.onCompleted: {
        initialize();
    }
}
