import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import "../.."
import "../../Util"

CircularGauge {
    minimumValue: 0
    maximumValue: 70
    stepSize: 1

    style: CircularGaugeStyle {
        id: style
        minimumValueAngle: -130
        maximumValueAngle: 130
        tickmarkStepSize: 10
        labelStepSize: 10
        minorTickmarkCount: 1

        labelInset: 24 / 90 * outerRadius

        tickmark: Rectangle {
            color: Constants.tickmarkColor
            width: 3.0 / 90 * outerRadius
            height: 14.0 / 90 * outerRadius
            antialiasing: true
        }

        minorTickmark: Rectangle {
            color: Constants.tickmarkColor
            width: 2.0 / 90 * outerRadius
            height: 14.0 / 90 * outerRadius
            antialiasing: true
        }

        tickmarkLabel: Text {
            font.family: Constants.font
            font.pixelSize: Math.max(6, outerRadius * 0.15)
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
        }

        background: Rectangle {
            id: root
            width: 2 * outerRadius
            height: 2 * outerRadius
            radius: outerRadius
            color: Constants.gaugeBackgroundColor

            Canvas {
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.reset()
                    ctx.lineWidth = 12.0 / 90 * outerRadius
                    ctx.beginPath()
                    ctx.arc(outerRadius, outerRadius,
                            outerRadius - ctx.lineWidth / 2, degreesToRadians(valueToAngle(62.5) - 90), degreesToRadians(valueToAngle(70) - 90))
                    ctx.strokeStyle = "#d32300"
                    ctx.stroke()
                }
            }

            Text {
                x: 0
                y: 0.5 * outerRadius
                width: 2 * outerRadius
                font.family: Constants.font
                font.pixelSize: Math.max(6, outerRadius * 0.09)
                text: "x100 RPM"
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
