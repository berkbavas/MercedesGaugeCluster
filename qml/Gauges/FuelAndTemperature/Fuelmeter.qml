import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

import "../.."
import "../../Util"

CircularGauge {
    minimumValue: 0
    maximumValue: 100
    value: 15
    stepSize: 1

    style: CircularGaugeStyle {
        id: style
        minimumValueAngle: 130
        maximumValueAngle: 40
        tickmarkStepSize: 50
        labelStepSize: 50
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

        needle: Canvas {
            width: 6 / 90 * outerRadius
            height: 70 / 90 * outerRadius
            antialiasing: true
            onPaint: {
                var ctx = getContext('2d')

                var gradient = ctx.createLinearGradient(0, height / 2, width, height / 2)
                gradient.addColorStop(0, '#fea041')
                gradient.addColorStop(1, '#cd5c0b')

                ctx.fillStyle = gradient
                ctx.beginPath()
                ctx.moveTo(0.25 * width, 0)
                ctx.lineTo(0.75 * width, 0)
                ctx.lineTo(width, height)
                ctx.lineTo(0, height)
                ctx.closePath()
                ctx.fill()
            }
        }

        background: Item {
            width: 2 * outerRadius
            height: 2 * outerRadius

            Image {
                id: image
                x: 1.20 * outerRadius
                y: 0.075 * outerRadius
                width: 0.1675 * outerRadius
                height: 0.20 * outerRadius
                source: "qrc:/resources/indicators/fuel.svg"
                antialiasing: true
                visible: false
            }

            ColorOverlay {
                anchors.fill: image
                source: image
                color: "#ffffff"
                antialiasing: true
            }
        }
    }
}
