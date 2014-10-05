import QtQuick 2.0
import QtQuick.Window 2.1
import "."
Rectangle {
    id:errorWindow
    width: 300/1366 * Screen.desktopAvailableWidth
    height: 100/768 * Screen.desktopAvailableHeight
    color:"lightgray"

    property string errorMessageProperty

    anchors.centerIn: parent

    Column{
           anchors.centerIn: parent
           spacing: 10/768 * Screen.desktopAvailableHeight
    Text{
        id:errorMessage

        text: errorMessageProperty
    }

    Button{
        buttonLabel: "Close"
        buttonColor: "darkgray"
        x:50/1366 * Screen.desktopAvailableWidth
        onButtonClick:  {errorWindow.visible = false;}
    }
    }

}
