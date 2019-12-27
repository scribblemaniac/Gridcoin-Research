/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Quick Controls 2 module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Templates 2.12 as T
import MMPTheme 1.0

T.ComboBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding)

    padding: 5
    leftPadding: padding + 5

    delegate: ItemDelegate {
        width: parent.width
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        palette.text: control.palette.text
        palette.highlightedText: control.palette.highlightedText
        font.weight: control.currentIndex === index ? Font.DemiBold : Font.Normal
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled
    }

    indicator: Image {
        x: parent.width - width - parent.padding
        y: parent.height / 2 - height / 2
        source: MMPTheme.sw("qrc:/resources/icons/generic/ic_chevron_down_light.svg", "qrc:/resources/icons/generic/ic_chevron_down_dark.svg")
        opacity: !control.enabled ? 0.3 : (control.activeFocus ? 1 : 0.7)
    }

    contentItem: T.TextField {
        text: control.editable ? control.editText : control.displayText
        font: MMPTheme.font

        enabled: control.editable
        autoScroll: control.editable
        readOnly: control.down
        inputMethodHints: control.inputMethodHints
        validator: control.validator

        color: MMPTheme.translucent(MMPTheme.sw(MMPTheme.cOxfordBlue, MMPTheme.cWhite), !control.enabled ? 0.3 : (control.activeFocus ? 1 : 0.7))
        selectionColor: control.palette.highlight
        selectedTextColor: control.palette.highlightedText
        verticalAlignment: Text.AlignVCenter
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

    popup: T.Popup {
        y: control.height
        width: control.width
        height: Math.min(contentItem.implicitHeight, control.Window.height - topMargin - bottomMargin)
        topMargin: 6
        bottomMargin: 6

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            highlightMoveDuration: 0

            Rectangle {
                z: 10
                width: parent.width
                height: parent.height
                color: "transparent"
                border.color: control.palette.mid
            }

            T.ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {
            color: control.palette.window
        }
    }
}
