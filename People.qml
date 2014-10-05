import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1

Column{
    id:event
    width:500/1366 * Screen.desktopAvailableWidth
    height:200/768 * Screen.desktopAvailableHeight
    y:400/768 * Screen.desktopAvailableHeight
    x:50/1366 * Screen.desktopAvailableWidth

    Row{
        Rectangle{
            width:100/1366 *Screen.desktopAvailableWidth
            height:100/768 * Screen.desktopAvailableHeight
            Image{
                id:image
                width:200/1366 * Screen.desktopAvailableWidth
                height:100/768 * Screen.desktopAvailableHeight

                Text{
                    id:imageText
                    text: "Click to add \n an image \n of the person!"
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
            width:100/1366 * Screen.desktopAvailableWidth
            height:100/768 * Screen.desktopAvailableHeight
            placeholderText: qsTr("Describe the\n person")
        }
    }

    TextField{
        id:label
        width:200/1366 * Screen.desktopAvailableWidth
        height:50/768 * Screen.desktopAvailableHeight
        placeholderText: qsTr("Person's name goes here :)")

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
