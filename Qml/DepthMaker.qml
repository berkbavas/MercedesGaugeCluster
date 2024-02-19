import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    property double offset: 3

    Rectangle {
        id: sourceOutter
        radius: (width / 2)
        antialiasing: true
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: "transparent"
            }
            GradientStop {
                position: 0.5
                color: "transparent"
            }
            GradientStop {
                position: 1.0
                color: "#282828"
            }
        }
        anchors {
            fill: parent
            margins: -offset
        }
    }

    Rectangle {
        id: maskOutter
        color: "transparent"
        radius: (width / 2)
        antialiasing: true
        border {
            width: offset
            color: "black"
        }
        anchors.fill: sourceOutter
    }

    OpacityMask {
        opacity: 0.65
        source: ShaderEffectSource {
            sourceItem: sourceOutter
            hideSource: true
        }
        maskSource: ShaderEffectSource {
            sourceItem: maskOutter
            hideSource: true
        }
        anchors.fill: sourceOutter
    }
}
