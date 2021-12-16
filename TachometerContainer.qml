import QtQuick 2.0

Rectangle {
    id: container
    width: 2 * radius
    height: 2 * radius
    color: "#181818"

    Tachometer {
        anchors {
            fill: parent
            margins: 0
        }
    }

    DepthMaker {
        anchors.fill: parent
    }
}
