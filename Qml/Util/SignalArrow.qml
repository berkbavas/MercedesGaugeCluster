import QtQuick 2.0

import ".."

Item {
    width: 64 * scaling
    height: 64 * scaling
    property double scaling: 1
    property string color: Constants.signalColor
    property double angle: 0

    Canvas {
        anchors.fill: parent
        antialiasing: true

        onPaint: {
            var ctx = getContext('2d')
            ctx.reset()

            let w = width / 2

            ctx.translate(w, w)
            ctx.rotate(Math.PI * angle / 180)
            ctx.translate(-w, -w)

            ctx.fillStyle = color

            ctx.beginPath()
            ctx.moveTo(0, 0.5 * w)
            ctx.lineTo(0, 1.5 * w)
            ctx.lineTo(w, 1.5 * w)
            ctx.lineTo(w, 2 * w)
            ctx.lineTo(2 * w, w)
            ctx.lineTo(w, 0)
            ctx.lineTo(w, 0.5 * w)
            ctx.closePath()
            ctx.fill()
        }
    }
}
