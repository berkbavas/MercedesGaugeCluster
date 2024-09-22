import QtQuick 2.15
import QtGraphicalEffects 1.0

import ".."
import "../Util"

Item {
    width: 160 * scaling
    height: 68 * scaling
    anchors.verticalCenter: parent.verticalCenter

    required property string type
    required property string lightColor

    property bool lightOn: false
    property double scaling: 1.0

    property string indicatorColor: Constants.indicatorColor
    property string indicatorColorLightOn: Constants.indicatorColorLightOn

    MouseArea {
        anchors.fill: parent
        onClicked: {
            lightOn = !lightOn
        }
    }

    Rectangle {
        id: background
        anchors.fill: parent
        color: Constants.indicatorContainerBackgroundColor
        radius: 6 * scaling
    }

    Rectangle {
        id: light
        anchors.fill: parent
        color: lightColor
        visible: lightOn
        radius: 6 * scaling
    }

    Item {
        id: indicator
        width: 60 * scaling
        height: 48 * scaling
        anchors.centerIn: parent

        Image {
            id: image
            anchors.fill: parent
            source: "qrc:/resources/Indicators/" + type + ".svg"
            antialiasing: true
            fillMode: Image.PreserveAspectFit
            visible: false
            mipmap: true
        }

        ColorOverlay {
            anchors.fill: image
            source: image
            color: lightOn ? indicatorColorLightOn : indicatorColor
            antialiasing: true
        }
    }

    GoodInnerShadow {
        source: background
        color: "#7f000000"
        radius: lightOn ? 16 : 8
        spread: lightOn ? 0.4 : 0.2
    }
}
