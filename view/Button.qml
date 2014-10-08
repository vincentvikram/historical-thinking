import QtQuick 2.0
import QtQuick.Window 2.1

Rectangle  {
    id: button
    width: 100/1366 * Screen.desktopAvailableWidth
    height: 40/768 * Screen.desktopAvailableHeight
    radius:5


    Text {
        id: label
        anchors.centerIn: parent
        text: buttonLabel
    }

    property color buttonColor: "lightgray"
    property color onHoverColor: "gold"
    property color borderColor: "white"
    property string buttonLabel: "OK"


    signal buttonClick()
    onButtonClick:  {
    }

    MouseArea {
        id:buttonMouseArea
        anchors.fill:parent
        onClicked: buttonClick()
        hoverEnabled: true
        onEntered: parent.border.color = onHoverColor
        onExited:  parent.border.color = borderColor
    }

    //determines the color of the button by using the conditional operator
    color: buttonMouseArea.pressed ? Qt.darker(buttonColor, 1.5) : buttonColor
}
