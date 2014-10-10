function create() {
    var basicline;

    if(historyWindow.timelineCount > 0)
    {
        basicline = Qt.createComponent("../view/BasicLine.qml").createObject(historyWindow,
                                                             {"objectName":"basicline" + (historyWindow.basiclineNameCount)});
        basicline.y = 0;
        basicline.x = 110*historyWindow.basiclineCount;

        if(basicline.placementX > scrollableWindow.width){
            historyWindow.width += 2* basicline.placementX;
        }

        historyWindow.basiclineCount++;
        historyWindow.basiclineNameCount++;

    }
    else
    {
        error.visible = true;
        error.errorMessageProperty = "Please create a timeline first!"

    }

}
/*function create() {
    var basicline;

    if(historyWindow.timelineCount > 0)
    {        
        basicline = Qt.createComponent("BasicLine.qml").createObject(historyWindow,
                                                             {"objectName":"basicline" + (historyWindow.basiclineNameCount)});

        console.log(basicline);
        basicline.x = 500*historyWindow.basicLineCount;
        basicline.y = 600;


        if(basicline.placementX > scrollableWindow.width){
            historyWindow.width += 2* basicline.placementX;
        }

        historyWindow.basiclineCount++;
        historyWindow.basiclineNameCount++;

    }
    else
    {
        error.visible = true;
        error.errorMessageProperty = "Please create a timeline first!"
    }
}*/


