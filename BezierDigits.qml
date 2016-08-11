import QtQuick 2.0

Item {
    property BezierDigit digit_0: digit0
    property BezierDigit digit_1: digit1
    property BezierDigit digit_2: digit2
    property BezierDigit digit_3: digit3
    property BezierDigit digit_4: digit4
    property BezierDigit digit_5: digit5
    property BezierDigit digit_6: digit6
    property BezierDigit digit_7: digit7
    property BezierDigit digit_8: digit8
    property BezierDigit digit_9: digit9

    BezierDigit { // Digit 0
        id: digit0
        vertexX: 254.0;
        vertexY: 47.0;

        function initDigit_0() {
            console.log("init 0")
            controls[0] = new Array(6);
            controls[0][0] = 159.0;
            controls[0][1] = 84.0;
            controls[0][2] = 123.0;
            controls[0][3] = 158.0;
            controls[0][4] = 131.0;
            controls[0][5] = 258.0;
            controls[1] = new Array(6);
            controls[1][0] = 139.0;
            controls[1][1] = 358.0;
            controls[1][2] = 167.0;
            controls[1][3] = 445.0;
            controls[1][4] = 256.0;
            controls[1][5] = 446.0;
            controls[2] = new Array(6);
            controls[2][0] = 345.0;
            controls[2][1] = 447.0;
            controls[2][2] = 369.0;
            controls[2][3] = 349.0;
            controls[2][4] = 369.0;
            controls[2][5] = 275.0;
            controls[3] = new Array(6);
            controls[3][0] = 369.0;
            controls[3][1] = 201.0;
            controls[3][2] = 365.0;
            controls[3][3] = 81.0;
            controls[3][4] = 231.0;
            controls[3][5] = 75.0;
        }

        Component.onCompleted: {
            initDigit_0();
        }
    }

    BezierDigit { // Digit 1
        id: digit1
        vertexX: 138.0;
        vertexY: 180.0;

        function initDigit_1() {
            console.log("init 1")
            controls[0] = new Array(6);
            controls[0][0] = 226.0;
            controls[0][1] = 99.0;
            controls[0][2] = 230.0;
            controls[0][3] = 58.0;
            controls[0][4] = 243.0;
            controls[0][5] = 43.0;
            controls[1] = new Array(6);
            controls[1][0] = 256.0;
            controls[1][1] = 28.0;
            controls[1][2] = 252.0;
            controls[1][3] = 100.0;
            controls[1][4] = 253.0;
            controls[1][5] = 167.0;
            controls[2] = new Array(6);
            controls[2][0] = 254.0;
            controls[2][1] = 234.0;
            controls[2][2] = 254.0;
            controls[2][3] = 194.0;
            controls[2][4] = 255.0;
            controls[2][5] = 303.0;
            controls[3] = new Array(6);
            controls[3][0] = 256.0;
            controls[3][1] = 412.0;
            controls[3][2] = 254.0;
            controls[3][3] = 361.0;
            controls[3][4] = 255.0;
            controls[3][5] = 424.0;
        }

        Component.onCompleted: {
            initDigit_1();
        }
    }

    BezierDigit { // Digit 2
        id: digit2
        vertexX: 104.0;
        vertexY: 111.0;

        function initDigit_2() {
            console.log("init 2")
            controls[0] = new Array(6);
            controls[0][0] = 152.0;
            controls[0][1] = 55.0;
            controls[0][2] = 208.0;
            controls[0][3] = 26.0;
            controls[0][4] = 271.0;
            controls[0][5] = 50.0;
            controls[1] = new Array(6);
            controls[1][0] = 334.0;
            controls[1][1] = 74.0;
            controls[1][2] = 360.0;
            controls[1][3] = 159.0;
            controls[1][4] = 336.0;
            controls[1][5] = 241.0;
            controls[2] = new Array(6);
            controls[2][0] = 312.0;
            controls[2][1] = 323.0;
            controls[2][2] = 136.0;
            controls[2][3] = 454.0;
            controls[2][4] = 120.0;
            controls[2][5] = 405.0;
            controls[3] = new Array(6);
            controls[3][0] = 104.0;
            controls[3][1] = 356.0;
            controls[3][2] = 327.0;
            controls[3][3] = 393.0;
            controls[3][4] = 373.0;
            controls[3][5] = 414.0;
        }

        Component.onCompleted: {
            initDigit_2();
        }
    }

    BezierDigit { // Digit 3
        id: digit3
        vertexX: 96.0;
        vertexY: 132.0;

        function initDigit_3() {
            console.log("init 3")
            controls[0] = new Array(6);
            controls[0][0] = 113.0;
            controls[0][1] = 14.0;
            controls[0][2] = 267.0;
            controls[0][3] = 17.0;
            controls[0][4] = 311.0;
            controls[0][5] = 107.0;
            controls[1] = new Array(6);
            controls[1][0] = 355.0;
            controls[1][1] = 197.0;
            controls[1][2] = 190.0;
            controls[1][3] = 285.0;
            controls[1][4] = 182.0;
            controls[1][5] = 250.0;
            controls[2] = new Array(6);
            controls[2][0] = 174.0;
            controls[2][1] = 215.0;
            controls[2][2] = 396.0;
            controls[2][3] = 273.0;
            controls[2][4] = 338.0;
            controls[2][5] = 388.0;
            controls[3] = new Array(6);
            controls[3][0] = 280.0;
            controls[3][1] = 503.0;
            controls[3][2] = 110.0;
            controls[3][3] = 445.0;
            controls[3][4] = 93.0;
            controls[3][5] = 391.0;
        }

        Component.onCompleted: {
            initDigit_3();
        }
    }

    BezierDigit { // Digit 4
        id: digit4
        vertexX: 374.0;
        vertexY: 244.0;

        function initDigit_4() {
            console.log("init 4")
            controls[0] = new Array(6);
            controls[0][0] = 249.0;
            controls[0][1] = 230.0;
            controls[0][2] = 192.0;
            controls[0][3] = 234.0;
            controls[0][4] = 131.0;
            controls[0][5] = 239.0;
            controls[1] = new Array(6);
            controls[1][0] = 70.0;
            controls[1][1] = 244.0;
            controls[1][2] = 142.0;
            controls[1][3] = 138.0;
            controls[1][4] = 192.0;
            controls[1][5] = 84.0;
            controls[2] = new Array(6);
            controls[2][0] = 242.0;
            controls[2][1] = 30.0;
            controls[2][2] = 283.0;
            controls[2][3] = -30.0;
            controls[2][4] = 260.0;
            controls[2][5] = 108.0;
            controls[3] = new Array(6);
            controls[3][0] = 237.0;
            controls[3][1] = 246.0;
            controls[3][2] = 246.0;
            controls[3][3] = 435.0;
            controls[3][4] = 247.0;
            controls[3][5] = 438.0;
        }

        Component.onCompleted: {
            initDigit_4();
        }
    }

    BezierDigit { // Digit 5
        id: digit5
        vertexX: 340.0;
        vertexY: 52.0;

        function initDigit_5() {
            console.log("init 5")
            controls[0] = new Array(6);
            controls[0][0] = 226.0;
            controls[0][1] = 42.0;
            controls[0][2] = 153.0;
            controls[0][3] = 44.0;
            controls[0][4] = 144.0;
            controls[0][5] = 61.0;
            controls[1] = new Array(6);
            controls[1][0] = 135.0;
            controls[1][1] = 78.0;
            controls[1][2] = 145.0;
            controls[1][3] = 203.0;
            controls[1][4] = 152.0;
            controls[1][5] = 223.0;
            controls[2] = new Array(6);
            controls[2][0] = 159.0;
            controls[2][1] = 243.0;
            controls[2][2] = 351.0;
            controls[2][3] = 165.0;
            controls[2][4] = 361.0;
            controls[2][5] = 302.0;
            controls[3] = new Array(6);
            controls[3][0] = 371.0;
            controls[3][1] = 439.0;
            controls[3][2] = 262.0;
            controls[3][3] = 452.0;
            controls[3][4] = 147.0;
            controls[3][5] = 409.0;
        }

        Component.onCompleted: {
            initDigit_5();
        }
    }

    BezierDigit { // Digit 6
        id: digit6
        vertexX: 301.0;
        vertexY: 26.0;

        function initDigit_6() {
            console.log("init 6")
            controls[0] = new Array(6);
            controls[0][0] = 191.0;
            controls[0][1] = 104.0;
            controls[0][2] = 160.0;
            controls[0][3] = 224.0;
            controls[0][4] = 149.0;
            controls[0][5] = 296.0;
            controls[1] = new Array(6);
            controls[1][0] = 138.0;
            controls[1][1] = 368.0;
            controls[1][2] = 163.0;
            controls[1][3] = 451.0;
            controls[1][4] = 242.0;
            controls[1][5] = 458.0;
            controls[2] = new Array(6);
            controls[2][0] = 321.0;
            controls[2][1] = 465.0;
            controls[2][2] = 367.0;
            controls[2][3] = 402.0;
            controls[2][4] = 348.0;
            controls[2][5] = 321.0;
            controls[3] = new Array(6);
            controls[3][0] = 329.0;
            controls[3][1] = 240.0;
            controls[3][2] = 220.0;
            controls[3][3] = 243.0;
            controls[3][4] = 168.0;
            controls[3][5] = 285.0;
        }

        Component.onCompleted: {
            initDigit_6();
        }
    }

    BezierDigit { // Digit 7
        id: digit7
        vertexX: 108.0;
        vertexY: 52.0;

        function initDigit_7() {
            console.log("init 7")
            controls[0] = new Array(6);
            controls[0][0] = 168.0;
            controls[0][1] = 34.0;
            controls[0][2] = 245.0;
            controls[0][3] = 42.0;
            controls[0][4] = 312.0;
            controls[0][5] = 38.0;
            controls[1] = new Array(6);
            controls[1][0] = 379.0;
            controls[1][1] = 34.0;
            controls[1][2] = 305.0;
            controls[1][3] = 145.0;
            controls[1][4] = 294.0;
            controls[1][5] = 166.0;
            controls[2] = new Array(6);
            controls[2][0] = 283.0;
            controls[2][1] = 187.0;
            controls[2][2] = 243.0;
            controls[2][3] = 267.0;
            controls[2][4] = 231.0;
            controls[2][5] = 295.0;
            controls[3] = new Array(6);
            controls[3][0] = 219.0;
            controls[3][1] = 323.0;
            controls[3][2] = 200.0;
            controls[3][3] = 388.0;
            controls[3][4] = 198.0;
            controls[3][5] = 452.0;
        }

        Component.onCompleted: {
            initDigit_7();
        }
    }

    BezierDigit { // Digit 8
        id: digit8
        vertexX: 243.0;
        vertexY: 242.0;

        function initDigit_8() {
            console.log("init 8")
            controls[0] = new Array(6);
            controls[0][0] = 336.0;
            controls[0][1] = 184.0;
            controls[0][2] = 353.0;
            controls[0][3] = 52.0;
            controls[0][4] = 240.0;
            controls[0][5] = 43.0;
            controls[1] = new Array(6);
            controls[1][0] = 127.0;
            controls[1][1] = 34.0;
            controls[1][2] = 143.0;
            controls[1][3] = 215.0;
            controls[1][4] = 225.0;
            controls[1][5] = 247.0;
            controls[2] = new Array(6);
            controls[2][0] = 307.0;
            controls[2][1] = 279.0;
            controls[2][2] = 403.0;
            controls[2][3] = 427.0;
            controls[2][4] = 248.0;
            controls[2][5] = 432.0;
            controls[3] = new Array(6);
            controls[3][0] = 93.0;
            controls[3][1] = 437.0;
            controls[3][2] = 124.0;
            controls[3][3] = 304.0;
            controls[3][4] = 217.0;
            controls[3][5] = 255.0;
        }

        Component.onCompleted: {
            initDigit_8();
        }
    }

    BezierDigit { // Digit 9
        id: digit9
        vertexX: 243.0;
        vertexY: 242.0;

        function initDigit_9() {
            console.log("init 9")
            controls[0] = new Array(6);
            controls[0][0] = 323.0;
            controls[0][1] = 6.0;
            controls[0][2] = 171.0;
            controls[0][3] = 33.0;
            controls[0][4] = 151.0;
            controls[0][5] = 85.0;
            controls[1] = new Array(6);
            controls[1][0] = 131.0;
            controls[1][1] = 137.0;
            controls[1][2] = 161.0;
            controls[1][3] = 184.0;
            controls[1][4] = 219.0;
            controls[1][5] = 190.0;
            controls[2] = new Array(6);
            controls[2][0] = 277.0;
            controls[2][1] = 196.0;
            controls[2][2] = 346.0;
            controls[2][3] = 149.0;
            controls[2][4] = 322.0;
            controls[2][5] = 122.0;
            controls[3] = new Array(6);
            controls[3][0] = 298.0;
            controls[3][1] = 95.0;
            controls[3][2] = 297.0;
            controls[3][3] = 365.0;
            controls[3][4] = 297.0;
            controls[3][5] = 448.0;
        }

        Component.onCompleted: {
            initDigit_9();
        }
    }
}
