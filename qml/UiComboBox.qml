import QtQuick 2.0
import QtQuick.Controls 1.0

import org.kde.plasma.core 2.0 // For units

Item {
    property string labelText
    property variant modelTo

    property alias comboBoxIndex: comboBox.currentIndex

    width: label.width + comboBox.width + units.smallSpacing
    height: comboBox.height

    Row {
        spacing: units.smallSpacing

        ComboBox {
            id: comboBox
            width: units.gridUnit * 8
            model: modelTo
        }

        Label {
            id: label
            anchors.verticalCenter: comboBox.verticalCenter
            text: labelText
        }
    }
}
