import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import "."
import "../controller/Person.js" as Person

Item{
    id:person
    width:100/1366 * Screen.desktopAvailableWidth
    height:100/768 * Screen.desktopAvailableHeight
    x:personCenterX
    y:personCenterY

    property string personStartDate
    property alias propertiesVisible:properties.visible
    property string personEndDate
    property string personDescription
    property string personName
    property string personImagePath
    property int personCenterX
    property int personCenterY
    property alias personButtonProperty:personButton

    Menu{
        id:personMenu
        MenuItem{
            text:qsTr("Delete")
            onTriggered: {
                person.destroy();
                historyWindow.personCount -= 1;
            }
        }
        MenuItem{
            text:qsTr("Properties")
            onTriggered:{
                Person.makeAllOtherPropertyBoxesInvisible(person);
            }
        }
    }

    Button{
        id:personButton
        radius: width*0.5
        width: 100/1366 * Screen.desktopAvailableWidth
        height: 100/768 * Screen.desktopAvailableHeight
        buttonLabel: "Click to\nadd name"
        buttonColor: "lightgreen"

        MouseArea{
            anchors.fill:parent
            drag.target:person
            acceptedButtons: Qt.RightButton | Qt.LeftButton
            onClicked: {
                if(mouse.button == Qt.RightButton){
                    personMenu.popup();
                }
            }
        }
    }

    PersonProperties
    {
        id:properties
        visible:false
    }
}




