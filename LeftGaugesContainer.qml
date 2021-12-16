import QtQuick 2.0

Rectangle {
    id: container
    width: 2 * radius
    height: 2 * radius
    color: "#181818"

    FakeGauge {
        anchors.fill: parent
    }

    TemperatureMeter {
        width: 1.5 * container.radius
        height: 1.5 * container.radius
        anchors {
            left: container.left
            verticalCenter: container.verticalCenter
        }
    }

    Fuelmeter {
        width: 1.5 * container.radius
        height: 1.5 * container.radius
        anchors {
            right: container.right
            verticalCenter: container.verticalCenter
        }
    }

    DepthMaker {
        anchors.fill: parent
    }
}
