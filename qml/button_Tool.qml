import QtQuick 2.0

Rectangle{
    id: buttonTool;
    color: "transparent";

    property var sPresseImage: "";
    property var sNormalImage: "";
    property var sText: "";
    property var nIndex: 0;

    signal back(var nIndex);

    /********************************************/

    //button image
    Image{
        id:buttonImage;

        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: parent.top;
        width: 60;
        height: 40;
        source: sNormalImage;
    }

    Text{
        id: buttonText
    }
}
