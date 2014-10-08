function create() {
    var person;

    if(historyWindow.eventCount > 0){
    person = Qt.createComponent("../view/Person.qml").createObject(historyWindow,
                                {"objectName":"person" + (historyWindow.personNameCount)});

    person.personCenterX = 110 * historyWindow.personCount;
    person.personCenterY = 150;
    historyWindow.personCount++;
        historyWindow.personNameCount++;
    }
    else
    {
        error.visible = true;
        error.errorMessageProperty = "People can only be added to events!"

    }

}

function makeAllOtherPropertyBoxesInvisible(person){

    var i=0;

    for(;i<person.parent.children.length;i++){
        if(person.parent.children[i].objectName.indexOf("person") != -1){
            if(person.parent.children[i].propertiesVisible){
                person.parent.children[i].propertiesVisible = false;
            }
        }
    }

    person.propertiesVisible = true;
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
