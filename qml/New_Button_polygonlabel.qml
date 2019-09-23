import QtQuick 2.0

Rectangle {
    id: new_Button5;
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
        id: buttonText1;
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
        id: buttonMouseArea1;
        anchors.fill: parent;

        acceptedButtons: Qt.LeftButton;
        onPressed: {
            new_Button5.state = "pressed";
        }

        onReleased: {
          release(nIndex)
          new_Button5.state = "normal"
        }
        onEntered: {
            if(new_Button5.state === "normal")
            {
                new_Button5.state = "hover"
            }
        }
        onExited:
        {
            if(new_Button5.state === "hover"){
                new_Button5.state = "normal";
            }
        }
    }
    states:[
        State{
            name:"normal";
            PropertyChanges {
                target: new_Button5;
                color:"transparent";

            }

        },
        State{
            name:"pressed";
            PropertyChanges {
                target: new_Button5;
                color:"#3a5fcd";
            }
        },
        State{
            name:"hover";
            PropertyChanges {
                target: new_Button5;
                color:"#3a5fcd";
            }
        }

    ]
}
