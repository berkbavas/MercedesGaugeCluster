import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import "../.."
import "../../Util"

CircularGauge {
    minimumValue: 0
    maximumValue: 240
    stepSize: 1

    style: CircularGaugeStyle {
        id: style
        minimumValueAngle: -130
        maximumValueAngle: 130
        tickmarkStepSize: 20
        labelStepSize: 20
        minorTickmarkCount: 1
        labelInset: 22 / 90 * outerRadius

        tickmark: Rectangle {
            color: Constants.tickmarkColor
            width: 2.5 / 90 * outerRadius
            height: 12.0 / 90 * outerRadius
            antialiasing: true
        }

        minorTickmark: Rectangle {
            color: Constants.tickmarkColor
            width: 1.5 / 90 * outerRadius
            height: 12.0 / 90 * outerRadius
            antialiasing: true
        }

        tickmarkLabel: Text {
            font.family: Constants.font
            font.pixelSize: styleData.value === 10 ? Math.max(6, outerRadius * 0.05) : Math.max(6, outerRadius * 0.125)
            text: styleData.value
            antialiasing: true
            color: Constants.labelColor
            font.weight: Font.Black
        }

        foreground: Foreground {
            outerRadius: style.outerRadius
        }

        needle: Neddle {
            outerRadius: style.outerRadius
            width: 5.0 / 90 * outerRadius
            height: 82.0 / 90 * outerRadius
        }

        background: Item {
            width: 2 * outerRadius
            height: 2 * outerRadius

            Canvas {
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.reset()

                    ctx.strokeStyle = "#d32300"
                    ctx.lineWidth = 12.0 / 90 * outerRadius

                    ctx.beginPath()
                    ctx.arc(outerRadius, outerRadius,
                            outerRadius - ctx.lineWidth / 2, degreesToRadians(valueToAngle(30) - 90), degreesToRadians(valueToAngle(35) - 90))
                    ctx.stroke()

                    ctx.beginPath()
                    ctx.arc(outerRadius, outerRadius,
                            outerRadius - ctx.lineWidth / 2, degreesToRadians(valueToAngle(50) - 90), degreesToRadians(valueToAngle(60) - 90))

                    ctx.stroke()
                }
            }

            Text {
                x: 0
                y: 0.5 * outerRadius
                width: 2 * outerRadius
                font.family: Constants.font
                font.pixelSize: Math.max(6, outerRadius * 0.075)
                text: "km/h"
                antialiasing: true
                color: Constants.labelColor
                font.weight: Font.Black
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    function degreesToRadians(degrees) {
        return degrees * (Math.PI / 180)
    }
}
