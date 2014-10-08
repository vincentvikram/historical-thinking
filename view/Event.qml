import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import "."
import "../controller/Event.js" as Event

Item{
    id:event
    width:100/1366 * Screen.desktopAvailableWidth
    height:100/768 * Screen.desktopAvailableHeight

    property string eventStartDate
    property string eventEndDate
    property string eventDescription
    property string eventName
    property string eventImagePath
    property alias propertiesVisible:properties.visible
    property int centerX: event.x + event.width/2
    property int centerY: event.y + event.height/2
    property alias eventButtonProperty:eventButton

    property variant eventPeople
    property variant associatedTimelineObjectName

    Menu{
        id:eventMenu
        MenuItem{
            text:qsTr("Delete")
            onTriggered: {
                event.destroy();
                historyWindow.eventCount -= 1;
            }
        }
        MenuItem{
            text:qsTr("Properties")
            onTriggered: Event.makeAllOtherPropertyBoxesInvisible(event);
        }
    }

    Button{
        id:eventButton
        width: 100/1366 * Screen.desktopAvailableWidth
        height: 100/768 * Screen.desktopAvailableHeight
        buttonLabel: "Click to\nadd name"
        buttonColor: "lightblue"

        MouseArea{
            anchors.fill:parent
            drag.target: eventButton
            acceptedButtons: Qt.RightButton | Qt.LeftButton
            onClicked: {
                if(mouse.button == Qt.RightButton){
                    eventMenu.popup();
                }
            }
        }
    }

    EventProperties
    {
        id:properties
        visible:false
    }


}
