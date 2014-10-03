function create(parentEvent) {
    console.log("create person")
    var person = Qt.createComponent("Person.qml").createObject(parentEvent,
                            {"objectName":"person" + (parentEvent.personCount)});
    var positionsArray = [{"x":(person.x + person.width),"y":person.y},
                          {"x":(person.x+person.width),"y":(person.y  - person.height)},
                          {"x":person.x,"y":(person.y  - person.height)},
                          {"x":(person.x-person.width),"y":(person.y  - person.height)},
                          {"x":person.x - person.width,"y":person.y}]
    person.personCenterX = person.mapToItem(parentEvent, positionsArray[parentEvent.personCount].x,positionsArray[parentEvent.personCount].y).x;
    person.personCenterY = person.mapToItem(parentEvent, positionsArray[parentEvent.personCount].x,positionsArray[parentEvent.personCount].y).y;
    parentEvent.personCount++;
}

function runUpdate(personObjectName, whichVariable, variable) {
    var i, parentTimeline = person.parent, child;

    for(i=0;i<parentTimeline.children.length;i++)
    {
        child = parentTimeline.children[i];
        if(child.objectName == personObjectName){
            break;
        }
    }

    if(whichVariable == "SD"){
        child.personStartDate = variable;
        console.log("SD " + child.personStartDate);
        var parsedDate = Date.parse(variable);
        if(!isNaN(parsedDate))
            sortpersons(personObjectName);
    }
    else if(whichVariable == "ED"){

        child.personEndDate = variable;
        console.log("ED " + child.personEndDate);
    }
    else if(whichVariable == "IMG"){
        child.personImagePath = variable;
        console.log("IMG " + child.personImagePath);
    }
    else if(whichVariable == "DESC"){
        child.personDescription = variable;
        console.log("DESC " + child.personDescription);
    }
    else if(whichVariable == "EN"){
        child.personName = variable;
        console.log("EN " + child.personName);
    }


}


function sortpersons(personObjectName){
    var i, currentpersonIndex, insertPosition, j, child, parentTimeline = person.parent;
    console.log(parentTimeline.children.length);
    for(i=0;i<parentTimeline.children.length;i++){
        child = parentTimeline.children[i];
        if(child.objectName == personObjectName){
            currentpersonIndex = i;
            break;
        }
    }
    console.log(currentpersonIndex + " current person index");
    var currentpersonStartDate = Date.parse(parentTimeline.children[currentpersonIndex].personStartDate);
    for(i=0;i<parentTimeline.children.length - 1;i++){
        if(currentpersonStartDate >= Date.parse(parentTimeline.children[i].personStartDate) &&
                currentpersonStartDate < Date.parse(parentTimeline).children[i+1].personStartDate){
            insertPosition = i+1;
        }
    }

    for(j=(parentTimeline.children.length - 1);j>insertPosition;j--){
        parentTimeline.children[j].placementX += 300;
    }

    parentTimeline.children[currentpersonIndex].placementX = insertPosition * 300;
}

/* Calcualtes the angle between the two points */
function getAngle(sx1, sy1, sx2, sy2)
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
function drawLine(element1,mainWindow, x1, y1, x2, y2){
    console.log("draw line");
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

function whichperson(parentTimeline, mouseX, mouseY){
    console.log("whichperson");
    var i, distance = 10000, closestperson;

    for(i=0;i<parentTimeline.children.length;i++){

        if(parentTimeline.children[i].objectName.indexOf("person") != -1){

            if(Math.sqrt(
                        Math.pow((parentTimeline.children[i].placementX - mouseX),2) +
                        Math.pow((parentTimeline.children[i].placementY - mouseY),2)) < distance){

                distance = Math.sqrt(
                            Math.pow((parentTimeline.children[i].placementX - mouseX),2) +
                            Math.pow((parentTimeline.children[i].placementY - mouseY),2));

                closestperson = parentTimeline.children[i];
            }
        }
    }

    return closestperson;
}
