//var timelineArray;
//function init(_timelineArray){
//    timelineArray = _timelineArray;
//}
function dateDiff( str1, str2 ) {
    var diff = Date.parse( str2 ) - Date.parse( str1 );
    return isNaN( diff ) ? NaN : {
                               diff : diff,
                               ms : Math.floor( diff            % 1000 ),
                               d  : Math.floor( diff / 86400000        ),
                               m  : Math.floor( diff / (86400000 * 30)),
                               y  : Math.floor( diff / (86400000 * 30 * 12)),
                               D  : Math.floor( diff / (86400000 * 30 * 12 * 10)),
                               C  : Math.floor( diff / (86400000 * 30 * 12 * 10 * 10)),
                               M  : Math.floor( diff / (86400000 * 30 * 12 * 1000)),
                           };
}
//function populate(timelineArray,startDateDate, startDateMonth, startDateYear, endDateDate,
//                  endDateMonth,endDateYear, adChecked1, bcChecked1, adChecked2,
//                  bcChecked2,periodUnit,scale,scaleUnit) {

function populate(timelineArray,startDateDate, startDateMonth, startDateYear, endDateDate,
                  endDateMonth,endDateYear, adChecked1, bcChecked1, adChecked2,
                  bcChecked2,scale,scaleUnit) {
    var timeline, startDate, endDate,difference;

    var startDateMilliseconds, endDateMilliseconds;

    //1)Check if at least two entities are entered. Either StartDate/Period or EndDAte/Period or StartDate/EndDAte

    if((startDateYear == "" || endDateYear =="")){
        console.log("Need at least two parameters")
    }

    //checks for valid input
    //TODO

    //2)If start date and end date are entered, put them in timeline qml

    else{
        historyWindow.timelineCount += 1;
        historyWindow.timelineNameCount += 1;


        timeline = Qt.createComponent("../view/Timeline.qml").createObject(historyWindow,
                                                                   {"objectName": "timeline" + historyWindow.timelineNameCount});

        if((startDateYear != "" && startDateMonth != "" && startDateDate != "")
                && (endDateYear != "" && endDateDate != "" && endDateMonth != "")){
            // Parse dates, format dates and store in date property of Timeline

            //Parse start date
            startDate = startDateMonth + " " + startDateDate + ", " +  startDateYear;
            timeline.startDateText = startDate;
            startDate = new Date(startDate);
            timeline.startDateProperty = startDate;

            endDate = endDateMonth + " " + endDateDate + ", " +  endDateYear;
            timeline.endDateText = endDate;
            endDate = new Date(endDate);
            timeline.endDateProperty = endDate;

//            if(period == "" || !isNan(parseInt(period))){
//                timeline.timePeriodProperty = period;
//            }

            calculateLength(timeline,startDate,endDate,scale,scaleUnit)

        }

//        //3)If start date and Timeline are entered, put them in timeline qml
//        else if(startDateYear != "" && period != "" && !isNaN(parseInt(period))){
//            startDate = startDateMonth + " " + startDateDate + ", " +  startDateYear;
//            timeline.startDateText = startDate;
//            startDate = new Date(startDate);
//            timeline.startDateProperty = startDate;

//            timeline.timePeriodProperty = period;

//            if(endDateDate != "" && endDateMonth != "" && endDateYear != ""){
//                endDate = endDateMonth + " " + endDateDate + ", " +  endDateYear;
//                timeline.endDateText = endDate;
//                endDate = new Date(endDate);
//                timeline.endDateProperty = endDate;

//                calculateLength(timeline,startDate,endDate,scale,scaleUnit)
//            }
//            else
//            {
//                startDateMilliseconds = Date.parse(startDate);
//                switch(periodUnit){
//                case "s":
//                    endDateMilliseconds = startDateMilliseconds + 1000 * parseInt(period);
//                    break;
//                case "mi":
//                    endDateMilliseconds = startDateMilliseconds + 1000 * 60 * parseInt(period);
//                    break;
//                case "h":
//                    endDateMilliseconds = startDateMilliseconds + 1000 * 60 * 60 * parseInt(period);
//                    break;
//                case "d":
//                    endDateMilliseconds = startDateMilliseconds + 1000 * 60 * 60 * 24 * parseInt(period);
//                    break;
//                case "m":
//                    endDateMilliseconds = startDateMilliseconds + 1000 * 60 * 60 * 24 * 30 * parseInt(period);
//                    break;
//                case "y":
//                    endDateMilliseconds = startDateMilliseconds + 1000 * 60 * 60 * 24 * 30 * 12 * parseInt(period)
//                    break;
//                case "D":
//                    endDateMilliseconds = startDateMilliseconds + 1000 * 60 * 60 * 24 * 30 * 12 * 10 * parseInt(period)
//                    break;
//                case "C":
//                    endDateMilliseconds = startDateMilliseconds + 1000 * 60 * 60 * 24 * 30 * 12 * 10 * 10 * parseInt(period)
//                    break;
//                case "M":
//                    endDateMilliseconds = startDateMilliseconds + 1000 * 60 * 60 * 24 * 30 * 12 * 10 * 10 * 10 * parseInt(period)
//                    break;
//                }
//                endDate = new Date(endDateMilliseconds);
//                calculateLength(timeline,startDate,endDate,scale,scaleUnit)
//            }

//        }

//        //4//3)If end date and Timeline are entered, put them in timeline qml
//        else if(endDateYear != "" && period != "" && !isNaN(parseInt(period))){
//            endDate = endDateMonth + " " + endDateDate + ", " +  endDateYear;
//            timeline.endDateText = endDate;
//            endDate = new Date(endDate);
//            timeline.endDateProperty = endDate;


//            timeline.timePeriodProperty = period;

//            if(startDateDate != "" && startDateMonth != "" && startDateYear != ""){
//                startDate = startDateMonth + " " + startDateDate + ", " +  startDateYear;
//                timeline.startDateText = startDate;
//                startDate = new Date(startDate);
//                timeline.startDateProperty = startDate;
//            }
//        }
    }

    //    console.log("timelinePopulate " + historyWindow.timelineNameCount);
    timeline.placementY = 600 + 350 * (historyWindow.timelineCount -1);
    timeline.placementX = 100

    if(timeline.placementY > historyWindow.height)
        historyWindow.height = timeline.placementY + 500;

}

