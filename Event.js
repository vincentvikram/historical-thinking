function create(parentTimeline) {
    var event = Qt.createComponent("Event.qml").createObject(parentTimeline,
                                                             {"objectName":"event" + eventCount+1});
    console.log("Event parent" + parentTimeline);

}

function runUpdate(eventObjectName, whichVariable, variable) {
    var i, historyWindowVariable = event.parent, child;

    for(i=0;i<historyWindowVariable.children.length;i++)
    {
        child = historyWindowVariable.children[i];
        if(child.objectName == eventObjectName){
            break;
        }
    }

    if(whichVariable == "SD"){
        child.eventStartDate = variable;
        console.log("SD " + child.eventStartDate);
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
