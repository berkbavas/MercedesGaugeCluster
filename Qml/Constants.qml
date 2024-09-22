pragma Singleton

import QtQuick 2.6

QtObject {
    readonly property string font: "Century Gothic"
    readonly property string ledFont: "Odibee Sans"
    readonly property string tickmarkColor: "#ffffff"
    readonly property string labelColor: "#ffffff"
    readonly property string gaugeBackgroundColor: "#181818"

    readonly property string indicatorColor: "#ffffff"
    readonly property string indicatorColorLightOn: "#ffffff"
    readonly property string indicatorContainerBackgroundColor: "#282828"

    readonly property string indicatorInfoColor: "#19FF00"
    readonly property string indicatorWarningColor: "#FF8712"
    readonly property string indicatorErrorColor: "#EB2E20"

    readonly property string signalColor: "#19FF00"
}
