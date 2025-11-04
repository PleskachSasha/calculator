import QtQuick

Rectangle {
    id: button
    radius: 20
    color: "#d6d5d5"
    border.color: "#3d3f44"
    border.width: 2

    property string buttonText: ""

    signal clicked(string text)

    MouseArea {
        anchors.fill: parent
        onClicked: {
            button.clicked(buttonText)
        }
    }

    Text {
        id:text
        anchors.centerIn: parent
        text: buttonText
        font.pixelSize: 40
        color: "#333"
        font.bold: true
    }
}
