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
            type: "headlight"
            scaling: panel.scaling
            lightColor: Constants.indicatorInfoColor
            lightOn: drivingData.headlight
        }

        Indicator {
            type: "battery"
            scaling: panel.scaling
            lightColor: Constants.indicatorErrorColor
            lightOn: drivingData.battery
        }

        Indicator {
            type: "wiper"
            scaling: panel.scaling
            lightColor: Constants.indicatorInfoColor
            lightOn: drivingData.wiper
        }

        Indicator {
            type: "battery-low"
            scaling: panel.scaling
            lightColor: Constants.indicatorWarningColor
            lightOn: drivingData.batteryLow
        }

        Indicator {
            type: "oilcup"
            scaling: panel.scaling
            lightColor: Constants.indicatorWarningColor
            lightOn: drivingData.oilCup
        }
    }
}
