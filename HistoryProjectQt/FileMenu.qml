import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1

ApplicationWindow{
    id:historyWindow
    title:qsTr("Historical Thinking Skills");
    width:800
    height:800

 menuBar:   MenuBar{

        Menu {
            title: qsTr("Timeline")
            MenuItem {
                text: qsTr("New")
                shortcut: "Ctrl+N"
                onTriggered: Qt.createComponent("Dialog.qml").createObject(historyWindow, {});
            }
        }
    }

}
