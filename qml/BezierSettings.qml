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

import org.kde.plasma.core 2.0 as Plasmacore // For wallpaper.configuration

Item {
    property color backgroundColor: wallpaper.configuration.Color
    property real visualScaling: wallpaper.configuration.ScalingValue / 10
    property real animDurationUser: wallpaper.configuration.DurationAnim / 100
    property bool continualAnimation: wallpaper.configuration.ContinualAnimation

    property bool showFps: wallpaper.configuration.ShowFps
    property int frameRate: 1000 / wallpaper.configuration.FrameRate

    property color digitColor: wallpaper.configuration.DigitColor
    property int digitWidth: wallpaper.configuration.DigitWidth
    property int digitCap: wallpaper.configuration.DigitCap

    property bool showContinualShadows: wallpaper.configuration.ContinualShadows
    property color digitColorShadow: wallpaper.configuration.ShadowColor
    property int digitWidthShadow: wallpaper.configuration.ShadowWidth

    property bool drawControlLines: wallpaper.configuration.ControlLines
    property color linesColor: wallpaper.configuration.ControlLinesColor
    property color rectColor: wallpaper.configuration.SquaresColor
    property int linesWidth: wallpaper.configuration.LinesWidth
    property int radius: wallpaper.configuration.CirclesRadius

    property bool showDots: wallpaper.configuration.ShowDots
    property bool blinkDots: wallpaper.configuration.BlinkDots
    property int radiusDots: wallpaper.configuration.RadiusDots

    // 1 for Linear
    // 2 for Quadratic
    // 3 for Cubic
    // 4 for Sinuisoidial
    // 5 for No animation
    property int animationType: wallpaper.configuration.AnimationType + 1
}
