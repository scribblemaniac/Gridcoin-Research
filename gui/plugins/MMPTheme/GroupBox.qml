import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import QtGraphicalEffects 1.0
import MMPTheme 1.0

T.GroupBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding,
                            implicitLabelWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding + label.height + spacing)

    spacing: 10
    padding: 15
    topPadding: padding
    //topPadding: padding + (implicitLabelWidth > 0 ? implicitLabelHeight + spacing : 0)

    label: Text {
        anchors.top: parent.top
        anchors.topMargin: parent.padding
        anchors.left: parent.left
        anchors.leftMargin: parent.padding
        anchors.right: parent.right
        anchors.rightMargin: parent.padding

        text: control.title
        font.family: MMPTheme.font.family
        font.pointSize: 11
        font.weight: Font.DemiBold
        color: MMPTheme.sw(MMPTheme.cOxfordBlue, MMPTheme.cLilyWhite)
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter
    }

    // TODO Add separator

    contentItem.anchors.top: control.label.bottom
    contentItem.anchors.topMargin: control.spacing

    background: Item {
        anchors.fill: parent

        Rectangle {
            id: background
            anchors.fill: parent

            color: MMPTheme.sw(MMPTheme.cWhite, MMPTheme.cMirage)
            radius: 4
            border.width: 0
        }

        DropShadow {
            anchors.fill: parent
            verticalOffset: 1
            radius: 0
            color: MMPTheme.sw("#0d000000", "#4d000000")
            source: background
        }
    }
}
