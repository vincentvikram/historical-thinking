import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import "."
import "Event.js" as Event

Item{
    id:event
    width:100/1366 * Screen.desktopAvailableWidth
    height:100/768 * Screen.desktopAvailableHeight

    property string eventStartDate
    property string eventEndDate
    property string eventDescription
    property string eventName
    property string eventImagePath
    property int centerX: event.x + event.width/2
    property int centerY: event.y + event.height/2
    property alias eventButtonProperty:eventButton

    property variant eventPeople
    property variant associatedTimelineObjectName

    Button{
        id:eventButton
        width: 100/1366 * Screen.desktopAvailableWidth
        height: 100/768 * Screen.desktopAvailableHeight
        buttonLabel: "Click to\nadd name"
        buttonColor: "lightblue"
        MouseArea{
            anchors.fill:parent
            onClicked: properties.visible = true;
            drag.target:eventButton

            onPositionChanged: {
                console.log(event.x + "  " + event.y);
            }
        }
    }

    EventProperties
    {
        id:properties
        visible:false
    }
}



