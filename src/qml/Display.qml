import QtQuick
import QtQuick.Layouts

Rectangle {
    id: display
    radius: 20
    color: "#3d3f44"

    property string displayText: ""
    property string lastOperation: ""

    Text {
        anchors.left: display.left
        anchors.top: display.top
        anchors.margins: 20
        height: parent.height / 2

        font.pixelSize: 18
        text: lastOperation
        color: "#ecebec"
    }

    Text {
        anchors.right: display.right
        anchors.verticalCenter: display.verticalCenter
        anchors.margins: 20

        font.pixelSize: 40
        text: displayText
        color: "#ecebec"
    }
}

