import QtQuick
import QtQuick.Layouts

Rectangle {
    id: calculator
    visible: true

    width: 520
    height: 720

    color: "#d6d5d5"

    property bool secondSign: false;
    property bool pressedEqual: false;
    property bool pressedC: false;

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 10

        Display {
            id: display
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 1
        }

        ColumnLayout {
            id: buttonsColumn
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight: 4
            spacing: 10

            property var buttonRows: [
               ["C", "/", "*", "-"],
               ["7", "8", "9", "+"],
               ["4", "5", "6", "."],
               ["1", "2", "3", "0"],
               ["="]
            ]

            Repeater {
                model: buttonsColumn.buttonRows

                CalcRow {
                    buttons: modelData
                    onClicked: (text) => handleButtonClick(text)
                }
            }
        }
    }

    function handleButtonClick(text) {
        const lastChar = display.displayText.slice(-1);
        const operators = ["/", "*", "-", "+"];
        const isOperator = operators.includes(text);
        const lastIsOperator = operators.includes(lastChar);

        if (isOperator) {
            if (display.displayText.length === 0 && text !== "-") {
                return;
            }

            if (display.displayText.length === 1 && display.displayText === "-" && text !== "-") {
                return;
            }

            if (lastIsOperator) {
                display.displayText = display.displayText.slice(0, -1) + text;
                return;
            }
        }
        if (text === "=" && (lastIsOperator || pressedEqual)) {
            return;
        }
        if (text === "." && lastChar === ".") {
            return;
        }
        if (display.displayText.length === 0 && pressedEqual && !pressedC) {
            return;
        }

        if (text === "C") {
            display.displayText = "";
            display.lastOperation = "";
            secondSign = false;
            pressedC = true;
            return;
        }

        if (text === "=") {
            display.lastOperation = display.displayText;
            display.displayText = calculator_service.evaluate(display.displayText);
            secondSign = false;
            pressedEqual = true;
            pressedC = false;
            return;
        }

        if (secondSign && isOperator) {
            display.lastOperation = display.displayText;
            display.displayText = calculator_service.evaluate(display.displayText) + text;
            pressedC = false;
            return;
        }

        if (pressedEqual) {
            display.displayText = isOperator ? display.displayText + text : text;
            pressedEqual = false;
            secondSign = isOperator;
            pressedC = false;
            return;
        }

        display.displayText += text;
        pressedC = false;
        if (isOperator) {
            secondSign = true;
        }
    }
}
