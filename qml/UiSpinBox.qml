import QtQuick 2.0
import QtQuick.Controls 1.0

import org.kde.plasma.core 2.0 // For units

Item {
    property string labelText
    property real maxValue
    property real minValue
    property real stepValue

    property alias spinBoxValue: spinBox.value

    width: label.width + spinBox.width + units.smallSpacing
    height: spinBox.height

    Row {
        spacing: units.smallSpacing

        SpinBox {
            id: spinBox
            maximumValue: maxValue
            minimumValue: minValue
            stepSize: stepValue
        }

        Label {
            id: label
            anchors.verticalCenter: spinBox.verticalCenter
            text: labelText
        }
    }
}
