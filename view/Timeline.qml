import QtQuick 2.0

Rectangle {
    id:timeline
    width: 800
    height: 2
    y:600
    x:50

    color:'black'

    property string startDateProperty
    property string endDateProperty
    property string timePeriodProperty


    Text {
        id: startDate
        text: startDateProperty
    }

    Text {
        id: endDate
        x:timeline.width - 50
        text: endDateProperty
    }

    Text {
        id: timePeriod
        x:timeline.width/2
        text: timePeriodProperty
    }
}
