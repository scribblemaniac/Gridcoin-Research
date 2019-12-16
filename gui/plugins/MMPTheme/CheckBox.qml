import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import MMPTheme 1.0

// TODO Consider adding check.down indicators
T.CheckBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)
    //padding: 6
    spacing: 5

    property bool active: visualFocus || hovered

    // keep in sync with CheckDelegate.qml (shared CheckIndicator.qml was removed for performance reasons)
    indicator: Rectangle {
        implicitWidth: 16
        implicitHeight: 16

        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2

        color: control.checked ? MMPTheme.sw(MMPTheme.translucent(MMPTheme.cBluePurple, 0.7), MMPTheme.cHavelockBlue) : MMPTheme.cMissing

        border.width: 1
        border.color: MMPTheme.combine(MMPTheme.translucent(MMPTheme.cOxfordBlue, control.active ? 0.7 : 0.3), control.checked ? MMPTheme.sw(MMPTheme.cBluePurple, MMPTheme.cHavelockBlue) : MMPTheme.cWhite)
        radius: 4

        Image {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            source: "qrc:/resources/icons/generic/ic_checkbox_tick.svg"
            visible: control.checked
        }

        property Gradient backgroundGradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { position: 0; color: control.active ? MMPTheme.cWhite : MMPTheme.cLilyWhite }
            GradientStop { position: 1; color: control.active ? MMPTheme.cLilyWhite : MMPTheme.cWhite }
        }

        gradient: !control.checked ? backgroundGradient : null
    }

    contentItem: CheckLabel {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
        font: MMPTheme.font
        color: MMPTheme.textColor
    }
}
