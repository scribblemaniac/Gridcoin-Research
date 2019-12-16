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

    ScrollView {
        id: scrollView
        anchors.fill: parent
        width: parent.width

        Column {
            anchors.fill: parent
            spacing: 15
            padding: 15

            GroupBox {
                width: scrollView.width - 2*parent.padding
                title: qsTr("SpinBox")
                Column {
                    spacing: 5
                    padding: 5
                    anchors.fill: parent

                    SpinBox {
                        value: 50
                    }

                    SpinBox {
                        value: 50
                    }

                    SpinBox {
                        value: 50
                        enabled: false
                    }
                }
            }

            GroupBox {
                width: scrollView.width - 2*parent.padding
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
                        active: true
                    }
                }
            }

            GroupBox {
                width: scrollView.width - 2*parent.padding
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
                        active: true
                    }
                }
            }

            GroupBox {
                width: scrollView.width - 2*parent.padding
                title: qsTr("TextField")
                Column {
                    spacing: 5
                    padding: 5
                    anchors.fill: parent

                    TextField {
                        text: qsTr("Default")
                    }

                    TextField {
                        text: qsTr("Active")
                    }

                    TextField {
                        text: qsTr("Disabled")
                        enabled: false
                    }

                    TextField {
                        placeholderText: qsTr("Placeholder Default")
                    }

                    TextField {
                        placeholderText: qsTr("Placeholder Active")
                    }

                    TextField {
                        placeholderText: qsTr("Placeholder Disabled")
                        enabled: false
                    }
                }
            }
        }
    }
}
