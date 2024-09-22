import QtQuick 2.0

import "../.."
import "../../Util"

Rectangle {
    width: 2 * radius
    height: 2 * radius
    color: Constants.gaugeBackgroundColor

    property double temperature: 0
    property double fuel: 0

    Tickmarks {
        anchors.fill: parent
    }

    TemperatureMeter {
        value: temperature
        width: 1.5 * parent.radius
        height: 1.5 * parent.radius
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }
    }

    Fuelmeter {
        value: fuel
        width: 1.5 * parent.radius
        height: 1.5 * parent.radius
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
    }

    GoodInnerShadow {
        source: parent
        color: "#99000000"
        spread: 0.5
        radius: 0.1 * parent.radius
    }
}
