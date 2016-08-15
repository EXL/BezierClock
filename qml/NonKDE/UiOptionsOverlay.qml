import QtQuick 2.0

import '../'

UiBaseOverlay {
    property bool playAnimation: false
    property alias animation: _animation

    visible: false

    NumberAnimation on opacity {
        id: _animation
        running: playAnimation
        to: 0.0
        duration: 3000 // 3 seconds
    }

    onOpacityChanged: {
        if (!opacity) {
            visible = false;
        }
    }
}
