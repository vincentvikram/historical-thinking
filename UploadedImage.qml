import QtQuick 1.1
import QtQuick.Window 2.1

Rectangle {
    Image{
        id:uploadedImage
        width:200/1366 * Screen.desktopAvailableWidth
        height:100/768 * Screen.desktopAvailableHeight

        Text{
            id:imageText
            text: "Click to add\n image"
        }
    }
}
