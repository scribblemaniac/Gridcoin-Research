import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import MMPTheme 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Label {
        text: qsTr("Hello, world")
    }
}
