import QtQuick 2.0
import QtQuick.Controls 1.0

import org.kde.plasma.core 2.0 // For units

import 'JsConfigUiHelper.js' as ConfigUiHelper

Row {
    id: root

    // Settings
    property alias cfg_BackgroundColor: colorBackgroundBox.colorTo
    property alias cfg_DigitColor: colorDigitBox.colorTo
    property alias cfg_ShadowColor: colorShadowBox.colorTo
    property alias cfg_ControlLinesColor: colorLinesBox.colorTo
    property alias cfg_SquaresColor: colorRectsBox.colorTo

    property alias cfg_ContinualAnimation: continualAnimationCheckBox.checked
    property alias cfg_ContinualShadows: continualShadowsCheckBox.checked
    property alias cfg_ControlLines: controlLinesCheckBox.checked
    property alias cfg_ShowFps: showFpsCheckBox.checked

    property alias cfg_ScalingValue: scalingSpinBox.spinBoxValue
    property alias cfg_DurationAnim: durationsSpinBox.spinBoxValue
    property alias cfg_FrameRate: fpsLimitSpinBox.spinBoxValue
    property alias cfg_DigitWidth: digitsWidthSpinBox.spinBoxValue
    property alias cfg_ShadowWidth: shadowsWidthSpinBox.spinBoxValue
    property alias cfg_LinesWidth: linesWidthSpinBox.spinBoxValue
    property alias cfg_CirclesRadius: circlesRadiusSpinBox.spinBoxValue

    property alias cfg_DigitCap: digitCapComboBox.comboBoxIndex
    property alias cfg_AnimationType: animationTypeComboBox.comboBoxIndex

    spacing: units.smallSpacing

    Column {
        spacing: units.smallSpacing

        GroupBox {
            title: qsTr("Main Settings")
            width: aboutLabel.width

            Column {
                spacing: units.smallSpacing

                UiComboBox {
                    id: animationTypeComboBox
                    labelText: qsTr("Animation")
                    modelTo: [qsTr("Linear"), qsTr("Quadratic"), qsTr("Cubic"),
                        qsTr("Sinuisoidial"), qsTr("No animation")]
                    onComboBoxIndexChanged: {
                        if (comboBoxIndex == 4) {
                            durationsSpinBox.enabled = false
                        } else {
                            durationsSpinBox.enabled = true
                        }
                    }
                }

                UiSpinBox {
                    id: scalingSpinBox
                    minValue: 1
                    maxValue: 50
                    stepValue: 1
                    labelText: qsTr("Scaling Value")
                }

                UiSpinBox {
                    id: durationsSpinBox
                    minValue: 0
                    maxValue: 100
                    stepValue: 1
                    labelText: qsTr("Animation Duration")
                }

                CheckBox {
                    id: continualAnimationCheckBox
                    text: qsTr("Continual Animation")
                    onCheckedChanged: {
                        if (checked == true) {
                            continualShadowsCheckBox.checked = false;
                        }
                    }
                }

                UiColorBox {
                    id: colorBackgroundBox
                    titleDialog: qsTr("Select Background Color")
                    labelText: qsTr("Background Color")
                }
            }
        }

        GroupBox {
            title: qsTr("Digits Settings")
            width: aboutLabel.width

            Column {
                spacing: units.smallSpacing

                UiSpinBox {
                    id: digitsWidthSpinBox
                    minValue: 1
                    maxValue: 100
                    stepValue: 1
                    labelText: qsTr("Digits Width")
                }

                UiComboBox {
                    id: digitCapComboBox
                    labelText: qsTr("Digits Cap")
                    modelTo: [qsTr("Butt"), qsTr("Round"), qsTr("Square")]
                }

                UiColorBox {
                    id: colorDigitBox
                    titleDialog: qsTr("Select Digits Color")
                    labelText: qsTr("Digits Color")
                }
            }
        }
    }

    Column {
        spacing: units.smallSpacing

        GroupBox {
            title: qsTr("Continual Shadows")
            width: aboutLabel.width

            Column {
                spacing: units.smallSpacing

                CheckBox {
                    id: continualShadowsCheckBox
                    text: qsTr("Show Continual Shadows")
                    onCheckedChanged: {
                        if (checked == true) {
                            continualAnimationCheckBox.checked = false;
                        }
                    }
                }

                UiSpinBox {
                    id: shadowsWidthSpinBox
                    enabled: continualShadowsCheckBox.checked
                    minValue: 1
                    maxValue: 100
                    stepValue: 1
                    labelText: qsTr("Shadow Width")
                }

                UiColorBox {
                    id: colorShadowBox
                    enabled: continualShadowsCheckBox.checked
                    titleDialog: qsTr("Select Shadows Color")
                    labelText: qsTr("Shadows Color")
                }
            }
        }

        GroupBox {
            title: qsTr("Control Lines")
            width: aboutLabel.width

            Column {
                spacing: units.smallSpacing

                CheckBox {
                    id: controlLinesCheckBox
                    text: qsTr("Show Control Lines")
                }

                UiSpinBox {
                    id: linesWidthSpinBox
                    enabled: controlLinesCheckBox.checked
                    minValue: 1
                    maxValue: 100
                    stepValue: 1
                    labelText: qsTr("Control Lines Width")
                }

                UiSpinBox {
                    id: circlesRadiusSpinBox
                    enabled: controlLinesCheckBox.checked
                    minValue: 1
                    maxValue: 100
                    stepValue: 1
                    labelText: qsTr("Shapes Radius")
                }

                UiColorBox {
                    id: colorLinesBox
                    enabled: controlLinesCheckBox.checked
                    titleDialog: qsTr("Select Lines Color")
                    labelText: qsTr("Lines Color")
                }

                UiColorBox {
                    id: colorRectsBox
                    enabled: controlLinesCheckBox.checked
                    titleDialog: qsTr("Select Squares Color")
                    labelText: qsTr("Squares Color")
                }
            }
        }
    }

    Column {
        spacing: units.smallSpacing

        GroupBox {
            title: qsTr("FPS settings")
            width: aboutLabel.width

            Column {
                spacing: units.smallSpacing

                UiSpinBox {
                    id: fpsLimitSpinBox
                    minValue: 1
                    maxValue: 1000
                    stepValue: 1
                    labelText: qsTr("FPS Limit")
                }

                CheckBox {
                    id: showFpsCheckBox
                    text: qsTr("Show FPS")
                }
            }
        }

        Button {
            id: resetButton
            width: aboutLabel.width
            text: qsTr("Reset to Default")

            onClicked: {
                ConfigUiHelper.resetToDefault();
            }
        }

        Label {
            id: aboutLabel // This is element with biggest width
            onLinkActivated: Qt.openUrlExternally(link)
            text: qsTr('KDE Plasma 5 Port: © <font color="orange"><b>EXL</b></font>, 2016<br>' +
                       '<a href="http://exlmoto.ru/bezier-clock">http://exlmoto.ru/bezier-clock</a><br>' +
                       '<a href="https://github.com/EXL/BezierClock">https://github.com/EXL/BezierClock</a><br>' +
                       'Original: © <font color="orange"><b>Jack Frigaard</b></font>, 2014<br>' +
                       '<a href="http://frigaardj.github.io/bezier-clock/">http://frigaardj.github.io/bezier-clock</a>')
        }
    }
}

