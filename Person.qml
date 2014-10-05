import QtQuick 2.0
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1
import "."
import "Person.js" as Person

Item{
    id:person
    width:100/1366 * Screen.desktopAvailableWidth
    height:100/768 * Screen.desktopAvailableHeight
    x:personCenterX
    y:personCenterY

    property string personStartDate
    property string personEndDate
    property string personDescription
    property string personName
    property string personImagePath
    property int personCenterX
    property int personCenterY
//    property alias placementX:person.x
//    property alias placementY:person.y
    property alias personButtonProperty:personButton

    Button{
        id:personButton
        radius: width*0.5
        width: 100/1366 * Screen.desktopAvailableWidth
        height: 100/768 * Screen.desktopAvailableHeight
        buttonLabel: "Click to\nadd name"
        MouseArea{
            anchors.fill:parent
            onClicked: properties.visible = true;
        }
    }

    PersonProperties
    {
        id:properties
        visible:false
    }

}



