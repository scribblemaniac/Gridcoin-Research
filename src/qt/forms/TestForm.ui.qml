import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Item {
    id: element
    width: 800
    height: 200

    Rectangle {
        id: background
        color: "#e2e2e2"
        anchors.fill: parent
        border.width: 0
    }

    Rectangle {
        id: rectangle
        color: "#ffffff"
        radius: 5
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.topMargin: 10
        anchors.bottom: button.top
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        border.width: 0

        GridLayout {
            id: gridLayout
            columnSpacing: 10
            rowSpacing: 10
            rows: 3
            columns: 4
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 10
            anchors.fill: parent

            Label {
                id: recipientLabel
                text: qsTr("Recipient:")
                Layout.columnSpan: 1
            }

            TextInput {
                id: recipientInput
                width: 80
                height: 20
                text: qsTr("Text Input")
                Layout.fillWidth: true
                font.pixelSize: 12
            }

            Button {
                id: recipientButton2
                text: qsTr("Button")
            }

            Button {
                id: recipientButton1
                text: qsTr("Button")
            }

            Label {
                id: messageLabel
                text: qsTr("Message:")
            }

            TextInput {
                id: messageInput
                width: 80
                height: 20
                text: qsTr("Text Input")
                Layout.fillWidth: true
                Layout.columnSpan: 2
                Layout.rowSpan: 1
                font.pixelSize: 12
            }

            Button {
                id: messageButton
                text: qsTr("Button")
            }

            Label {
                id: labelLabel
                text: qsTr("Label:")
            }

            Frame {
                id: frame
                width: 200
                height: 200
                padding: 0
                Layout.fillHeight: true
                Layout.columnSpan: 3
                Layout.fillWidth: true

                TextInput {
                    id: labelInput
                    text: qsTr("Text Input")
                    anchors.right: amountLabel.left
                    anchors.rightMargin: 10
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.left: parent.left
                    anchors.leftMargin: 0
                    Layout.fillWidth: true
                    font.pixelSize: 12
                }

                Label {
                    id: amountLabel
                    x: 198
                    text: qsTr("Amount:")
                    anchors.right: amountInput.left
                    anchors.rightMargin: 10
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.top: parent.top
                    anchors.topMargin: 0
                }

                SpinBox {
                    id: amountInput
                    x: 262
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.right: amountUnit.left
                    anchors.rightMargin: 10
                    Layout.fillWidth: true
                }

                ComboBox {
                    id: amountUnit
                    x: -150
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                }
            }
        }
    }

    Button {
        id: button
        x: 631
        y: 113
        width: 100
        height: 30
        text: qsTr("Send")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
    }
}




/*##^## Designer {
    D{i:1;anchors_height:200;anchors_width:200;anchors_x:54;anchors_y:169}D{i:13;anchors_height:20;anchors_x:137;anchors_y:-128}
D{i:14;anchors_x:198;anchors_y:-130}D{i:15;anchors_y:-141}D{i:16;anchors_y:29}D{i:3;anchors_height:100;anchors_width:100;anchors_x:123;anchors_y:153}
D{i:2;anchors_height:100;anchors_width:200}
}
 ##^##*/
