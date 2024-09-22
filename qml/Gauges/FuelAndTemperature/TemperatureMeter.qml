import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import "../.."
import "../../Util"

CircularGauge {
    minimumValue: 40
    maximumValue: 120
    value: 55
    stepSize: 1

    style: CircularGaugeStyle {
        id: style
        minimumValueAngle: -130
        maximumValueAngle: -40
        tickmarkStepSize: 40
        labelStepSize: 40
        minorTickmarkCount: 1

        labelInset: 34 / 90 * outerRadius

        tickmark: Item {}

        minorTickmark: Item {}

        tickmarkLabel: Text {
            font.family: Constants.font
            font.pixelSize: Math.max(6, outerRadius * 0.175)
            text: styleData.value === 50 ? "1/2" : styleData.value === 100 ? "1/1" : styleData.value
            antialiasing: true
            color: Constants.tickmarkColor
            font.weight: Font.Black
        }

        foreground: Foreground {
            outerRadius: style.outerRadius
        }

        needle: Neddle {
            outerRadius: style.outerRadius
        }

        background: Item {
            width: 2 * outerRadius
            height: 2 * outerRadius

            Image {
                id: iamge
                x: 0.6 * outerRadius
                y: 0.075 * outerRadius
                width: 0.1875 * outerRadius
                height: 0.225 * outerRadius
                source: "qrc:/resources/indicators/temperature.svg"
                antialiasing: true
                visible: false
            }

            ColorOverlay {
                anchors.fill: iamge
                source: iamge
                color: "#ffffff"
                antialiasing: true
            }
        }
    }
}