function whichTimeline(mouseX, mouseY){
    console.log("whichTimeline");
    var i, distance = 10000, closestTimeline;

    for(i=0;i<historyWindow.children.length;i++){

        if(historyWindow.children[i].objectName.indexOf("timeline") != -1){

            if(Math.sqrt(
                        Math.pow((historyWindow.children[i].placementX - mouseX),2) +
                        Math.pow((historyWindow.children[i].placementY - mouseY),2)) < distance){

                distance = Math.sqrt(
                            Math.pow((historyWindow.children[i].placementX - mouseX),2) +
                            Math.pow((historyWindow.children[i].placementY - mouseY),2));

                closestTimeline = historyWindow.children[i];
            }
        }
    }

    return closestTimeline;



}

function calculateLength(timeline, startDate,endDate,scale,scaleUnit){
    var difference = dateDiff(startDate,endDate);
    switch(scaleUnit){
    case "d":
        timeline.widthProperty = difference.d * parseInt(scale) * 100 * timeline.timelinePixelDensity;
        break;
    case "m":
        timeline.widthProperty = difference.d/30 * parseInt(scale)* 100 * timeline.timelinePixelDensity;
        break;
    case "y":
        timeline.widthProperty = difference.y * parseInt(scale)* 100* timeline.timelinePixelDensity;
        break;
    case "D":
        timeline.widthProperty = difference.D * parseInt(scale)* 100* timeline.timelinePixelDensity;
        break;
    case "C":
        timeline.widthProperty = difference.C * parseInt(scale)* 100* timeline.timelinePixelDensity;
        break;
    case "M":
        timeline.widthProperty = difference.M * parseInt(scale)* 100* timeline.timelinePixelDensity;
        break;
    }

    console.log("width : " + timeline.widthProperty + "  " + difference.m)
    if(timeline.widthProperty > scrollableWindow.width){
        historyWindow.width = timeline.widthProperty + 200;

    }
}

