import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import "."

Item{
    id:timelineParent

    property string startDateText
    property string endDateText
    property variant startDateProperty
    property variant endDateProperty
    property string timePeriodProperty
    property alias placementY: timeline.y
    property alias  placementX: timeline.x
    property int timelineNumber
    property alias widthProperty:timeline.width
    property int timelinePixelDensity:Screen.pixelDensity


    Line {
        id:timeline
        height: 5
        y:placementY
        x:placementX
        rotation:0

        color:'black'

        Text {
            id: startDate
            text: startDateText
            x:timeline.x - 200/1366 * Screen.desktopAvailableWidth


            MouseArea{
                anchors.fill:startDate
                acceptedButtons: Qt.RightButton

                onClicked:{
                        timelineMenu.popup()
                }
            }
        }

        Text {
            id: endDate
            x:timeline.width
            text: endDateText


            MouseArea{
                anchors.fill:endDate
                acceptedButtons: Qt.RightButton

                onClicked:{
                        timelineMenu.popup()
                }
            }
        }

        Text {
            id: timePeriod
            x:timeline.width/2
            text: timePeriodProperty


            MouseArea{
                anchors.fill:timePeriod
                acceptedButtons: Qt.RightButton

                onClicked:{
                        timelineMenu.popup()
                }
            }
        }


        MouseArea{
            anchors.fill:timeline
            acceptedButtons: Qt.RightButton

            onClicked:{
                    timelineMenu.popup()
            }
        }

    }

    Menu{
        id:timelineMenu
        MenuItem{
            text:qsTr("Delete")
            onTriggered: {
                timeline.destroy()
                historyWindow.timelineCount -= 1;
            }
        }
    }
}
