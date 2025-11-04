import QtQuick
import QtQuick.Layouts

RowLayout {
    id: row
    property var buttons: []

    Layout.fillWidth: true
    Layout.fillHeight: true
    spacing: 15

    signal clicked(string text)

    Repeater {
        model: buttons
        CalcButton {
            buttonText: modelData
            Layout.fillWidth: true
            Layout.fillHeight: true

            onClicked: (text) => {
                row.clicked(text)
            }
        }
    }
}
