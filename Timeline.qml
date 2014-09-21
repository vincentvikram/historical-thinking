import QtQuick 2.0

Item{
    id:timelineParent
    property string startDateText
    property string endDateText
    property variant startDateProperty
    property variant endDateProperty
    property string timePeriodProperty
    property int placementY: 100
    property int  placementX: 50
    property int timelineNumber
Rectangle {
    id:timeline
    width: 800
    height: 2
    y:placementY
    x:placementX

    color:'black'



    Text {
        id: startDate
        text: startDateText
    }

    Text {
        id: endDate
        x:timeline.width - 50
        text: endDateText
    }

    Text {
        id: timePeriod
        x:timeline.width/2
        text: timePeriodProperty
    }
}
}
