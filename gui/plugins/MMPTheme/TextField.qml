import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import MMPTheme 1.0

T.TextField {
    id: control

    implicitWidth: implicitBackgroundWidth + leftInset + rightInset
                   || Math.max(contentWidth, placeholder.implicitWidth) + leftPadding + rightPadding
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding,
                             placeholder.implicitHeight + topPadding + bottomPadding)

    padding: 5
    leftPadding: padding + 5

    color: MMPTheme.translucent(MMPTheme.sw(MMPTheme.cOxfordBlue, MMPTheme.cWhite), !control.enabled ? 0.3 : (control.activeFocus ? 1 : 0.7))
    selectionColor: control.palette.highlight
    selectedTextColor: control.palette.highlightedText
    placeholderTextColor: Color.transparent(control.color, 0.5)
    verticalAlignment: TextInput.AlignVCenter

    font: MMPTheme.font

    PlaceholderText {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.leftPadding + control.rightPadding)
        height: control.height - (control.topPadding + control.bottomPadding)

        text: control.placeholderText
        font: control.font
        color: MMPTheme.translucent(MMPTheme.sw(MMPTheme.cOxfordBlue, MMPTheme.cWhite), 0.3)
        verticalAlignment: control.verticalAlignment
        visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
        elide: Text.ElideRight
        renderType: control.renderType
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 24
        border.width: 1
        radius: 4
        color: MMPTheme.sw(MMPTheme.cWhite, MMPTheme.cOxfordOffBlue)
        border.color: MMPTheme.combine(MMPTheme.sw(MMPTheme.translucent(MMPTheme.cOxfordBlue, !control.enabled ? 0.2 : (control.activeFocus ? 0.7 : 0.3)),
                                                   control.activeFocus ? MMPTheme.translucent(MMPTheme.cWhite, 0.7) : MMPTheme.translucent(MMPTheme.cOxfordBlue, control.enabled ? 1 : 0.3)), color);
    }
}
