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
    durationsSpinBox.spinBoxValue = 50;
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

    fillImageComboBox.comboBoxIndex = 0;
    wallpaperEnableComboBox.checked = false;
}
