import QtQuick 2.0

Rectangle {
    id:buttonTool;

    color: "transparent";

    property var sPressedImage: "image/draw_@2x.png";
    property var sNormalImage: "image/circle_@2x.png";
    property var sHoverImage:"image/default_@2x.png";
    property var nIndex:0;
    signal release(var nIndex);
    Image{
        id:buttonImage;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: parent.top;
        source: "image/label_button@2x.png";
        width:2;
        height:2;
    }
    MouseArea{
        id: buttonMouseArea;
        anchors.fill: parent;
        hoverEnabled:true;
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
    Component.onCompleted:{
        console.log("按钮已创建 for imageshowarea");
    }
}
