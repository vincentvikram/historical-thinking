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
    y:parent.placementY - height - (100/768 * Screen.desktopAvailableHeight)
    x:placementX

    property string eventStartDate
    property string eventEndDate
    property string eventDescription
    property string eventName
    property string eventImagePath
    property int personCount:0
    property int centerX: event.x + event.width/2
    property int centerY: event.y + event.height/2
    property int placementX:100/1366 * Screen.desktopAvailableWidth
    property alias placementY:event.y
    property alias eventButtonProperty:eventButton
    property int initPosX
    property int initPosY

    property variant eventPeople
    property variant associatedTimelineObjectName

    Component.onCompleted: {
        initPosX = placementX;
        initPosY = placementY;
    }

    //    Column{

    //        Row{


    Button{
        id:eventButton
        width: 100/1366 * Screen.desktopAvailableWidth
        height: 100/768 * Screen.desktopAvailableHeight
        buttonLabel: "Click to\nadd name"
        MouseArea{
            anchors.fill:parent
            onClicked: properties.visible = true;
            drag.target:eventButton

            onMouseXChanged: {
                Event.eventDragged(event, initPosX - event.x,initPosY - event.y);
            }

//            drag.active: true
//            drag.axis: Drag.XAndYAxis*/
        }
    }



    EventProperties
    {
        id:properties
        visible:false
    }

    //    Rectangle {
    //        id: line
    //        color: "red"
    ////        transformOrigin: Item.TopLeft
    //    }

    //    MultiPointTouchArea {
    //        anchors.fill: parent
    //        touchPoints: [ TouchPoint { id: point1 }]
    //        onReleased: {

    //        }
    //        onTouchUpdated: {
    //            var point = event.mapToItem(null, point1.x, point1.y)
    //            Event.drawLine(point1.x, point1.y, event.width/2, event.height/2)
    //        }
    //    }

}



