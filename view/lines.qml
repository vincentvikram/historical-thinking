import QtQuick 2.0


Canvas {
    id: root
    // canvas size
    width: 600; height: 800
    // handler to override for drawing
    onPaint: {
        // get context to draw with
        var ctx = getContext("2d")
        // setup the stroke
        ctx.lineWidth = 7
        ctx.strokeStyle = "blue"
        // setup the fill
        ctx.fillStyle = "steelblue"
        // begin a new path to draw
        ctx.beginPath()
        // top-left start point
        ctx.moveTo(100,100)
        // upper line
        ctx.lineTo(200,100)
        /*// right line
        ctx.lineTo(150,150)
        // bottom line
        ctx.lineTo(50,150)
        // left line through path closing*/
        ctx.closePath()
        // fill using fill style
        ctx.fill()
        // stroke using line width and stroke style
        ctx.stroke()



        //drawing a red line
        var blackLine = getContext("2d")
        //setup the stoke
        blackLine.lineWidth= 10
        blackLine.strokeStyle = "black"
        blackLine.fillStyle = "steelblue"
        blackLine.beginPath()
        blackLine.moveTo(300,300)
        blackLine.lineTo(400,300)
        blackLine.closePath()
        blackLine.fill()
        blackLine.stroke()

    }

    /*Rectangle {
        width: 100
        height: 100
        color: "red"
        border.color: "black"
        border.width: 5
        radius: 10
        anchors.centerIn: root
    }*/

}
