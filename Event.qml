import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import "."
import "Event.js" as Event

Rectangle{
    id:event
    width:200
    height:250
    y:parent.placementY - width - 100
    x:placementX
    border.color: "red"
    border.width:5

    property string eventStartDate
    property string eventEndDate
    property string eventDescription
    property string eventName
    property string eventImagePath
    property int placementX

    property variant eventPeople
    property variant associatedTimelineObjectName

    Component.onCompleted: {
        console.log(parent.placementX + "  " + parent.placementY);
    }

    Column{

        Row{
            TextField{
                id:startDate
                width:100
                height:50
                placeholderText: qsTr("dd-MMM-yyyy")

                onTextChanged:Event.runUpdate(event, "SD", startDate.text);

                MouseArea{
                    anchors.fill:parent

                    onClicked:{
                        startDate.focus = true
                    }
                }
            }
            TextField{
                id:endDate
                width:100
                height:50
                placeholderText: qsTr("dd-MMM-yyyy")
                onTextChanged:Event.runUpdate(event, "ED", endDate.text);
            }
        }

        Row{
            Rectangle{
                width:98
                height:100

                Image{
                    id:image
                    width:100
                    height:100

                    Text{
                        id:imageText
                        text: "Click to add\n image"
                    }

                    onSourceChanged: Event.runUpdate(event, "IMG", image.source);
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
                onTextChanged:Event.runUpdate(event, "DESC", description.text);
            }
        }

        TextField{
            id:name
            width:200
            height:50
            placeholderText: qsTr("Event name")
            onTextChanged:Event.runUpdate(event, "EN", name.text);
        }

        Button{
            width: 195
            height: 45
            buttonLabel: "Properties"
            MouseArea{
                anchors.fill:parent
                onClicked: properties.visible = true;
            }
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

        EventProperties
        {
            id:properties
            visible:false
        }
    }

    MultiPointTouchArea {
        anchors.fill: parent
        touchPoints: [ TouchPoint { id: point1 }]
        onReleased: {

        }
        onTouchUpdated: {
            var point = event.mapToItem(event.parent, point1.x, point1.y)
            Event.drawLine(point.x, point.y, event.x + event.width/2, event.y + event.height/2)
        }
    }
}



