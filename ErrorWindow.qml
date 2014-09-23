import QtQuick 2.0
import "."
Rectangle {
    id:errorWindow
    width: 300
    height: 100
    color:"lightgray"

    property string errorMessageProperty

    anchors.centerIn: parent

    Column{
           anchors.centerIn: parent
           spacing: 10
    Text{
        id:errorMessage

        text: errorMessageProperty
    }

    Button{
        buttonLabel: "Close"
        buttonColor: "darkgray"
        x:50
        onButtonClick:  {errorWindow.visible = false;}
    }
    }

}
