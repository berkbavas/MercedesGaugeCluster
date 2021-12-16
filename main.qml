import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

Window {
    id: window
    width: 1280
    height: 720
    visible: true
    color: "#101010"

    FontLoader {
        source: "Resources/Fonts/CenturyGothic.ttf"
    }

    Row {
        id: gauges
        height: window.height / 2
        anchors.centerIn: parent
        spacing: 40

        LeftGaugesContainer {
            radius: 0.8 * 0.25 * Math.min(window.height, window.width)
            anchors.bottom: parent.bottom
        }

        SpeedometerContainer {
            radius: 0.25 * Math.min(window.height, window.width)
            anchors.bottom: parent.bottom
        }

        TachometerContainer {
            radius: 0.8 * 0.25 * Math.min(window.height, window.width)
            anchors.bottom: parent.bottom
        }
    }

    IndicatorContainer {
        width: 0.65 * gauges.width
        height: 0.075 * width

        anchors {
            top: gauges.bottom
            topMargin: 0.5 * height
            horizontalCenter: gauges.horizontalCenter
        }

        Row {
            spacing: 0.06 * width

            anchors {
                fill: parent
                leftMargin: 0.04 * parent.width
            }

            Indicator {
                type: "headlight"
                width: height
                height: 0.5 * parent.height
                anchors.verticalCenter: parent.verticalCenter
            }

            Indicator {
                type: "battery"
                width: height
                height: 0.5 * parent.height
                anchors.verticalCenter: parent.verticalCenter
            }

            Indicator {
                type: "wiper"
                width: height
                height: 0.5 * parent.height
                anchors.verticalCenter: parent.verticalCenter
            }

            Indicator {
                type: "battery-low"
                width: height
                height: 0.5 * parent.height
                anchors.verticalCenter: parent.verticalCenter
            }

            Indicator {
                type: "oilcup"
                width: height
                height: 0.6 * parent.height
                anchors.verticalCenter: parent.verticalCenter
            }

            Indicator {
                type: "lamp"
                width: height
                height: 0.5 * parent.height
                anchors.verticalCenter: parent.verticalCenter
            }

            Indicator {
                type: "abs"
                width: height
                height: 0.5 * parent.height
                anchors.verticalCenter: parent.verticalCenter
            }

            Indicator {
                type: "park"
                width: height
                height: 0.5 * parent.height
                anchors.verticalCenter: parent.verticalCenter
            }

            Indicator {
                type: "shelter-belt"
                width: height
                height: 0.5 * parent.height
                anchors.verticalCenter: parent.verticalCenter
            }

            Indicator {
                type: "caution"
                width: height
                height: 0.5 * parent.height
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }
}
