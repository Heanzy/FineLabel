import QtQuick 2.0

Rectangle{
    id:labelInterfaceCancel;
    color: "transparent";
    property var sPressedImage: "image/Cancel box_select@1x.png";
    property var sNormalImage: "image/Cancel box_select@1x.png";
    property var sHoverImage:"image/Cancel box_select@1x.png";
    property var sText: "";
    property var nIndex: 0;

    signal release(var nIndex);
    Image{
        id:labelInterfaceCancelImage;
        source: "image/Cancel box_select@1x.png"
    }
    Text {
        id: labelInterfaceCancelText;
        text: sText;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.verticalCenter: parent.verticalCenter;
        verticalAlignment: Text.AlignVCenter;
        horizontalAlignment: Text.AlignHCenter;
        width: 50;
        height: 30;
        font.family: "PingFang SC";
        font.pixelSize: 24;
        color: "black";
    }
    MouseArea{
        id: buttonMouseArea;
        anchors.fill: parent;

        acceptedButtons: Qt.LeftButton;
        onPressed: {
            labelInterfaceCancel.state === "pressed" ? labelInterfaceCancel.state = "hover": labelInterfaceCancel.state = "pressed";
        }

        onReleased: {
          release(nIndex)
          labelInterfaceCancel.state = "normal";
        }
        onEntered: {
            if(labelInterfaceCancel.state === "normal")
            {
                labelInterfaceCancel.state = "hover"
            }
        }
        onExited:
        {
            if(labelInterfaceCancel.state === "hover"){
                labelInterfaceCancel.state = "normal";
            }
        }
    }
    states:[
        State{
            name:"normal";
            PropertyChanges {
                target: labelInterfaceCancelImage;
                source:sNormalImage;

            }
        },
        State{
            name:"pressed";
            PropertyChanges {
                target: labelInterfaceCancelImage;
                source:sPressedImage;
            }
        },
        State{
            name:"hover";
            PropertyChanges {
                target: labelInterfaceCancelImage;
                source:sHoverImage;
            }
        }

    ]
}
