import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.1

Rectangle {
    width: 360
    height: 360
    MouseArea {
        anchors.fill: parent
        onClicked: {
//            Qt.quit();
        }

        TextInput {
            signal getDate1
            validator: RegExpValidator { regExp: /^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((19|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$/g; }
            cursorVisible: true
            id: date1
            color: "red";
            x: 24
            y: 38
            width: 80
            height: 20
            text: qsTr("Start date(dd/mm/yyyy)")
            font.pixelSize: 12

            onAccepted: {
                color = "green";
            }
        }

        TextInput {
            signal getDate2
            validator: RegExpValidator { regExp: /^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((19|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$/g; }
            id: date2
            color:"red"
            x: 257
            y: 38
            width: 80
            height: 20
            text: qsTr("End date(dd/mm/yyyy)")
            font.pixelSize: 12


            onAccepted: {
                color = "green";
            }
        }
    }
}

