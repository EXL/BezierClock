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

function checkFullscreen() {
    if (settings.fullscreen) {
        rootWindow.visibility = 'FullScreen';
    } else {
        rootWindow.visibility = 'Windowed';
    }
}

function toggleFullscreen() {
    settings.fullscreen = !settings.fullscreen;
    checkFullscreen();
}

function keyPressed(event) {
    if (event.key === Qt.Key_F2) {
        toggleFullscreen();
        showOptionsOverlay(qsTr('Main Settings'), qsTr('Fullscreen'), settings.fullscreen);
    } else if (event.key === Qt.Key_Z) {
        setup.showFps = !setup.showFps;
        showOptionsOverlay(qsTr('FPS Settings'), qsTr('Show FPS'), setup.showFps);
    } else if (event.key === Qt.Key_X) {
        if (setup.frameRate > 1) {
            --setup.frameRate;
        }
        showOptionsOverlay(qsTr('FPS Settings'), qsTr('Frame Rate'), (1000 / setup.frameRate).toFixed(3));
    } else if (event.key === Qt.Key_C) {
        if (setup.frameRate < 1000) {
            ++setup.frameRate;
        }
        showOptionsOverlay(qsTr('FPS Settings'), qsTr('Frame Rate'), (1000 / setup.frameRate).toFixed(3));
    } else if (event.key === Qt.Key_V) {
        setup.showDots = !setup.showDots;
        showOptionsOverlay(qsTr('Dots Settings'), qsTr('Show Dots'), setup.showDots);
    } else if (event.key === Qt.Key_B) {
        if (setup.showDots) {
            setup.blinkDots = !setup.blinkDots;
            showOptionsOverlay(qsTr('Dots Settings'), qsTr('Blinks Dots'), setup.blinkDots);
        }
    } else if (event.key === Qt.Key_N) {
        if (setup.showDots) {
            if (setup.radiusDots < 50) {
                ++setup.radiusDots;
            }
            showOptionsOverlay(qsTr('Dots Settings'), qsTr('Dots Radius'), setup.radiusDots);
        }
    } else if (event.key === Qt.Key_M) {
        if (setup.showDots) {
            if (setup.radiusDots > 1) {
                --setup.radiusDots;
            }
            showOptionsOverlay(qsTr('Dots Settings'), qsTr('Dots Radius'), setup.radiusDots);
        }
    } else if (event.key === Qt.Key_F4) {
        resetToDefault();
        showMessage(qsTr('Reset to Default'));
    } else if (event.key === Qt.Key_Q) {
        setup.showContinualShadows = !setup.showContinualShadows;
        setup.continualAnimation = false;
        showOptionsOverlay(qsTr('Continual Shadows'), qsTr('Show continual shadows'), setup.showContinualShadows);
    } else if (event.key === Qt.Key_W) {
        if (setup.showContinualShadows) {
            if (setup.digitWidthShadow < 100) {
                ++setup.digitWidthShadow;
            }
            showOptionsOverlay(qsTr('Continual Shadows'), qsTr('Shadow Width'), setup.digitWidthShadow);
        }
    } else if (event.key === Qt.Key_E) {
        if (setup.showContinualShadows) {
            if (setup.digitWidthShadow > 1) {
                --setup.digitWidthShadow;
            }
            showOptionsOverlay(qsTr('Continual Shadows'), qsTr('Shadow Width'), setup.digitWidthShadow);
        }
    } else if (event.key === Qt.Key_R) {
        if (setup.drawControlLines) {
            if (setup.linesWidth < 100) {
                ++setup.linesWidth;
            }
            showOptionsOverlay(qsTr('Control Lines'), qsTr('Control Lines Width'), setup.linesWidth);
        }
    } else if (event.key === Qt.Key_T) {
        if (setup.drawControlLines) {
            if (setup.linesWidth > 1) {
                --setup.linesWidth;
            }
            showOptionsOverlay(qsTr('Control Lines'), qsTr('Control Lines Width'), setup.linesWidth);
        }
    } else if (event.key === Qt.Key_Y) {
        if (setup.drawControlLines) {
            if (setup.radius < 100) {
                ++setup.radius;
            }
            showOptionsOverlay(qsTr('Control Lines'), qsTr('Control Shapes Radius'), setup.radius);
        }
    } else if (event.key === Qt.Key_U) {
        if (setup.drawControlLines) {
            if (setup.radius > 1) {
                --setup.radius;
            }
            showOptionsOverlay(qsTr('Control Lines'), qsTr('Control Shapes Radius'), setup.radius);
        }
    } else if (event.key === Qt.Key_I) {
        if (setup.digitWidth < 100) {
            ++setup.digitWidth;
        }
        showOptionsOverlay(qsTr('Digits Settings'), qsTr('Digit Width'), setup.digitWidth);
    } else if (event.key === Qt.Key_O) {
        if (setup.digitWidth > 1) {
            --setup.digitWidth;
        }
        showOptionsOverlay(qsTr('Digits Settings'), qsTr('Digit Width'), setup.digitWidth);
    } else if (event.key === Qt.Key_P) {
        ++setup.digitCap;
        if (setup.digitCap > 2) {
            setup.digitCap = 0;
        }
        showOptionsOverlay(qsTr('Digits Settings'), qsTr('Digit Cap'), CoreFunctions.getLineCap(setup.digitCap));
    } else if (event.key === Qt.Key_A) {
        ++setup.animationType;
        if (setup.animationType > 5) {
            setup.animationType = 1;
        }
        showOptionsOverlay(qsTr('Main Settings'), qsTr('Animation Type'), CoreFunctions.getAnimationType(setup.animationType));
    } else if (event.key === Qt.Key_S) {
        if (setup.visualScaling < 2) {
            setup.visualScaling += 0.1;
        }
        showOptionsOverlay(qsTr('Main Settings'), qsTr('Scaling Value'), (setup.visualScaling / 10).toFixed(3));
    } else if (event.key === Qt.Key_D) {
        if (setup.visualScaling > 0.15) {
            setup.visualScaling -= 0.1;
        }
        showOptionsOverlay(qsTr('Main Settings'), qsTr('Scaling Value'), (setup.visualScaling / 10).toFixed(3));
    } else if (event.key === Qt.Key_F) {
        if (setup.animationType != 5) {
            if (setup.animDurationUser < 100) {
                setup.animDurationUser += 0.1;
            }
            showOptionsOverlay(qsTr('Main Settings'), qsTr('Animation Duration'), setup.animDurationUser.toFixed(3));
        }
    } else if (event.key === Qt.Key_G) {
        if (setup.animationType != 5) {
            if (setup.animDurationUser > 0.1) {
                setup.animDurationUser -= 0.1;
            }
            showOptionsOverlay(qsTr('Main Settings'), qsTr('Animation Duration'), setup.animDurationUser.toFixed(3));
        }
    } else if (event.key === Qt.Key_H || event.key === Qt.Key_F1) {
        showHelpOverlay();
    } else if (event.key === Qt.Key_J) {
        setRandomColors();
        showMessage(qsTr('Randomize Colors'));
    }
}

