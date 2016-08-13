import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Dialogs 1.1

import org.kde.plasma.core 2.0 // For units

Item {
    property string titleDialog
    property string labelText

    property alias colorTo: colorDialog.color

    width: label.width + colorButton.width + units.smallSpacing
    height: colorButton.height

    ColorDialog {
        id: colorDialog
        modality: Qt.WindowModal
        showAlphaChannel: false
        title: titleDialog
    }

    Row {
        spacing: units.smallSpacing

        Button {
            id: colorButton
            width: units.gridUnit * 2
            onClicked: colorDialog.open()

            Rectangle {
                id: colorRect
                anchors.centerIn: parent
                width: parent.width - units.smallSpacing * 4
                height: parent.height - units.smallSpacing * 4
                color: colorDialog.color
            }
        }

        Label {
            id: label
            anchors.verticalCenter: colorButton.verticalCenter
            text: labelText
        }
    }
}
