import QtQuick 2.0

Rectangle {
    id:labelInterface;
    function hideWindow(){
       labelWindow.visible = false;
    }

    Image{
        id:mainbackground;
        source: "image/background_@1x.png"
        anchors.fill: parent;
    }

    Rectangle{
        id:topbackground;
        anchors.top: parent.top
        width: 448;
        height: 50;
        Image {
            id: topbackgroundImage;
            source: "image/Column background_@1x.png";
            anchors.fill: parent
        }
        Text {
            id: topbackgroundText;
            text: "输入标签";
            anchors.fill: parent;
            anchors.left: parent.left;
            anchors.leftMargin: 30;
            anchors.verticalCenter: parent.verticalCenter;
            verticalAlignment: Text.AlignVCenter;
            width: 115;
            height: 30;
            font.family: "PingFang SC";
            font.pixelSize: 24;
            color: "#ffffff";

        }
    }
    Image {
        id: topbackgroundClose;
        source: "image/close_@1x.png";
        anchors.right: parent.right;
        anchors.rightMargin: 14
        anchors.top: parent.top;
        anchors.topMargin: 15;
    }
    Image{
        id:inputLabelImage;
        source: "image/search bar_@1x.png"
        anchors.top: topbackground.bottom;
        anchors.topMargin: 15;
        anchors.left: parent.left;
        anchors.leftMargin: 30
    }
    TextInput{
        id:inputLabel;
        width: 380;
        height:38;
        focus: true;
        font.pixelSize: 24;
//        anchors.centerIn: parent;
        color: "black";
        anchors.left: parent.left;
        anchors.leftMargin: 45;
        anchors.top: topbackground.bottom;
        anchors.topMargin: 20;
        text:"请输入标签";
    }
    //78*40
   New_Button3{
       id:labelInterfaceCancel;
       width: 78;
       height: 40;
       sText: "取消";
       sPressedImage: "image/Cancel box_select@1x.png";
       sNormalImage: "image/Cancel box_select@1x.png";
       sHoverImage: "image/Cancel box_select@1x.png";
       anchors.right: parent.right;
       anchors.rightMargin: 128
       anchors.top: inputLabel.bottom;
       anchors.topMargin: 6;
       onRelease: {
           hideWindow()
       }
   }
   New_Button3{
       id:labelInterfaceConfirm;
       width: 78;
       height: 40;
       sText: "确定"
       sPressedImage: "image/Cancel box_select@1x.png";
       sNormalImage: "image/Cancel box_select@1x.png";
       sHoverImage: "image/Cancel box_select@1x.png";
       anchors.right: parent.right;
       anchors.rightMargin: 30
       anchors.top: inputLabel.bottom;
       anchors.topMargin: 6;
       onRelease: {
           label1[fileIndex][index].push(inputLabel.text);
           console.log("label",label1[fileIndex][index])
           mapItemArea.printLabel();
           mapItemArea.labelListUI.createListButton(inputLabel.text)
           hideWindow()
       }
   }
   Rectangle{
       id:midbackground;
       anchors.top: labelInterfaceConfirm.bottom;
       anchors.topMargin: 18;
       width: 448;
       height: 50;
       Image {
           id: midbackgroundImage;
           source: "image/Column background_@1x.png";
           anchors.fill: parent
       }
       Text {
           id: midbackgroundText;
           text: "选择标签";
           anchors.fill: parent;
           anchors.left: parent.left;
           anchors.leftMargin: 30;
           anchors.verticalCenter: parent.verticalCenter;
           verticalAlignment: Text.AlignVCenter;
           width: 115;
           height: 30;
           font.family: "PingFang SC";
           font.pixelSize: 24;
           color: "#ffffff";

       }
   }
   Rectangle{
       id:bottombackground;
       anchors.top: midbackground.bottom;
       anchors.topMargin: 200;
       width: 448;
       height: 50;
       Image {
           id: bottombackgroundImage;
           source: "image/Column background_@1x.png";
           anchors.fill: parent
       }
       Text {
           id: bottombackgroundText;
           text: "历史标签";
           anchors.fill: parent;
           anchors.left: parent.left;
           anchors.leftMargin: 30;
           anchors.verticalCenter: parent.verticalCenter;
           verticalAlignment: Text.AlignVCenter;
           width: 115;
           height: 30;
           font.family: "PingFang SC";
           font.pixelSize: 24;
           color: "#ffffff";

       }
   }

}