function showOptionsOverlay(option, text, value) {
    overlayOptions.textTo = option + '\n' + text + ': ' + value;
    showOverlay();
}

function showMessage(value) {
    overlayOptions.textTo = value;
    showOverlay();
}

function showOverlay() {
    overlayOptions.visible = true;
    overlayOptions.opacity = 0.9;
    overlayOptions.animation.restart();
}

function showHelpOverlay() {
    overlayHelp.textTo = qsTr('Bezier Clock v1.1: Options Keys\n' +
                              '+------------------------------------+-----------------------------------+\n' +
                              '| Left Click - Show Control Lines    | Right Click - Continual Animation |\n' +
                              '|                                    |                                   |\n' +
                              '| H, F1 - This help                  | J - Randomize Color               |\n' +
                              '| Z - Show Fps                       | V - Show Dots                     |\n' +
                              '| X - Increase Frame Rate            | C - Reduce Frame Rate             |\n' +
                              '| N - Increase Dots Radius           | M - Reduce Dots Radius            |\n' +
                              '| B - Blink Dots                     | Q - Continual Shadows             |\n' +
                              '| W - Increase Shadow Width          | E - Reduce Shadow Width           |\n' +
                              '| R - Increase Lines Width           | T - Reduce Lines Width            |\n' +
                              '| Y - Increase Shapes Radius         | U - Reduce Shapes Radius          |\n' +
                              '| I - Increase Digit Width           | O - Reduce Digit Width            |\n' +
                              '| P - Change Digit Cap               | A - Change Animation Type         |\n' +
                              '| S - Increase Scaling Value         | D - Reduce Scaling Value          |\n' +
                              '| F - Increase Animation Duration    | G - Reduce Animation Duration     |\n' +
                              '|                                    |                                   |\n' +
                              '| F4 - Reset All Settings to Default | F2 - Toggle Fullscreen            |\n' +
                              '+------------------------------------+-----------------------------------+\n' +
                              'Port to Qt Quick/QML: © EXL, 2016\n' +
                              'exl@bk.ru | exlmotodev@gmail.com\n\n' +
                              'Original: © Jack Frigaard, 2014');
    overlayHelp.visible = true;
    overlayHelp.opacity = 0.9;
    overlayHelp.animation.restart();
}

