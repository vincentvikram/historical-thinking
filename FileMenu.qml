import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1

//new code for Menu Bar by Abhi
ApplicationWindow{
    id:historyWindow
    title:qsTr("Historical Thinking Skills");
    width:1024
    height:800

    property variant eventArray:[]
    menuBar:   MenuBar{

        Menu {
            title: qsTr("New")
            MenuItem {
                text: qsTr("Timeline")
                shortcut: "Ctrl+T"
                onTriggered: {timelineDialog.visible = true;}
            }            
            MenuItem {
                text: qsTr("People")
                shortcut: "Ctrl+P"
                onTriggered: {
                    var event = Qt.createComponent("People.qml").createObject(historyWindow, {});
                    eventArray.push(event);
                    }
                }
            MenuItem {
                text: qsTr("Event")
                shortcut: "Ctrl+E"
                onTriggered: {
                    var event = Qt.createComponent("Event.qml").createObject(historyWindow, {});
                    eventArray.push(event);
                }
            }
            }


        Menu {
            title: qsTr("Create")
            MenuItem {
                text: qsTr("Link")
                shortcut: "Ctrl+L"
                onTriggered: {
                    var event = Qt.createComponent("Event.qml").createObject(historyWindow, {});
                    eventArray.push(event);
                    }
            }
        }
            Menu {
                title: qsTr("Lines")
                MenuItem {
                    text: qsTr("D")
                    shortcut: "Ctrl+L"
                     onTriggered: Qt.createComponent("lines.qml").createObject(historyWindow, {});
                }
            }


    }

TimelineDialog{
        id:timelineDialog
        visible:false
    }
}
//old code for Menu Bar by Aruna
/*Item{
    //    Window{

Item{
    id:historyWindow
    width:1024
    height:800

    property int eventCount:0
    property int timelineCount: 0
    property variant timelineSelected

    Component.onDestruction: {
        //Update to DATABASE
    }

    //    MenuBar{
    Menu {
        title: "Timeline"
        MenuItem {
            text: qsTr("New")
            shortcut: "Ctrl+T"
            onTriggered: {timelineDialog.visible = true;}
        }
    }
    Menu {
        title: "Event"
        MenuItem {
            text: qsTr("New")
            shortcut: "Ctrl+E"
            onTriggered: {
                //                if(timelineCount > 0)
                //                {
                //                    Event.create();
                //                }
                //                else
                //                {
                //                    error.visible = true;
                //                    error.errorMessageProperty = "Please create a timeline first!"

                //                }
            }
        }
    }

    TimelineDialog{
        id:timelineDialog
        visible:false
    }

    ErrorWindow{
        id:error
        visible:false
    }

    MouseArea{
        anchors.fill:parent
        acceptedButtons: Qt.RightButton

        onClicked: {


            if(timelineCount > 0)
            {
                var parentTimeline = Timeline.whichTimeline(mouseX, mouseY);
                Event.create(parentTimeline)
            }
            else
            {
                error.visible = true;
                error.errorMessageProperty = "Please create a timeline first!"

            }


        }
    }

}
//}
*/
