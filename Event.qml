import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1

Column{
    id:event
    width:500
    height:200
    y:400
    x:50

    Row{
        Rectangle{
            width:100
            height:100
            Image{
                id:image
                width:200
                height:100

                Text{
                    id:imageText
                    text: "Click to add\n image"
                }
            }
            MouseArea{

                anchors.fill:parent
                onClicked:{
                    fileDialog.open();
                }
            }
        }

        TextField{
            id:description
            width:100
            height:100
            placeholderText: qsTr("Describe the\n event")
        }
    }

    TextField{
        id:label
        width:200
        height:50
        placeholderText: qsTr("Event name")

    }


    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        selectMultiple: false
        onAccepted: {
            image.source = fileDialog.fileUrl;
            imageText.visible = false;
        }
        onRejected: {
            fileDialog.close();
        }
    }

}
