//var timelineArray;
//function init(_timelineArray){
//    timelineArray = _timelineArray;
//}
function populate(timelineArray,startDate, endDate, period, adChecked1, bcChecked1, adChecked2, bcChecked2) {
    var timeline;
    console.log("timelinePopulate " + historyWindow.children.length);
    timeline = Qt.createComponent("Timeline.qml").createObject(historyWindow, {"objectName":historyWindow.children.length});
    timeline.startDateProperty = startDate;
    timeline.endDateProperty = endDate;
    timeline.timePeriodProperty = period;
    timelineArray.push(timeline.timelineNumber);
}

