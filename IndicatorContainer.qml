import QtQuick 2.0

Rectangle {
    id: root
    radius: 0.1 * height
    color: "#222222"

    GoodInnerShadow {
        source: parent
        color: "#99000000"
        spread: .5
        radius: 0.2 * root.height
    }
}
