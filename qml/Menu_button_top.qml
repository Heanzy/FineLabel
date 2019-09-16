import QtQuick 2.0
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
Rectangle {

    id: menu_Button;

    color: "#474747";

    property var sPressedImage: "";
    property var sNormalImage: "";
    property var sHoverImage: "";
    property var sTextText: "";
    property var nTextSize: 12;
    property var nIndex: 0;

    signal menuButtonIndexBack(var nIndex);


    Image
    {
        id: menuButtonImage;
        anchors.fill: parent;
        source: sNormalImage;
    }


    Text {
        id: menuButtonText;x: 0;
        y: 0;
        width: parent.width;
        height: parent.height;
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignVCenter;
        wrapMode: Text.WordWrap;
        color: "#eeeeee";
        font.family: "微软雅黑";
        font.pixelSize: nTextSize;
        font.letterSpacing: 1;
//        font.bold: true;
        text: sTextText;
    }

    MouseArea
    {
        id: menuButtonMouseArea;

        anchors.fill: parent;
        acceptedButtons: Qt.LeftButton ;
        hoverEnabled: true;
        onPressed:
        {
            menu_Button.state = "pressed";
            menuAllMouseArea.visible = true;
            if(nIndex == 0)
            {
                rect_MenuFile.visible = true;
                rect_MenuEdit.visible = false;
                rect_MenuTool.visible = false;
                rect_MenuHelp.visible = false;
            }
            if(nIndex == 1)
            {
                rect_MenuEdit.visible = true;
                rect_MenuFile.visible = false;
                rect_MenuTool.visible = false;
                rect_MenuHelp.visible = false;
            }
            if(nIndex == 2)
            {
                rect_MenuTool.visible = true;
                rect_MenuFile.visible = false;
                rect_MenuEdit.visible = false;
                rect_MenuHelp.visible = false;
            }
            if(nIndex == 3)
            {
                rect_MenuHelp.visible = true;
                rect_MenuFile.visible = false;
                rect_MenuEdit.visible = false;
                rect_MenuTool.visible = false;
            }
        }
        onReleased:
        {
            menuButtonIndexBack(nIndex);
//            console.log("release->menuButton");
            if(nIndex>3)
            {
                rect_MenuFile.visible = false;
                rect_MenuEdit.visible = false;
                rect_MenuTool.visible = false;
                rect_MenuHelp.visible = false;
            }

        }
        onEntered:
        {
            if(menu_Button.state === "normal")
                menu_Button.state = "hover";
//            console.log("enter->menuButton");
            menu_Button.color = "#666666";
        }
        onExited:
        {
            if(menu_Button.state === "hover")
                menu_Button.state = "normal";
//            console.log("exit->menuButton");
            menu_Button.color = "#474747";
        }
        onClicked:
        {
            pictimer.running = true
//            if(nIndex==4)
//            {
////                fileDialog.selectExisting = false;

//                fileDialog.open();
//            }
        }

    }

    FileDialog {
        id: fileDialog;
        folder: shortcuts.desktop;
        nameFilters: ["Text files (*.txt)", "HTML files (*.html, *.htm)"]
        onAccepted: {
            if (fileDialog.selectExisting)
                document.fileUrl = fileUrl;
            else
                document.saveAs(fileUrl, selectedNameFilter);
        }
    }

    states: [
        State {
            name: "normal";
            PropertyChanges {
                target: menuButtonImage;
                source: sNormalImage;
            }
        },
        State {
            name: "pressed";
            PropertyChanges {
                target: menuButtonImage;
                source: sPressedImage;
            }
        },
        State {
            name: "hover";
            PropertyChanges {
                target: menuButtonImage;
                source: sHoverImage;
            }
        }
    ]




}

