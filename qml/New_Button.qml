import QtQuick 2.0

Rectangle {
    id: new_Button;
    color: "transparent";

    property var sPresseImage: "";
    property var sNormalImage: "";
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
            new_Button.state === "pressed" ? new_Button.state = "hover": new_Button.state = "pressed";
        }

        onReleased: {
          release(nIndex)
          new_Button.state = "normal";
        }
        onEntered: {
            if(new_Button.state === "normal")
            {
                new_Button.state = "hover"
            }
        }
        onExited:
        {
            if(new_Button.state === "hover"){
                new_Button.state = "normal";
            }
        }
    }
    states:[
        State{
            name:"normal";
            PropertyChanges {
                target: buttonText;
                color:textColor;

            }
        },
        State{
            name:"pressed";
            PropertyChanges {
                target: buttonText;
                color:"red";
            }
        },
        State{
            name:"hover";
            PropertyChanges {
                target: buttonText;
                color:"red";
            }
        }

    ]
}
