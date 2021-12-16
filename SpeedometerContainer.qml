import QtQuick 2.0

Rectangle {
    id: container
    width: 2 * radius
    height: 2 * radius
    color: "#181818"

    Speedometer {
        anchors {
            fill: parent
            margins: 0
        }
    }

    Rectangle {
        x: container.radius - 0.5 * width
        y: 1.55 * container.radius
        width: 0.6 * container.radius
        height: 0.2 * container.radius
        radius: 0.02 * container.radius
        color: "#282828"

        GoodInnerShadow {
            source: parent
            color: "#aa000000"
            spread: .35
            radius: 0.07 * container.radius
        }
    }

    DepthMaker {
        anchors.fill: parent
    }
}
