// This QML file (called Dialog.qml) is used to create a simple popup
// It will show an overlay on top of the parent and a small white area
// that is the dialog itself. For demo purposes no fancy stuff in the popup
import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import "."
import "../controller/Person.js" as Person

// Use an item as container to group both the overlay and the dialog
// I do this because the overlay itself has an opacity set, and otherwise
// also the dialog would have been semi-transparent.
// I use an Item instead of an Rectangle. Always use an 'Item' if it does not
// display stuff itself, this is better performance wise.

Item {
    id: personPropertiesDialog
    property int filterCount
    property int imageCount
    transformOrigin: Item.Top
    x:personPropertiesDialog.mapToItem(personPropertiesDialog.parent.parent,683/1366 * Screen.desktopAvailableWidth,150/768 * Screen.desktopAvailableHeight).x
    y:personPropertiesDialog.mapToItem(personPropertiesDialog.parent.parent,683/1366 * Screen.desktopAvailableWidth,150/768 * Screen.desktopAvailableHeight).y
    z:personPropertiesDialog.parent.z + 10000

    Rectangle{
        TabView {
            width: 800/1366 * Screen.desktopAvailableWidth
            height: 600/768 * Screen.desktopAvailableHeight
            anchors.centerIn: parent

            Component.onCompleted: {
                addTab("Person Properties" , tab1)

            }

            Component {
                id: tab1
                Rectangle {
                    color: "gray";

                    Column{
                        TextField{
                            id:eName
                            width:400/1366 * Screen.desktopAvailableWidth
                            placeholderText: qsTr("Person name")
                            onTextChanged:{Person.runUpdate(personPropertiesDialog.parent, "EN", eName.text);
                                personPropertiesDialog.parent.personButtonProperty.buttonLabel = eName.text;
                            }
                        }
                        Row{
                            TextField{
                                id:startDate
                                width: 400/1366 * Screen.desktopAvailableWidth
                                height:50/768 * Screen.desktopAvailableHeight
                                placeholderText: qsTr("dd-MMM-yyyy")
                                onTextChanged:person.runUpdate(personPropertiesDialog.parent, "SD", startDate.text);
                            }
                            TextField{
                                id:endDate
                                width: 400/1366 * Screen.desktopAvailableWidth
                                height:50/768 * Screen.desktopAvailableHeight
                                placeholderText: qsTr("dd-MMM-yyyy")
                                onTextChanged:person.runUpdate(personPropertiesDialog.parent, "ED", endDate.text);
                            }
                        }
                    }

                    TextArea {
                        y:90/768 * Screen.desktopAvailableHeight
                        width:790/1366 * Screen.desktopAvailableWidth
                        height:200/768 * Screen.desktopAvailableHeight
                        id: personDesc
                        wrapMode: TextEdit.Wrap
                        onTextChanged:person.runUpdate(personPropertiesDialog.parent, "DESC", personDesc.text);
                    }

                    Row{
                        id:imageContainer
                        width:790/1366 * Screen.desktopAvailableWidth
                        height:100/768 * Screen.desktopAvailableHeight
                        x:3/1366 * Screen.desktopAvailableWidth
                        y:280/768 * Screen.desktopAvailableHeight
                        spacing:10
                    }
                    Row{
                        id:filterContainer
                        width:790/1366 * Screen.desktopAvailableWidth
                        height:110/768 * Screen.desktopAvailableHeight
                        x:0
                        y:390/768 * Screen.desktopAvailableHeight
                        spacing:10

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
                                                    '; width: 90;height: 30;}',filterContainer);
                                        console.log(filterCount)
                                        filterCount++;
                                    }
                                }
                            }
                        }
                        Button{
                            id:addImage

                            buttonLabel: "Add Images"

                            MouseArea{
                                anchors.fill:parent

                                onClicked:{
                                    if(imageCount < 7){
                                        Qt.createQmlObject("import QtQuick 2.0; Image{ id:img"
                                                           + imageCount + ";width:100; height:100;}",
                                                           imageContainer,"imageError");
                                        fileDialog.open()
                                    }

                                }
                            }
                        }
                        Button{
                            id:close

                            buttonLabel: "Close"

                            MouseArea{
                                anchors.fill:parent

                                onClicked:{
                                    personPropertiesDialog.visible = false;

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
}

