import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

import "Gauges/FuelAndTemperature"
import "Gauges/Speedometer"
import "Gauges/Tachometer"
import "IndicatorPanel"
import "Util"

Window {
    id: window
    width: 1280
    height: 720
    visible: true
    color: "#101010"

    property double scaling: Math.min(window.height / 1280, window.width / 720)

    FontLoader {
        source: "qrc:/resources/Fonts/CenturyGothic.ttf"
    }

    FontLoader {
        source: "qrc:/resources/Fonts/OdibeeSans-Regular.ttf"
    }

    Item {
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

        SignalIndicators {
            id: signalIndicators
            scaling: window.scaling
            anchors.top: speedometer.top
            anchors.topMargin: 70 * window.scaling
            anchors.horizontalCenter: speedometer.horizontalCenter
            leftSignal: drivingData.leftSignal
            rightSignal: drivingData.rightSignal
        }

        FuelAndTemperatureMeterContainer {
            id: fuelmeter
            anchors {
                right: speedometer.left
                bottom: speedometer.bottom
                rightMargin: 60 * scaling
            }

            radius: 1080 * 0.25 * scaling
            temperature: drivingData.temperature
            fuel: drivingData.fuelTank
        }

        SpeedometerContainer {
            id: speedometer
            anchors {
                centerIn: parent
                verticalCenterOffset: -80 * scaling
            }

            radius: 1080 * 0.33 * scaling
            speed: drivingData.speed
        }

        TachometerContainer {
            id: tachometer
            anchors {
                left: speedometer.right
                bottom: speedometer.bottom
                leftMargin: 60 * scaling
            }

            radius: 1080 * 0.25 * scaling
            throttle: drivingData.throttle
        }

        LeftIndicatorPanel {
            id: leftIndicatorPanel
            scaling: window.scaling
            anchors {
                verticalCenter: centerIndicatorPanel.verticalCenter
                horizontalCenter: fuelmeter.horizontalCenter
                horizontalCenterOffset: 140 * scaling
            }
        }

        Item {
            id: centerIndicatorPanel
            width: 0
            height: 0
            anchors {
                top: speedometer.bottom
                topMargin: 96 * scaling
                horizontalCenter: speedometer.horizontalCenter
            }
        }

        RightIndicatorPanel {
            id: rightIndicatorPanel
            scaling: window.scaling
            anchors {
                verticalCenter: centerIndicatorPanel.verticalCenter
                horizontalCenter: tachometer.horizontalCenter
                horizontalCenterOffset: -140 * scaling
            }
        }
    }
}
