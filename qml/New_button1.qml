import QtQuick 2.0

Rectangle {
    id: new_Button1;
    color: "transparent";

    property var sPresseImage: "";
    property var sNormalImage: "";
    property var sHoverImage:"";
    property var sText: "";
    property var nIndex: 0;
    property var fontsize:24
    property var textColor:"#ffffff"
    signal release(var nIndex);

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
        font.pixelSize: fontsize;
        color: textColor;
    }
    MouseArea{
        id: buttonMouseArea;
        anchors.fill: parent;

        acceptedButtons: Qt.LeftButton;
        onPressed: {
            new_Button1.state = "pressed";
        }

        onReleased: {
          release(nIndex)
        }
        onEntered: {
            if(new_Button1.state === "normal")
            {
                new_Button1.state = "hover"
            }
        }
        onExited:
        {
            if(new_Button1.state === "hover"){
                new_Button1.state = "normal";
            }
        }
    }
    states:[
        State{
            name:"normal";
            PropertyChanges {
                target: new_Button1;
                color:"transparent";

            }

        },
        State{
            name:"pressed";
            PropertyChanges {
                target: new_Button1;
                color:"#3a5fcd";
            }
        },
        State{
            name:"hover";
            PropertyChanges {
                target: new_Button1;
                color:"#3a5fcd";
            }
        }

    ]
}
