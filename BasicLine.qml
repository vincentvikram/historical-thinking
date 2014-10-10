import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import "."
import "Line.js" as Line

Item{
    id:event
    width:100/1366 * Screen.desktopAvailableWidth
    height:100/768 * Screen.desktopAvailableHeight

    property int eventId1
    property int eventId2
    property int personId
    property int priorityId
    property string impactFactor
    property string type
    property alias propertiesVisible:properties.visible
    /*property int centerX: event.x + event.width/2
    property int centerY: event.y + event.height/2
    property alias eventButtonProperty:eventButton

    property variant eventPeople
    property variant associatedTimelineObjectName*/

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

    Rectangle {
        id: basicline
        property alias z1:l.z
    property alias x1: l.x
    property alias y1: l.y

    property real x2: l.x
    property real y2: l.y

    color: "black"
    height: 2
    smooth: true;
    }    
    /*Button{
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
    }*/

    EventProperties
    {
        id:properties
        visible:false
    }


}


/*import QtQuick 2.0
import "."
import "Line.js" as Line

 
Item {
    id:basicline
    width:100/1366 * Screen.desktopAvailableWidth
    height:100/768 * Screen.desktopAvailableHeight

    property int eventId1
    property int eventId2
    property int personId
    property int priorityId
    property string impactFactor
    property string type
    property alias propertiesVisible:properties.visible

    Menu{
        id:basiclineMenu
        MenuItem{
            text:qsTr("Delete")
            onTriggered: {
                Line.destroy();
                historyWindow.basiclineCount -= 1;
            }
        }
        MenuItem{
            text:qsTr("Properties")
            onTriggered:{
                Line.makeAllOtherPropertyBoxesInvisible(basicline);
            }
        }        
    }

    Rectangle {
        id: basicline
        property alias x1: l.x
        property alias y1: l.y
     
        property real x2: l.x
        property real y2: l.y
     
        color: "red"
        width: 100/1366 * Screen.desktopAvailableWidth
        height: 500/768 * Screen.desktopAvailableHeight
        smooth: true;

     
        transformOrigin: Item.TopLeft;
     
        width: getWidth(x1,y1,x2,y2);
        rotation: getSlope(x1,y1,x2,y2);
     
        function getWidth(sx1,sy1,sx2,sy2)
        {
            var w=Math.sqrt(Math.pow((sx2-sx1),2)+Math.pow((sy2-sy1),2));
            console.debug("W: "+w);
            return w;
        }
     
        function getSlope(sx1,sy1,sx2,sy2)
        {
            var a,m,d;
            var b=sx2-sx1;
            if (b===0)
                return 0;
            a=sy2-sy1;
            m=a/b;
            d=Math.atan(m)*180/Math.PI;
     
            if (a<0 && b<0)
                return d+180;
            else if (a>=0 && b>=0)
                return d;
            else if (a<0 && b>=0)
                return d;
            else if (a>=0 && b<0)
                return d+180;
            else
                return 0;
        }
    }
}*/
