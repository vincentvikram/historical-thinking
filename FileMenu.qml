import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import QtQuick.Layouts 1.0

import "."
import "Event.js" as Event
import "TimeLine.js" as Timeline
import "Person.js" as Person

ApplicationWindow{
    menuBar:MenuBar{
        Menu {
            title: "New"
            MenuItem {
                text: qsTr("Timeline")
                shortcut: "Ctrl+T"
                onTriggered: {timelineDialog.visible = true;}
            }

            MenuItem {
                text: qsTr("Event")
                shortcut: "Ctrl+E"
                onTriggered: {historyWindow.timelineEnabled = true;}
            }
            Menu {
                title: "Event"
                MenuItem {
                    text: qsTr("New")
                    shortcut: "Ctrl+E"
                    onTriggered: {
                        //                historyWindow.timelineEnabled = true;
                        Event.create();
                    }
                }
            }
            MenuItem {
                text: qsTr("Cause & effect")
                onTriggered: {
                    historyWindow.linkEnabled = true;
                    console.log("settingLineEnable to true");
                }

            }

            MenuItem {
                text: qsTr("Parent & child")
                onTriggered: {
                    historyWindow.linkEnabled = true;
                    console.log("settingLineEnable to true");
                }
            }
            MenuItem {
                text: qsTr("Cause & effect")
                onTriggered: {
                    historyWindow.linkEnabled = true;
                    console.log("settingLineEnable to true");
                }

            }
            MenuItem {
                text: qsTr("Change in continuity")
                onTriggered: {
                    historyWindow.linkEnabled = true;
                    console.log("settingLineEnable to true");
                }
            }
            MenuItem {
                text: qsTr("Separator")
                onTriggered: {
                    historyWindow.linkEnabled = true;
                    console.log("settingLineEnable to true");
                }
            }
            MenuItem {
                text: qsTr("Related to")
                onTriggered: {
                    historyWindow.linkEnabled = true;
                    console.log("settingLineEnable to true");
                }
            }

        }
        Menu {
            title: "Help"
            MenuItem {
                text: qsTr("Find Help")
                shortcut: "F1"
                onTriggered: {
                }
            }
        }

        Menu {
            title: "Person"
            MenuItem {
                text: qsTr("New")
                shortcut: "Ctrl+P"
                onTriggered: {
                    Person.create();
                }
            }
        }
    }




    ScrollView{
        id:scrollableWindow
        width:Screen.desktopAvailableWidth
        height:Screen.desktopAvailableHeight

        Item{
            id:historyWindow
            width:Screen.desktopAvailableWidth
            height:Screen.desktopAvailableHeight

            property int eventCount:0
            property int timelineCount: 0
            property int personCount: 0
            property int linkCount: 0
            property variant timelineSelected
            property bool linkEnabled:false
            property bool timelineEnabled:false
            property int clickCount:0
            property variant linkElement1
            property variant linkElement2



            Component.onDestruction: {
                //Update to DATABASE
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

                    var timelineConcerned, eventConcerned;



                    if(historyWindow.linkEnabled){
                        console.log("line enabled")
                        if(historyWindow.eventCount > 1){
                            historyWindow.clickCount ++;
                            switch(historyWindow.clickCount){
                            case 1:
                                console.log("click 1");
                                timelineConcerned = Timeline.whichTimeline(mouseX,mouseY);
                                historyWindow.linkElement1 = Event.whichEvent(timelineConcerned,mouseX,mouseY);
                                break;
                            case 2:
                                console.log("click 2");
                                timelineConcerned = Timeline.whichTimeline(mouseX,mouseY);
                                historyWindow.linkElement2 = Event.whichEvent(timelineConcerned,mouseX,mouseY);
                                console.log(historyWindow.linkElement1 + "  " + historyWindow.linkElement2);
                                Event.drawLine(historyWindow.linkElement1,historyWindow,historyWindow.linkElement1.centerX, historyWindow.linkElement1.centerY,historyWindow.linkElement2.centerX,historyWindow.linkElement2.centerY);
                            }
                        }
                    }



                }
            }
        }
    }
    statusBar: StatusBar {
        RowLayout {
            Label { text: "Made with love! :)" }
        }
    }

}
