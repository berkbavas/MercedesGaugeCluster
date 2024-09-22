import QtQuick 2.15

import "../Util"

Item {
    width: 760 * scaling
    height: 64 * scaling

    property double scaling: 1.0
    property bool leftSignal: true
    property bool rightSignal: true

    SignalArrow {
        id: leftArrow
        scaling: parent.scaling
        visible: leftSignal
        anchors.left: parent.left
        angle: 180
    }

    SignalArrow {
        id: rightArrow
        scaling: parent.scaling
        visible: rightSignal
        anchors.right: parent.right
    }

    GoodInnerShadow {
        source: leftArrow
        anchors.fill: leftArrow
        color:  "#7f000000"
        radius: 8
        spread: 0.5
    }


    GoodInnerShadow {
        source: rightArrow
        anchors.fill: rightArrow
        color:  "#7f000000"
        radius: 8
        spread: 0.5
    }
}
