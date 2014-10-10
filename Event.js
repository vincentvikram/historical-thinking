function create() {
    var event;

    if(historyWindow.timelineCount > 0)
    {
        event = Qt.createComponent("Event.qml").createObject(historyWindow,
                                                             {"objectName":"event" + (historyWindow.eventNameCount)});
        event.y = 0;
        event.x = 110*historyWindow.eventCount;

        if(event.placementX > scrollableWindow.width){
            historyWindow.width += 2* event.placementX;
        }

        historyWindow.eventCount++;
        historyWindow.eventNameCount++;

    }
    else
    {
        error.visible = true;
        error.errorMessageProperty = "Please create a timeline first!"

    }

}

/*function makeAllOtherPropertyBoxesInvisible(event){

    var i=0;

    for(;i<event.parent.children.length;i++){
        if(event.parent.children[i].objectName.indexOf("event") != -1){
            if(event.parent.children[i].propertiesVisible){
                event.parent.children[i].propertiesVisible = false;
            }
        }
    }

    event.propertiesVisible = true;
}*/

/*function runUpdate(eventObjectName, whichVariable, variable) {
    var i, parentTimeline = event.parent, child;

    for(i=0;i<parentTimeline.children.length;i++)
    {
        child = parentTimeline.children[i];
        if(child.objectName == eventObjectName){
            break;
        }
    }

    if(whichVariable == "SD"){
        child.eventStartDate = variable;
        console.log("SD " + child.eventStartDate);
        var parsedDate = Date.parse(variable);
        if(!isNaN(parsedDate))
            sortEvents(eventObjectName);
    }
    else if(whichVariable == "ED"){

        child.eventEndDate = variable;
        console.log("ED " + child.eventEndDate);
    }
    else if(whichVariable == "IMG"){
        child.eventImagePath = variable;
        console.log("IMG " + child.eventImagePath);
    }
    else if(whichVariable == "DESC"){
        child.eventDescription = variable;
        console.log("DESC " + child.eventDescription);
    }
    else if(whichVariable == "EN"){
        child.eventName = variable;
        console.log("EN " + child.eventName);
    }


}

/* Calcualtes the angle between the two points */
/*function getAngle(sx1, sy1, sx2, sy2)
{
    var dy, slope, angle;
    var dx = sx2 - sx1;
    if (dx === 0)
        return 0;
    dy = sy2 - sy1;
    slope = dy / dx;
    angle = Math.atan(slope) * 180 / Math.PI;

    if (dy < 0 && dx < 0){
        return angle;
    }
    else if (dy >= 0 && dx >= 0){
        return angle + 180;
    }
    else if (dy < 0 && dx >= 0){
        return angle + 180;
    }
    else if (dy >= 0 && dx < 0){
        return angle;
    }
    else
        return 0;
}

/* Draw a line dynamically to display the drag */
/*function drawLine(element1,mainWindow, x1, y1, x2, y2){*/
/*    console.log("draw line");
    historyWindow.linkCount++;
    var line = Qt.createComponent("Link.qml").createObject(mainWindow,
                                                           {"objectName":"link" + historyWindow.linkCount});

    console.log("component created");
    line.rotation = getAngle(x1, y1, x2, y2);
    line.width = Math.sqrt(Math.pow((x1 - x2), 2) + Math.pow((y1- y2), 2));
    line.x = x1
    line.y = y1
    line.z =  element1.z - 1
    historyWindow.clickCount = 0;
    historyWindow.linkEnabled = false;
    //    console.log(line.transformOriginPoint)
    //    line.opacity = 1.0
}

function whichEvent(parentTimeline, mouseX, mouseY){
    console.log("whichEvent");
    var i, distance = 10000, closestEvent;

    for(i=0;i<parentTimeline.children.length;i++){

        if(parentTimeline.children[i].objectName.indexOf("event") != -1){

            if(Math.sqrt(
                        Math.pow((parentTimeline.children[i].placementX - mouseX),2) +
                        Math.pow((parentTimeline.children[i].placementY - mouseY),2)) < distance){

                distance = Math.sqrt(
                            Math.pow((parentTimeline.children[i].placementX - mouseX),2) +
                            Math.pow((parentTimeline.children[i].placementY - mouseY),2));

                closestEvent = parentTimeline.children[i];
            }
        }
    }

    return closestEvent;
}

function eventDragged(event, differenceX, differenceY){
    var i=0, person, position;
    console.log("event dragged: " + differenceX + "  " + differenceY);



    for(i=0;i<event.children.length;i++){
        if(event.children[i].objectName.indexOf("person") != -1){
            person = event.children[i];
            person.personCenterX += differenceX;
            person.personCenterY += differenceY;
        }
    }
}

//function getPersonPosition(person, i){
//    var positionsArray = [{"x":(person.x + person.width),"y":person.y},
//                          {"x":(person.x+person.width),"y":(person.y  - person.height)},
//                          {"x":person.x,"y":(person.y  - person.height)},
//                          {"x":(person.x-person.width),"y":(person.y  - person.height)},
//                          {"x":person.x - person.width,"y":person.y}];

//    return positionsArray[i-2];
//}
*/
