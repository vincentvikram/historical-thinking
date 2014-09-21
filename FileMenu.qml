import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1

Item{
    //    Window{

    id:historyWindow
    width:1024
    height:800

    property variant eventArray:[]
    property variant timelineArray:[]

    Component.onCompleted: {

        console.log()
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
                    var event = Qt.createComponent("Event.qml").createObject(historyWindow, {});
                    eventArray.push(event);
                }
            }
        }
        Menu {
            title: "People"
            MenuItem {
                text: qsTr("New")
                shortcut: "Ctrl+P"
                onTriggered: {
                    var event = Qt.createComponent("People.qml").createObject(historyWindow, {});
                    eventArray.push(event);
                }
            }
        }
//    }

    TimelineDialog{
        id:timelineDialog
        visible:false
    }

}
//}
