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
        font.pixelSize: fontsize;
        color: textColor;
    }
    MouseArea{
        id: buttonMouseArea;
        anchors.fill: parent;

        acceptedButtons: Qt.LeftButton;
        onPressed: {
            buttonTool.state === "pressed" ? buttonTool.state = "hover": buttonTool.state = "pressed";
        }

        onReleased: {
          release(nIndex)
          buttonTool.state = "normal";
        }
        onEntered: {
            if(buttonTool.state === "normal")
            {
                buttonTool.state = "hover"
            }
        }
        onExited:
        {
            if(buttonTool.state === "hover"){
                buttonTool.state = "normal";
            }
        }
    }
    states:[
        State{
            name:"normal";
            PropertyChanges {
                target: buttonImage;
                source:sNormalImage;

            }
        },
        State{
            name:"pressed";
            PropertyChanges {
                target: buttonImage;
                source:sPressedImage;
            }
        },
        State{
            name:"hover";
            PropertyChanges {
                target: buttonImage;
                source:sHoverImage;
            }
        }

    ]
}