function resetToDefault() {
    // Reset all settings to Default values
    setup.backgroundColor = '#FFFFFF';     // White
    setup.digitColor = '#000000';          // Black
    setup.digitColorShadow = '#888888';    // Gray
    setup.linesColor = '#FF0000';          // Red
    setup.rectColor = '#0000FF';           // Blue

    setup.continualAnimation = false;
    setup.showContinualShadows = false;
    setup.drawControlLines = false;
    setup.showFps = false;

    setup.visualScaling = 0.3;
    setup.animDurationUser = 0.5;
    setup.frameRate = 16;
    setup.digitWidth = 10;
    setup.digitWidthShadow = 10;
    setup.linesWidth = 1;
    setup.radius = 3;

    setup.digitCap = 1;
    setup.animationType = 1;

    setup.showDots = true;
    setup.blinkDots = false;
    setup.radiusDots = 5;

    setup.imgSource = '';
    setup.imgFillMode = 0;
    setup.wallEnable = false;

    settings.fullscreen = false;
    checkFullscreen();
}

function getRandomColor() {
    return Qt.rgba(Math.random(), Math.random(), Math.random(), 1.0);
}

function setRandomColors() {
    setup.backgroundColor = getRandomColor();
    setup.digitColor = getRandomColor();
    setup.digitColorShadow = getRandomColor();
    setup.linesColor = getRandomColor();
    setup.rectColor = getRandomColor();
}

function saveSettings() {
    settings.backgroundColor = setup.backgroundColor;
    settings.visualScaling = setup.visualScaling;
    settings.animDurationUser = setup.animDurationUser;
    settings.continualAnimation = setup.continualAnimation;

    settings.showFps = setup.showFps;
    settings.frameRate = setup.frameRate;

    settings.digitColor = setup.digitColor;
    settings.digitWidth = setup.digitWidth;
    settings.digitCap = setup.digitCap;

    settings.showContinualShadows = setup.showContinualShadows;
    settings.digitColorShadow = setup.digitColorShadow;
    settings.digitWidthShadow = setup.digitWidthShadow;

    settings.drawControlLines = setup.drawControlLines;
    settings.linesColor = setup.linesColor;
    settings.rectColor = setup.rectColor;
    settings.linesWidth = setup.linesWidth;
    settings.radius = setup.radius;

    settings.showDots = setup.showDots;
    settings.blinkDots = setup.blinkDots;
    settings.radiusDots = setup.radiusDots;

    settings.animationType = setup.animationType;
}
