import QtQuick 2.0

import 'JsCoreFunctions.js' as CoreFunctions // For const

Rectangle {
    id: _base
    property int gap: 10

    property alias textTo: textLabel.text

    width: textLabel.width + gap
    height: textLabel.height + gap

    color: 'black'

    opacity: CoreFunctions.DEFAULT_OVERLAY_OPACITY

    Text {
        id: textLabel
        x: gap / 2
        y: gap / 2
        color: 'white'
        opacity: parent.opacity
        font.family : 'monospace'
    }
}
