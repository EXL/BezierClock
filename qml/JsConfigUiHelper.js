
function resetToDefault() {
    // Reset all settings to Default values
    colorBackgroundBox.colorTo = '#FFFFFF';     // White
    colorDigitBox.colorTo = '#000000';          // Black
    colorShadowBox.colorTo = '#888888';         // Gray
    colorLinesBox.colorTo = '#FF0000';          // Red
    colorRectsBox.colorTo = '#0000FF';          // Blue

    continualAnimationCheckBox.checked = false;
    continualShadowsCheckBox.checked = false;
    controlLinesCheckBox.checked = false;
    showFpsCheckBox.checked = false;

    scalingSpinBox.spinBoxValue = 5;
    durationsSpinBox.spinBoxValue = 100;
    fpsLimitSpinBox.spinBoxValue = 60;
    digitsWidthSpinBox.spinBoxValue = 10;
    shadowsWidthSpinBox.spinBoxValue = 10;
    linesWidthSpinBox.spinBoxValue = 1;
    circlesRadiusSpinBox.spinBoxValue = 3;

    digitCapComboBox.comboBoxIndex = 1;
    animationTypeComboBox.comboBoxIndex = 0;

    showDotsCheckBox.checked = true;
    blinkCheckBox.checked = false;
    radiusDotsSpinBox.spinBoxValue = 5;
}
