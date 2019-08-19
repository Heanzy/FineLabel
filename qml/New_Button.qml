import QtQuick 2.0

Rectangle {
    id: new_Button;
    color: "transparent";

    property var sPresseImage: "";
    property var sNormalImage: "";
    property var sText: "";
    property var nIndex: 0;

    signal back(var nIndex);

    /********************************************/

    //button image

    Text{
        id: buttonText;
        anchors.fill: parent;
        horizontalAlignment: Text.horizontalCenter;
        verticalAlignment: Text.verticalCenter;
        anchors.verticalCenter: parent.verticalCenter;
        anchors.horizontalCenter: parent.horizontalCenter;
        text: sText;
        font.pixelSize: 24;
        color: "#ffffff";
    }
}
