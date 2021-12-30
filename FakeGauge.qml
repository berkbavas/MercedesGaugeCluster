import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

CircularGauge {
    minimumValue: -115
    maximumValue: 115
    value: 0
    stepSize: 1

    function degreesToRadians(degrees) {
        return degrees * (Math.PI / 180)
    }


    style: CircularGaugeStyle {
        id: style
        minimumValueAngle: -115
        maximumValueAngle: 115
        tickmarkStepSize: 1
        labelStepSize: 50
        minorTickmarkCount: 0

        tickmark: Rectangle {
            color: "#ffffff"
            antialiasing: true

            height: {
                if (styleData.value === 87)
                    return 13.0 / 90 * outerRadius
                else
                    return 16.0 / 90 * outerRadius
            }

            visible: {
                if (Math.abs(styleData.value) === 115)
                    return true
                else if (Math.abs(styleData.value) === 101)
                    return true
                else if (Math.abs(styleData.value) === 87)
                    return true
                else if (Math.abs(styleData.value) === 74)
                    return true
                else if (Math.abs(styleData.value) === 59)

                    return true
                else
                    false
            }

            width: {
                if (Math.abs(styleData.value) === 101)
                    return 2 / 90 * outerRadius
                else if (Math.abs(styleData.value) === 74)
                    return 2 / 90 * outerRadius
                else
                    return 4 / 90 * outerRadius
            }
        }

        background: Item {
            id: root
            width: 2 * outerRadius
            height: 2 * outerRadius

            Canvas {
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d")
                    ctx.reset()

                    ctx.strokeStyle = "#d32300"
                    ctx.lineWidth = 16.0 / 90 * outerRadius

                    ctx.beginPath()
                    ctx.arc(outerRadius,
                            outerRadius,
                            outerRadius - ctx.lineWidth / 2,
                            degreesToRadians(valueToAngle(-58) - 90),
                            degreesToRadians(valueToAngle(-54) - 90))
                    ctx.stroke()

                    ctx.stroke()
                }
            }

            Rectangle {
                x: outerRadius - 0.5 * width
                y: 1.55 * outerRadius
                width: 0.4 * outerRadius
                height: 0.225 * outerRadius
                radius: 0.02 * outerRadius
                color: "#282828"

                GoodInnerShadow {
                    source: parent
                    color: "#aa000000"
                    spread: .35
                    radius: 0.07 * outerRadius
                }
            }
        }

        tickmarkLabel: Item {}

        foreground: Item {}

        needle: Item {}
    }
}
