import QtQuick 2.0

Rectangle{
    id: buttonTool;
    color: "transparent";

    property var sPressedImage: "";
    property var sNormalImage: "";
    property var sHoverImage:"";
    property var sText: "";
    property var nIndex: 0;

    signal release(var nIndex);

    /********************************************/

    //button image
    Image{
        id:buttonImage;

        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: parent.top;
        width: 20;
        height: 20;
        source: sNormalImage;
    }

    Text{
        id: buttonText
        anchors.top:buttonImage.bottom;
        anchors.topMargin: 6;
        width: parent.width;
        height: 10;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;
        color: "#e8e8e8";
        font.family: "PingFang SC"
        text: sText;
        font.pixelSize: 12;
    }


    //鼠标悬浮按钮颜色改变还未解决*******/
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
