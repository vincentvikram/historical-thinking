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

    Rectangle{
        width:500
        height:100
        Image{
            id:image
            width:500
            height:100
        }
        MouseArea{


            drag.target:event
            drag.axis: Drag.XandYAxis

            anchors.fill:parent
            onClicked:{
                fileDialog.open();
            }
        }
    }

    TextField{
        id:label
        width:500
        height:50
        placeholderText: qsTr("Event name")


        MouseArea{
            drag.target:event
            drag.axis: Drag.XandYAxis
            anchors.fill:parent
        }

    }

    TextField{
        id:description
        width:500
        height:50
        placeholderText: qsTr("Describe the event")

        MouseArea{
            drag.target:event
            drag.axis: Drag.XandYAxis
            anchors.fill:parent
        }
    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        selectMultiple: false
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls);
            image.source = fileDialog.fileUrl;
        }
        onRejected: {
            console.log("Canceled");
            fileDialog.close();
        }
    }

}
