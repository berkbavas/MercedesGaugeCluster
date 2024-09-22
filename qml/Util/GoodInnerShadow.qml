import QtQuick 2.15
import QtGraphicalEffects 1.0

// Sam Arthur Gillam's work taken from https://stackoverflow.com/a/69958588
Item {
    id: root
    anchors.centerIn: source
    width: source.width
    height: source.height

    required property var source
    property color color: "#50ffffff"
    property double radius: 12
    property double spread: .8

    Item {
        id: sourceMaskWithPadding
        visible: false
        anchors.centerIn: parent
        width: root.source.width + shadowOfInverse.samples * 2
        height: root.source.height + shadowOfInverse.samples * 2

        OpacityMask {
            id: sourceMask
            anchors.centerIn: parent
            width: root.source.width
            height: root.source.height
            maskSource: root.source
            source: root.source
        }
    }

    Rectangle {
        id: coloredRect
        visible: false
        color: root.color
        anchors.fill: sourceMaskWithPadding
    }

    OpacityMask {
        id: sourceInverse
        visible: false
        anchors.fill: coloredRect
        source: coloredRect
        maskSource: sourceMaskWithPadding
        invert: true
    }

    DropShadow {
        id: shadowOfInverse
        visible: false
        anchors.fill: sourceInverse
        source: sourceInverse
        radius: root.radius
        samples: radius * 2 + 1
        color: root.color
        spread: root.spread
    }

    OpacityMask {
        id: sourceInnerShadow
        anchors.fill: sourceMaskWithPadding
        maskSource: sourceMaskWithPadding
        source: shadowOfInverse
    }
}
