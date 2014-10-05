import QtQuick 2.0
import QtQuick.Window 2.2

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
        height: 2
        y:placementY
        x:placementX
        rotation:0

        color:'black'

        Text {
            id: startDate
            text: startDateText
            x:timeline.x - 200/1366 * Screen.desktopAvailableWidth
        }

        Text {
            id: endDate
            x:timeline.width
            text: endDateText
        }

        Text {
            id: timePeriod
            x:timeline.width/2
            text: timePeriodProperty
        }

    }
}
