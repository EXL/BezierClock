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

function getBlinked(aSec) {
    if (currentSec === aSec) {
        return false;
    } else {
        currentSec = aSec;
        return true;
    }
}

function setBlinked(aSwap) {
    if (aSwap) {
        setup.blink = !setup.blink;
    }
}

function fillCanvasByColor(context, color) {
    context.fillStyle = color;
    context.fillRect(0, 0, canvas.width, canvas.height);
}

function translateContex(context) {
    context.translate(canvas.width / 2 - setup.digitRelAllWidth / 2 - setup.digitSize / 2,
                      canvas.height / 2 - setup.digitSize / 2);
}

function determineDigit(digit) {
    switch (digit) {
    default:
    case 0:
        return setup.init.digits.digit_0;
    case 1:
        return setup.init.digits.digit_1;
    case 2:
        return setup.init.digits.digit_2;
    case 3:
        return setup.init.digits.digit_3;
    case 4:
        return setup.init.digits.digit_4;
    case 5:
        return setup.init.digits.digit_5;
    case 6:
        return setup.init.digits.digit_6;
    case 7:
        return setup.init.digits.digit_7;
    case 8:
        return setup.init.digits.digit_8;
    case 9:
        return setup.init.digits.digit_9;
    }
}
