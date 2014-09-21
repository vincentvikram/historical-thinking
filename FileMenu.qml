import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1

ApplicationWindow{
    id:historyWindow
    title:qsTr("Historical Thinking Skills");
    width:1024
    height:800

    property variant eventArray:[]
    menuBar:   MenuBar{

        Menu {
            title: qsTr("Timeline")
            MenuItem {
                text: qsTr("New")
                shortcut: "Ctrl+T"
                onTriggered: Qt.createComponent("TimelineDialog.qml").createObject(historyWindow, {});
            }
        }
        Menu {
            title: qsTr("Event")
            MenuItem {
                text: qsTr("New")
                shortcut: "Ctrl+E"
                onTriggered: {
                    var event = Qt.createComponent("Event.qml").createObject(historyWindow, {});
                    eventArray.push(event);
                    }
            }
        }
    }

}
