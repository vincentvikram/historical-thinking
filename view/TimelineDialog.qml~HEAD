// This QML file (called Dialog.qml) is used to create a simple popup
// It will show an overlay on top of the parent and a small white area
// that is the dialog itself. For demo purposes no fancy stuff in the popup
import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import "."
import "../controller/TimeLinePopulate.js" as Timeline

// Use an item as container to group both the overlay and the dialog
// I do this because the overlay itself has an opacity set, and otherwise
// also the dialog would have been semi-transparent.
// I use an Item instead of an Rectangle. Always use an 'Item' if it does not
// display stuff itself, this is better performance wise.
Item {
    id: dialogComponent
    anchors.fill: parent

//    property alias timelineArrayProperty: parent.timelineArrayProperty
    Component.onCompleted: {
        console.log(timelineArrayProperty);

    }

    // Add a simple animation to fade in the popup
    // let the opacity go from 0 to 1 in 400ms
    PropertyAnimation { target: dialogComponent; property: "opacity";
        duration: 400; from: 0; to: 1;
        easing.type: Easing.InOutQuad ; running: true }

    // This rectange is the a overlay to partially show the parent through it
    // and clicking outside of the 'dialog' popup will do 'nothing'
    Rectangle {
        anchors.fill: parent
        id: overlay
        color: "#000000"
        opacity: 0.6
        // add a mouse area so that clicks outside
        // the dialog window will not do anything
        MouseArea {
            anchors.fill: parent

            onClicked: dialogComponent.destroy()
        }
    }
    Rectangle{
        anchors.centerIn: parent
        TabView {
            width: 360
            height: 360
            anchors.centerIn: parent

            Component.onCompleted: {
                addTab("Start Date/End Date", tab1)
                addTab("Start Date/Period", tab2)
                addTab("Period/End Date", tab3)
            }

            Component {
                id: tab1
                Rectangle {
                    color: "white";

                    TextField {
                        id: startDate1
                        y: 10
                        placeholderText: qsTr("dd/mm/yyyy")
                        //                        validator: RegExpValidator { regExp:
                        //                                '/^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|'}
                    }

                    TextField {
                        id: endDate1
                        y: 40
                        placeholderText: qsTr("dd/mm/yyyy")
                        //                        validator: RegExpValidator { regExp:
                        //                                '/^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|'}

                    }
                    Button {
                        id: button1
                        anchors.centerIn: parent
                        buttonLabel: "OK"
                        onButtonClick: {
                            Timeline.populate(startDate1.text,endDate1.text,"");
                            dialogComponent.destroy()
                        }
                    }
                }

            }

            Component {
                id: tab2
                Rectangle {
                    color: "white"

                    TextField {
                        id: startDate2
                        y: 10
                        placeholderText: qsTr("dd/mm/yyyy")
                        //                        validator: RegExpValidator { regExp:
                        //                                '/^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|'}
                    }

                    TextField {
                        id: period2
                        y: 40
                        placeholderText: qsTr("No. of years")
                    }
                    Button {
                        id: button2
                        anchors.centerIn: parent
                        buttonLabel: "OK"
                        onButtonClick: {
                            Timeline.populate(startDate2.text,"",period2.text);
                            dialogComponent.destroy()
                        }
                    }
                }
            }
            Component {
                id: tab3
                Rectangle {
                    color: "white"

                    TextField {
                        id: period3
                        y: 10
                        placeholderText: qsTr("No of years")
                    }

                    TextField {
                        id: endDate3
                        y: 40
                        placeholderText: qsTr("dd/mm/yyyy")
                        //                        validator: RegExpValidator { regExp:
                        //                                '/^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|'}
                    }
                    Button {
                        id: button3
                        anchors.centerIn: parent
                        buttonLabel: "OK"
                        onButtonClick: {
                            Timeline.populate("",endDate3.text,period3.text);
                            dialogComponent.destroy()
                        }
                    }
                }
            }
        }
    }
}
