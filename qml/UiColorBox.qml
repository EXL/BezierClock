/************************************************************************************
** The MIT License (MIT)
**
** Copyright (c) 2016 Serg "EXL" Koles <exlmotodev@gmail.com>
**
** Permission is hereby granted, free of charge, to any person obtaining a copy
** of this software and associated documentation files (the "Software"), to deal
** in the Software without restriction, including without limitation the rights
** to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
** copies of the Software, and to permit persons to whom the Software is
** furnished to do so, subject to the following conditions:
**
** The above copyright notice and this permission notice shall be included in all
** copies or substantial portions of the Software.
**
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
** IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
** FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
** AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
** LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
** OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
** SOFTWARE.
************************************************************************************/

import QtQuick 2.0
import QtQuick.Controls 1.0
import QtQuick.Dialogs 1.1

import org.kde.plasma.core 2.0 as Plasmacore // For units

Item {
    property string titleDialog
    property string labelText

    property alias colorTo: colorDialog.color

    width: label.width + colorButton.width + units.smallSpacing
    height: colorButton.height

    ColorDialog {
        id: colorDialog
        modality: Qt.WindowModal
        showAlphaChannel: true
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
