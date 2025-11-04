import QtQuick
import QtQuick.Layouts

Window {
    id: window
    visible: true
    title: qsTr("Calculator")

    width: 520
    height: 720
    minimumWidth: 320
    minimumHeight: 480
    maximumWidth: 800
    maximumHeight: 1100

    Calculator {
        anchors.fill: parent
    }
}
