//var timelineArray;
//function init(_timelineArray){
//    timelineArray = _timelineArray;
//}
function populate(timelineArray,startDate, endDate, period) {
    var timeline;

    if(startDate == ""){
        console.log("start date is null");
        timeline = Qt.createComponent("Timeline.qml").createObject(dialogComponent.parent, {});
        timeline.startDateProperty = "";
        timeline.endDateProperty = endDate;
        timeline.timePeriodProperty = period;
        timelineArray.push(timeline);

    }
    else if(endDate == ""){
        console.log("end date is null");
        timeline = Qt.createComponent("Timeline.qml").createObject(dialogComponent.parent, {});
        timeline.startDateProperty = startDate;
        timeline.endDateProperty = "";
        timeline.timePeriodProperty = period;
        timelineArray.push(timeline.timePeriodProperty);
    }
    else if(period == ""){
        timeline = Qt.createComponent("Timeline.qml").createObject(dialogComponent.parent, {});
        timeline.startDateProperty = startDate;
        timeline.endDateProperty = endDate;
        timeline.timePeriodProperty = "";
        timelineArray.push(timeline.startDate);
    }
//    timelineArray.push(timeline);
//    console.log(timelineArray.length);
}

