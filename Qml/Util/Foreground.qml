import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    required property double outerRadius

    Rectangle {

        width: 24.0 / 90 * outerRadius
        height: 24.0 / 90 * outerRadius
        radius: 12.0 / 90 * outerRadius
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
    }
}
