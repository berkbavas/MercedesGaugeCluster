import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

CircularGauge {

    function degreesToRadians(degrees) {
        return degrees * (Math.PI / 180)
    }

    minimumValue: 0
    maximumValue: 260
    stepSize: 1

    style: CircularGaugeStyle {
        id: style
        minimumValueAngle: -130
        maximumValueAngle: 130
        tickmarkStepSize: 20
        labelStepSize: 10
        minorTickmarkCount: 1

        labelInset: 24.0 / 90 * outerRadius

        tickmark: Rectangle {
            color: "#ffffff"
            width: 2.5 / 90 * outerRadius
            height: 12.0 / 90 * outerRadius
            antialiasing: true
        }

        minorTickmark: Rectangle {
            color: "#ffffff"
            width: 1.5 / 90 * outerRadius
            height: 12.0 / 90 * outerRadius
            antialiasing: true
        }

        tickmarkLabel: Text {
            font.family: "Century Gothic"
            font.pixelSize: styleData.value === 10 ? Math.max(
                                                         6,
                                                         outerRadius * 0.05) : Math.max(
                                                         6, outerRadius * 0.125)
            text: styleData.value === 10 ? "km/h" : styleData.value % 20
                                           === 0 ? styleData.value : ""
            antialiasing: true
            color: "white"
            font.weight: Font.Black
        }

        foreground: Item {
            Rectangle {
                id: foreground
                width: 20.0 / 90 * outerRadius
                height: 20.0 / 90 * outerRadius
                radius: 10.0 / 90 * outerRadius
                anchors.centerIn: parent
                gradient: Gradient {
                    GradientStop {
                        position: 0.0
                        color: "#333333"
                    }
                    GradientStop {
                        position: 1.0
                        color: "#101010"
                    }
                }

                layer.enabled: true
                layer.effect: DropShadow {
                    horizontalOffset: 2 / 90 * outerRadius
                    verticalOffset: 2 / 90 * outerRadius
                    radius: 4 / 90 * outerRadius
                    spread: 0.25
                    samples: 16
                    color: "#000000"
                    source: foreground
                }
            }
        }

        needle: Canvas {
            width: 3.5 / 90 * outerRadius
            height: 82 / 90 * outerRadius
            antialiasing: true
            onPaint: {
                var ctx = getContext('2d')

                var gradient = ctx.createLinearGradient(0, height / 2, width,
                                                        height / 2)

                gradient.addColorStop(0, '#fea041')
                gradient.addColorStop(1, '#cd5c0b')

                ctx.fillStyle = gradient

                ctx.beginPath()
                ctx.moveTo(0.3 * width, 0)
                ctx.lineTo(0.7 * width, 0)
                ctx.lineTo(width, height)
                ctx.lineTo(0, height)
                ctx.closePath()
                ctx.fill()
            }
        }

        background: Rectangle {
            id: root
            width: 2 * outerRadius
            height: 2 * outerRadius
            radius: outerRadius
            color: "#111111"

            Canvas {
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.reset()

                    ctx.strokeStyle = "#d32300"
                    ctx.lineWidth = 12.0 / 90 * outerRadius

                    ctx.beginPath()
                    ctx.arc(outerRadius, outerRadius,
                            outerRadius - ctx.lineWidth / 2, degreesToRadians(
                                valueToAngle(30) - 90), degreesToRadians(
                                valueToAngle(35) - 90))
                    ctx.stroke()

                    ctx.beginPath()
                    ctx.arc(outerRadius, outerRadius,
                            outerRadius - ctx.lineWidth / 2, degreesToRadians(
                                valueToAngle(50) - 90), degreesToRadians(
                                valueToAngle(60) - 90))

                    ctx.stroke()
                }
            }
        }
    }
}
