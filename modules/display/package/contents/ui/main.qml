/**
 * SPDX-FileCopyrightText: 2020 Tobias Fella <fella@posteo.de>
 * SPDX-FileCopyrightText: 2021 Rui Wang <wangrui@jingos.com>
 * SPDX-License-Identifier: GPL-2.0-only OR GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL
 */

import org.kde.kcm 1.2 as KCM
import QtQuick.Layouts 1.2
import QtQuick.Window 2.2
import QtQuick 2.7
import QtQuick.Controls 2.2
import org.kde.kirigami 2.15 as Kirigami

Item {
    id: main

    property int screenWidth: Screen.width
    property int screenHeight: Screen.height
    property real appScale: 1.3 * screenWidth / 1920
    property int appFontSize: theme.defaultFont.pointSize
    anchors.fill:parent 

    StackView {
        id: stack

        anchors.fill: parent

        Component.onCompleted: {
            stack.push(display_view)
        }
    }

    Component {
        id: display_view

        Display {}
    }

    Component {
        id: fonts_detail_view

        Submenu {}
    }

    function gotoPage(name) {
        
        console.log("display gotoPage : ", name)

        if (name == "display_view") {
            stack.push(time_view)
        } else if (name == "fonts_detail_view") {
            stack.push(fonts_detail_view)
        } 
    }

    function popView() {
        stack.pop()
    }
}

