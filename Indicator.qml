import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    id: root
    property string type

    Image {
        id: image
        anchors.fill: parent
        source: "../Resources/Indicators/" + type + ".svg"
        antialiasing: true
        fillMode: Image.PreserveAspectFit
        visible: false
    }

    ColorOverlay {
        anchors.fill: image
        source: image
        color: "#9c9c9c"
        antialiasing: true
    }
}
