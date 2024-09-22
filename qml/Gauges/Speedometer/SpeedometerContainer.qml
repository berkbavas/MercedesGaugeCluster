import QtQuick 2.0

import "../.."
import "../../Util"

Rectangle {
    width: 2 * radius
    height: 2 * radius
    color: Constants.gaugeBackgroundColor

    property double speed: 0

    Speedometer {
        value: speed

        anchors {
            fill: parent
            margins: 0
        }
    }

    Rectangle {
        x: parent.radius - 0.5 * width
        y: 1.55 * parent.radius
        width: 0.6 * parent.radius
        height: 0.2 * parent.radius
        radius: 0.02 * parent.radius
        color: Constants.indicatorContainerBackgroundColor

        GoodInnerShadow {
            source: parent
            color: "#99000000"
            spread: 0.5
            radius: 0.1 * height
        }
    }

    GoodInnerShadow {
        source: parent
        color: "#99000000"
        spread: 0.5
        radius: 0.1 * parent.radius
    }

}
