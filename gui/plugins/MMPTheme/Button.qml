import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import MMPTheme 1.0

T.Button {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: 4
    spacing: 4

    property bool active: visualFocus || hovered

    icon.width: 16
    icon.height: 16
    icon.color: control.checked || control.highlighted ? control.palette.brightText :
                control.flat && !control.down ? (control.visualFocus ? control.palette.highlight : control.palette.windowText) : control.palette.buttonText

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: MMPTheme.font
        color: MMPTheme.sw(MMPTheme.cOxfordBlue, MMPTheme.cWhite)

        opacity: !control.enabled ? 0.3 : (control.down ? 1 : 0.7)
    }

    background: Rectangle {
        implicitWidth: control.text != "" ? 100 : 24
        implicitHeight: 24
        visible: !control.flat || control.down || control.checked || control.highlighted
        color: MMPTheme.sw(MMPTheme.cWhite, control.enabled ? MMPTheme.cHavelockBlue : MMPTheme.cOxfordOffBlue)

        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0; color: control.active && !control.down ? MMPTheme.sw(MMPTheme.cLilyWhite, "#1991eb") : MMPTheme.sw(MMPTheme.cWhite, "#2da1f8") }
            GradientStop { position: 1; color: control.active && !control.down ? MMPTheme.sw(MMPTheme.cWhite, "#2da1f8") : MMPTheme.sw(MMPTheme.cLilyWhite, "#1991eb") }
        }

        border.color: MMPTheme.sw(MMPTheme.combine(MMPTheme.translucent(MMPTheme.cOxfordBlue, !control.enabled ? 0.2 : (control.down ? 0.7 : (control.active ? 0.5 : 0.3))), color),
                                  MMPTheme.combine(MMPTheme.translucent(MMPTheme.cBlack, control.enabled && (control.active || control.down) ? 0.15 : 0.05), color))
        border.width: 1
        radius: 4
    }
}
