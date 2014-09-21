//var timelineArray;
//function init(_timelineArray){
//    timelineArray = _timelineArray;
//}
function populate(startDate, endDate, period) {
    var timeline;

    if(startDate == ""){
        console.log("start date is null");
        timeline = Qt.createComponent("Timeline.qml").createObject(historyWindow, {});
        timeline.startDateProperty = "";
        timeline.endDateProperty = endDate;
        timeline.timePeriodProperty = period;

    }
    else if(endDate == ""){
        console.log("end date is null");
        timeline = Qt.createComponent("Timeline.qml").createObject(historyWindow, {});
        timeline.startDateProperty = startDate;
        timeline.endDateProperty = "";
        timeline.timePeriodProperty = period;
    }
    else if(period == ""){
        timeline = Qt.createComponent("Timeline.qml").createObject(historyWindow, {});
        timeline.startDateProperty = startDate;
        timeline.endDateProperty = endDate;
        timeline.timePeriodProperty = "";
    }
//    timelineArray.push(timeline);
//    console.log(timelineArray.length);
}

