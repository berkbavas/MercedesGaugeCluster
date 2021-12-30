import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

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

        tickmark: Rectangle {
            color: "transparent"
            width: 5 / 90 * outerRadius
            height: 16.0 / 90 * outerRadius
            antialiasing: true
        }

        minorTickmark: Rectangle {
            color: "transparent"
            width: 3 / 90 * outerRadius
            height: 16.0 / 90 * outerRadius
            antialiasing: true
        }

        tickmarkLabel: Text {
            font.family: "Century Gothic"
            font.pixelSize: Math.max(6, outerRadius * 0.175)
            text: styleData.value === 50 ? "1/2" : styleData.value === 100 ? "1/1" : styleData.value
            antialiasing: true
            color: "#ffffff"
            font.weight: Font.Black
        }

        foreground: Item {
            Rectangle {
                id: foreground
                width: 30.0 / 90 * outerRadius
                height: 30.0 / 90 * outerRadius
                radius: 15.0 / 90 * outerRadius
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
            width: 6 / 90 * outerRadius
            height: 70 / 90 * outerRadius
            antialiasing: true
            onPaint: {
                var ctx = getContext('2d')

                var gradient = ctx.createLinearGradient(0,
                                                        height / 2,
                                                        width,
                                                        height / 2)

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
            id: root
            width: 2 * outerRadius
            height: 2 * outerRadius

            Image {
                id: fuel
                x: 1.20 * outerRadius
                y: 0.075 * outerRadius
                width: 5 * 0.0335 * outerRadius
                height: 6 * 0.0335 * outerRadius
                source: "Resources/Indicators/fuel.svg"
                antialiasing: true
                visible: false
            }

            ColorOverlay {
                anchors.fill: fuel
                source: fuel
                color: "#ffffff"
                antialiasing: true
            }
        }
    }
}
