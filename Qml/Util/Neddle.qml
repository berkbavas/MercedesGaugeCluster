import QtQuick 2.0

Canvas {
    required property double outerRadius

    width: 6 / 90 * outerRadius
    height: 70 / 90 * outerRadius
    antialiasing: true
    onPaint: {
        var ctx = getContext('2d')

        var gradient = ctx.createLinearGradient(0, height / 2, width, height / 2)

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
