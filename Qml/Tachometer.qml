import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

CircularGauge {
    minimumValue: 0
    maximumValue: 70
    stepSize: 1

    function degreesToRadians(degrees) {
        return degrees * (Math.PI / 180)
    }

    style: CircularGaugeStyle {
        id: style
        minimumValueAngle: -130
        maximumValueAngle: 130
        tickmarkStepSize: 10
        labelStepSize: 10
        minorTickmarkCount: 1

        labelInset: 24 / 90 * outerRadius

        tickmark: Rectangle {
            color: "#ffffff"
            width: 3 / 90 * outerRadius
            height: 14.0 / 90 * outerRadius
            antialiasing: true
        }

        minorTickmark: Rectangle {
            color: "#ffffff"
            width: 2 / 90 * outerRadius
            height: 14.0 / 90 * outerRadius
            antialiasing: true
        }

        tickmarkLabel: Text {
            font.family: "Century Gothic"
            font.pixelSize: Math.max(6, outerRadius * 0.15)
            text: styleData.value
            antialiasing: true
            color: "#ffffff"
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
            width: 5 / 90 * outerRadius
            height: 78 / 90 * outerRadius
            antialiasing: true
            onPaint: {
                var ctx = getContext('2d')

                var gradient = ctx.createLinearGradient(0, height / 2, width, height / 2)

                gradient.addColorStop(0, '#fea041')
                gradient.addColorStop(1, '#cd5c0b')

                ctx.fillStyle = gradient

                ctx.beginPath()
                ctx.moveTo(0.2 * width, 0)
                ctx.lineTo(0.8 * width, 0)
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
            color: "#181818"

            Canvas {
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.reset()

                    ctx.lineWidth = 12.0 / 90 * outerRadius

                    ctx.beginPath()
                    ctx.arc(outerRadius,
                            outerRadius,
                            outerRadius - ctx.lineWidth / 2,
                            degreesToRadians(valueToAngle(62.5) - 90),
                            degreesToRadians(valueToAngle(70) - 90))
                    ctx.strokeStyle = "#d32300"
                    ctx.stroke()
                }
            }

            Text {
                x: 0
                y: 0.5 * outerRadius
                width: 2 * outerRadius
                font.family: "Century Gothic"
                font.pixelSize: Math.max(6, outerRadius * 0.09)
                text: "x100 RPM"
                antialiasing: true
                color: "#ffffff"
                font.weight: Font.Black
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}
