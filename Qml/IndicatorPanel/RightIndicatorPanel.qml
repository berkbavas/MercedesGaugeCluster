import QtQuick 2.15

import ".."
import "../Util"

Item {
    id: panel

    property double scaling: 1.0

    Row {
        anchors.centerIn: parent
        spacing: 8 * scaling

        Indicator {
            type: "lamp"
            scaling: panel.scaling
            lightColor: Constants.indicatorInfoColor
            lightOn: drivingData.lamp
        }

        Indicator {
            type: "abs"
            scaling: panel.scaling
            lightColor: Constants.indicatorErrorColor
            lightOn: drivingData.abs
        }

        Indicator {
            type: "park"
            scaling: panel.scaling
            lightColor: Constants.indicatorInfoColor
            lightOn: drivingData.park
        }

        Indicator {
            type: "shelter-belt"
            scaling: panel.scaling
            lightColor: Constants.indicatorWarningColor
            lightOn: drivingData.shelterBelt
        }

        Indicator {
            type: "caution"
            scaling: panel.scaling
            lightColor: Constants.indicatorErrorColor
            lightOn: drivingData.caution
        }
    }
}
