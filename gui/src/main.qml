import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import MMPTheme 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Component Styling Test")

    color: MMPTheme.background

    Column {
        GroupBox {
            title: qsTr("CheckBox")
            Column {
                spacing: 5
                padding: 5
                anchors.fill: parent

                CheckBox {
                    text: qsTr("Selected")
                    checked: true
                }

                CheckBox {
                    text: qsTr("Normal")
                }

                CheckBox {
                    text: qsTr("Hover")
                }
            }
        }

        GroupBox {
            title: qsTr("RadioButton")
            Column {
                spacing: 5
                padding: 5
                anchors.fill: parent

                RadioButton {
                    text: qsTr("Selected")
                    checked: true
                }

                RadioButton {
                    text: qsTr("Normal")
                }

                RadioButton {
                    text: qsTr("Hover")
                }
            }
        }
    }
}
