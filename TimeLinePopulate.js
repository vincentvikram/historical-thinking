//var timelineArray;
//function init(_timelineArray){
//    timelineArray = _timelineArray;
//}
function populate(timelineArray,startDateDate, startDateMonth, startDateYear, endDateDate, endDateMonth,endDateYear, period, adChecked1, bcChecked1, adChecked2, bcChecked2) {
    var timeline, startDate, endDate;
    timeline = Qt.createComponent("Timeline.qml").createObject(historyWindow, {"objectName":historyWindow.children.length});

    //1)Check if at least two entities are entered. Either StartDate/Period or EndDAte/Period or StartDate/EndDAte

    if((startDateYear == "" || endDateYear =="") && period == ""){
        console.log("Need at least two parameters")
    }

    //checks for valid input
    //TODO

    //2)If start date and end date are entered, put them in timeline qml
    if((startDateYear != "" && startDateMonth != "" && startDateDate != "")
            && (endDateYear != "" && endDateDate != "" && endDateMonth != "")){
        // Parse DAtes, format dates and store in date property of Timeline

        //Parse start date
        startDate = startDateMonth + " " + startDateDate + ", " +  startDateYear;
        timeline.startDateText = startDate;
        startDate = new Date(startDate);
        timeline.startDateProperty = startDate;

        endDate = endDateMonth + " " + endDateDate + ", " +  endDateYear;
        timeline.endDateText = endDate;
        endDate = new Date(endDate);
        timeline.endDateProperty = endDate;

        if(period == "" || !isNan(parseInt(period))){
            timeline.timePeriodProperty = period;
        }

    }

    //3)If start date and Timeline are entered, put them in timeline qml
    else if(startDateYear != "" && period != "" && !isNaN(parseInt(period))){
        startDate = startDateMonth + " " + startDateDate + ", " +  startDateYear;
        timeline.startDateText = startDate;
        startDate = new Date(startDate);
        timeline.startDateProperty = startDate;

        timeline.timePeriodProperty = period;

        if(endDateDate != "" && endDateMonth != "" && endDateYear != ""){
            endDate = endDateMonth + " " + endDateDate + ", " +  endDateYear;
            timeline.endDateText = endDate;
            endDate = new Date(endDate);
            timeline.endDateProperty = endDate;
        }
    }

    //4//3)If end date and Timeline are entered, put them in timeline qml
    else if(endDateYear != "" && period != "" && !isNaN(parseInt(period))){
        endDate = endDateMonth + " " + endDateDate + ", " +  endDateYear;
        timeline.endDateText = endDate;
        endDate = new Date(endDate);
        timeline.endDateProperty = endDate;


        timeline.timePeriodProperty = period;

        if(startDateDate != "" && startDateMonth != "" && startDateYear != ""){
            startDate = startDateMonth + " " + startDateDate + ", " +  startDateYear;
            timeline.startDateText = startDate;
            startDate = new Date(startDate);
            timeline.startDateProperty = startDate;
        }
    }

    console.log(historyWindow.children.length);
    timeline.placementY = 100 + 200 * (historyWindow.children.length - 2);

}

