import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: window
    width: 1280
    height: 720
    visible: true

    FontLoader {
        source: "CenturyGothic.ttf"
    }

    Speedometer {
        id: speedometer
        width: Math.min(window.height, window.width)
        height: width
        anchors.centerIn: parent
    }
}
