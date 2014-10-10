import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import "."
import "../controller/TimeLine.js" as Timeline

Item {
    id: dialogComponent
    anchors.fill: parent

    property variant timelineArray:[]

    PropertyAnimation { target: dialogComponent; property: "opacity";
        duration: 400; from: 0; to: 1;
        easing.type: Easing.InOutQuad ; running: true }

    Rectangle {
        anchors.fill: parent
        id: overlay
        color: "#000000"
        opacity: 0.6
//        MouseArea {
//            anchors.fill: parent
//            onClicked: {dialogComponent.visible = false;
//                startDateDate.text ="";
//                startDateMonth.text = "";
//                startDateYear.text = "";
//                endDateDate.text="";
//                endDateMonth.text= "";
//                endDateYear.text= "";
//                period.text = "";
//                }
//        }
    }
    Rectangle{

        color: "white"

        Column{
            Row{
                ExclusiveGroup{id:startDateRadioButtons}

                Text{
                    text: "Start Date  "
                }
                TextField{
                    id:startDateDate
                    placeholderText: qsTr("01");
                    maximumLength:2
                }
                TextField{
                    id:startDateMonth
                    placeholderText: qsTr("Jan")
                    maximumLength:3
                }
                TextField{
                    id:startDateYear
                    placeholderText: qsTr("yyyy")
                    maximumLength:4
                }
                RadioButton{
                    id:adStartDate
                    checked:true
                    text:"A.D/C.E"
                    exclusiveGroup: startDateRadioButtons
                }
                RadioButton{
                    id:bcStartDate
                    text:"B.C/B.C.E"
                    exclusiveGroup: startDateRadioButtons
                }
            }
            Row{
                Text{
                    text: "End Date    "
                }

                ExclusiveGroup{id:endDateRadioButtons}
                TextField{
                    id:endDateDate
                    placeholderText: qsTr("01");
                    maximumLength:2
                }
                TextField{
                    id:endDateMonth
                    placeholderText: qsTr("Jan")
                    maximumLength:3
                }
                TextField{
                    id:endDateYear
                    placeholderText: qsTr("yyyy")
                    maximumLength: 4
                }

                RadioButton{
                    id:adEndDate
                    checked:true
                    text:"A.D/C.E"
                    exclusiveGroup: endDateRadioButtons
                }
                RadioButton{
                    id:bcEndDate
                    text:"B.C/B.C.E"
                    exclusiveGroup: endDateRadioButtons
                }
            }
//            Row{
//                Text{
//                    text:"Time period"
//                }

//                TextField{
//
//                    id:period
//                    validator: IntValidator {bottom:1; top:2147483647}
//                    placeholderText: qsTr("Time Period")
//               }
//                ComboBox{
//                    id:periodUnit
//                    model:["s","min","h","d","m","y","D","C","M"]
//                }
//            }

            Row{
                spacing: 5
                Text{
                    text:"Scale:"
                }
                ComboBox{
                    id:scaleUnit
                    model:["d","m","y","D","C","M"]
                }

                TextField{
                    id:scale
                    validator: IntValidator {bottom:1; top:2147483647}
                    text:"1"
                }
                Text{
                    text:"cm"
                }

            }

            Button{
                id:ok
                buttonLabel: "Ok"
                onButtonClick:
                {
                    console.log(scaleUnit.currentText);
//                    Timeline.populate(timelineArray,startDateDate.text,startDateMonth.text,
//                                       startDateYear.text, endDateDate.text,endDateMonth.text, endDateYear.text, adStartDate.checked,bcStartDate.checked, adEndDate.checked,
//                                       bcEndDate.checked, periodUnit, scale.text, scaleUnit.currentText);
                    Timeline.populate(timelineArray,startDateDate.text,startDateMonth.text,
                                       startDateYear.text, endDateDate.text,endDateMonth.text, endDateYear.text, adStartDate.checked,bcStartDate.checked, adEndDate.checked,
                                       bcEndDate.checked, scale.text, scaleUnit.currentText);
                    dialogComponent.visible = false;
                }

            }
            Button{
                id:close
                buttonLabel: "Close"
//              x: ok.x + 100 //The x and y positioning does not do things as expected
//              y:ok.y      // We need to check this out. till then default position
                onButtonClick:
                {
                    dialogComponent.visible = false;
                }

            }
        }
    }
}

