import QtQuick 2.0

import "../.."
import "../../Util"

Rectangle {
    width: 2 * radius
    height: 2 * radius
    color: Constants.gaugeBackgroundColor

    property double throttle: 0

    Tachometer {
        value: throttle
        anchors {
            fill: parent
            margins: 0
        }
    }

    GoodInnerShadow {
        source: parent
        color: "#99000000"
        spread: 0.5
        radius: 0.1 * parent.radius
    }
}
