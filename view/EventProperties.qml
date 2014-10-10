// This QML file (called Dialog.qml) is used to create a simple popup
// It will show an overlay on top of the parent and a small white area
// that is the dialog itself. For demo purposes no fancy stuff in the popup
import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import "."
import "../controller/Event.js" as Event

// Use an item as container to group both the overlay and the dialog
// I do this because the overlay itself has an opacity set, and otherwise
// also the dialog would have been semi-transparent.
// I use an Item instead of an Rectangle. Always use an 'Item' if it does not
// display stuff itself, this is better performance wise.

Rectangle{

    id: eventPropertiesDialog
    transformOrigin: Item.Top
    x:683/1366 * Screen.desktopAvailableWidth
    y:384/768 * Screen.desktopAvailableHeight

    property int filterCount
    property int imageCount
    TabView {
        id:eventPropertiesTab
        width: 800/1366 * Screen.desktopAvailableWidth
        height: 600/768 * Screen.desktopAvailableHeight
        anchors.centerIn: parent

        Component.onCompleted: {
            addTab("Event Properties" , tab1)

        }
        Component {
            id: tab1

            Rectangle {
                color: "gray";

                Column{
                    TextField{
                        id:eName
                        width:400/1366 * Screen.desktopAvailableWidth
                        placeholderText: qsTr("Event name")
                        onTextChanged:{Event.runUpdate(eventPropertiesDialog.parent, "EN", eName.text);
                            eventPropertiesDialog.parent.eventButtonProperty.buttonLabel = eName.text;
                        }
                    }
                    Row{
                        TextField{
                            id:startDate
                            width: 400/1366 * Screen.desktopAvailableWidth
                            height:50/768 * Screen.desktopAvailableHeight
                            placeholderText: qsTr("dd-MMM-yyyy")
                            onTextChanged:Event.runUpdate(eventPropertiesDialog.parent, "SD", startDate.text);
                        }
                        TextField{
                            id:endDate
                            width: 400/1366 * Screen.desktopAvailableWidth
                            height:50/768 * Screen.desktopAvailableHeight
                            placeholderText: qsTr("dd-MMM-yyyy")
                            onTextChanged:Event.runUpdate(eventPropertiesDialog.parent, "ED", endDate.text);
                        }
                    }
                }

                TextArea {
                    y:90/768 * Screen.desktopAvailableHeight
                    width:790/1366 * Screen.desktopAvailableWidth
                    height:200/768 * Screen.desktopAvailableHeight
                    id: eventDesc
                    wrapMode: TextEdit.Wrap
                    onTextChanged:Event.runUpdate(eventPropertiesDialog.parent, "DESC", eventDesc.text);
                }

                Row{
                    id:imageContainer
                    width:790/1366 * Screen.desktopAvailableWidth
                    height:100/768 * Screen.desktopAvailableHeight
                    x:3/1366 * Screen.desktopAvailableWidth
                    y:280/768 * Screen.desktopAvailableHeight
                    spacing:10/1366 * Screen.desktopAvailableWidth
                }
                Row{
                    id:filterContainer
                    width:790/1366 * Screen.desktopAvailableWidth
                    height:110/768 * Screen.desktopAvailableHeight
                    x:0
                    y:390/768 * Screen.desktopAvailableWidth
                    spacing:10/1366 * Screen.desktopAvailableWidth
                }

                Row{
                    x:100/1366 * Screen.desktopAvailableWidth
                    y:530/768 * Screen.desktopAvailableHeight
                    spacing: 100/1366 * Screen.desktopAvailableWidth
                    Button{
                        id:filters

                        buttonLabel: "Add filter"

                        MouseArea{
                            anchors.fill:parent

                            onClicked:{
                                if(filterCount < 8){
                                    Qt.createQmlObject(
                                                'import QtQuick 2.2; import QtQuick.Controls 1.2; TextField {id: tf'
                                                + filterCount +
                                                '; width: 90;height: 30;}',filterContainer,"filterError");
                                    console.log(filterCount)
                                    filterCount++;
                                }
                            }
                        }
                    }
                    Button{
                        id:addImage

                        buttonLabel: "Add Media"
                        Menu{
                            id:imageMenu
                            MenuItem{
                                text:qsTr("Images")
                                onTriggered: {
                                    if(imageCount < 7){
                                        Qt.createQmlObject("import QtQuick 2.0; Image{ id:img"
                                                           + imageCount + "; objectName:img"
                                                           + imageCount +";width:100; height:100;}",
                                                           imageContainer,"imageError");
                                        fileDialog.open()
                                    }
                                }
                            }
                            MenuItem{
                                text:qsTr("Video")
                                onTriggered: {
                                    if(imageCount < 7){
                                        Qt.createQmlObject("import QtQuick 2.0; Image{ id:img"
                                                           + imageCount + "; objectName:img"
                                                           + imageCount +";width:100; height:100;}",
                                                           imageContainer,"imageError");
                                        fileDialog.open()
                                    }
                                }
                            }
                        }
                        MouseArea{
                            anchors.fill:parent

                            onClicked:{
                                imageMenu.popup()
                            }
                        }
                    }
                    Button{
                        id:close

                        buttonLabel: "Close"

                        MouseArea{
                            anchors.fill:parent

                            onClicked:{
                                eventPropertiesDialog.visible = false;

                            }
                        }
                    }

                    FileDialog {
                        id: fileDialog
                        title: "Please choose a file"
                        selectMultiple: false
                        onAccepted: {
                            imageContainer.children[imageCount].source = fileDialog.fileUrl;
                            imageCount++;

                        }
                        onRejected: {
                            imageContainer.children[imageCount].destroy();
                            fileDialog.close();
                        }
                    }

                }
            }

        }

    }

}

