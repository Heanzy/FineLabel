import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.0
import he.qt.FileList 1.0
Rectangle {
    id: mainInterface;
    color: "#EAEAEA"

    //-----------------------------------------------//


    //界面上部红背景色
    Image {
        id: topbackground;
        source: "image/Top background_@1x_new.png";

        width: parent.width;
        height: 90;

        anchors.top: parent.top;
        Text {
            id: toptittle;
            text: "交互标注软件";
            anchors.fill: parent;
            anchors.top: parent.top;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.verticalCenter: parent.verticalCenter;
            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment: Text.AlignVCenter;
            width: 1920;
            height: 20;
            font.family: "PingFang SC";
            font.pixelSize: 36;
            color: "#ffffff";

        }

    }
    //界面上部黑背景色
    Image {
        id: topbackground2;
        source: "image/top_@1x.png";
        width: 1920;
        height: 40;
        anchors.top: topbackground.bottom;

    }
    //界面左部黑背景色
    Image {
        id: functionalbackground;
        source: "image/Functional background_@1x.png";
        width: 70;
        height: 949;
        anchors.top: topbackground2.bottom;
        anchors.topMargin: 1;
        anchors.left: parent.left;

    }
    //界面底部黑背景色
    Image {
        id: bottombackground;
        source: "image/bottom_@2x.png";
        width: 1850;
        height: 40;
        anchors.bottom: parent.bottom;
        anchors.left: functionalbackground.right;

    }
    //界面右侧标签列表栏
    Rectangle{
        id: labellist;
        color: "#ffffff"

        width: 430;
        height: 40

        anchors.right:parent.right;
        anchors.top: topbackground2.bottom;
        Image {
            id: labellistimage;
            source: "image/label_@1x.png"
            width: 20;
            height: 20
            anchors.left: parent.left;
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter;
        }
        Text {
            id: labellisttext;
            text: "标签列表";
            anchors.fill: parent;
            anchors.left: parent.left;
            anchors.leftMargin: 40;
            anchors.verticalCenter: parent.verticalCenter;
            verticalAlignment: Text.AlignVCenter;
            width: 430;
            height: 60;
            font.family: "PingFang SC";
            font.pixelSize: 24;
            color: "#333333";

        }
    }
    //界面右侧标签列表栏
    Rectangle{
        id: labellist1;
        color:"#ffffff";

        width: 430;
        height: 237;

        anchors.top:labellist.bottom ;
        anchors.topMargin: 2;
        anchors.right: parent.right;
    }
    //界面右侧多边形标签栏
    Rectangle{
        id: polygonlabel;
        color: "#ffffff"

        width: 430;
        height: 40

        anchors.right:parent.right;
        anchors.top: labellist1.bottom;
        Image {
            id: polygonimage;
            source: "image/Polygon_@1x.png"
            width: 20;
            height: 20
            anchors.left: parent.left;
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter;
        }
        Text {
            id: polygontext;
            text: "多边形标签";
            anchors.fill: parent;
            anchors.left: parent.left;
            anchors.leftMargin: 40;
            anchors.verticalCenter: parent.verticalCenter;
            verticalAlignment: Text.AlignVCenter;
            width: 430;
            height: 60;
            font.family: "PingFang SC";
            font.pixelSize: 24;
            color: "#333333";

        }
    }
    //界面右侧多边形标签栏
    Rectangle{
        id: polygonlabel1;
        color:"#ffffff";

        width: 430;
        height: 237;

        anchors.top:polygonlabel.bottom ;
        anchors.topMargin: 2;
        anchors.right: parent.right;
    }
    //界面右侧文件列表栏
    Rectangle{
        id: filelist;
        color: "#ffffff"

        width: 430;
        height: 40

        anchors.right:parent.right;
        anchors.top: polygonlabel1.bottom;
        Image {
            id: filelistimage;
            source: "image/File menu_@1x.png"
            width: 20;
            height: 20
            anchors.left: parent.left;
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter;
        }
        Text {
            id: filelisttittle;
            text: "文件列表";
            anchors.fill: parent;
            anchors.left: parent.left;
            anchors.leftMargin: 40;
            anchors.verticalCenter: parent.verticalCenter;
            verticalAlignment: Text.AlignVCenter;
            width: 430;
            height: 60;
            font.family: "PingFang SC";
            font.pixelSize: 24;
            color: "#333333";

        }
    }
    //界面右侧文件列表栏
    Rectangle{
        id: filelist1;
        color:"#ffffff";

        width: 430;
        height: 237;

        anchors.top:filelist.bottom ;
        anchors.topMargin: 2;
        anchors.right: parent.right;
        anchors.bottom: bottombackground.top;
        ListUI{
            id:list;
            anchors.fill: parent;
            anchors.top: parent.top;
            imageShowArea: imageShowArea;
            fileList: fileList;
        }

//        Text {
//            id: fileListText
//            anchors.top:parent.top;
//            text:"";
//            anchors.fill: parent
//            width: parent.width;
//            height: parent.width;
//            color: "black";
//            font.family: "PingFang SC"
//            font.pixelSize: 15;
//        }
        //与C++通信的文件列表
        FileList{
            id: fileList;
            anchors.fill: parent
        }
    }
    Column{
        id: functionalButtonList;
        anchors.top: topbackground2.bottom;
        anchors.topMargin: 7;
        anchors.left: parent.left;
        width: 70;
        height: 949;

        spacing: 12;



        ButtonTool{
            id: openFileDir;
            height: 40;
            width: parent.width;
            sNormalImage:"image/Open file_@1x.png";
            sPressedImage: "image/Open file1_@1x.png";
            sHoverImage: "image/Open file1_@1x.png";
            sText: "打开文件夹"
        }

        ButtonTool{
            id: openFile;
            height: 40;
            width: parent.width;
            sNormalImage:"image/Open picture_@1x.png"
            sPressedImage:"image/Open picture1_@1x.png"
            sHoverImage:"image/Open picture1_@1x.png"
            sText:"打开文件"
            onRelease: {
               if(openFile.state === "pressed"){
                   fileDialog.open()
                   console.log("pressed")
               }
               else{
                   imageShowArea.imagecontrol(0)
                   console.log("Nopressed")
               }
            }

        }

        ButtonTool{
            id: importLabel;
            height: 40;
            width: parent.width;
            sNormalImage:"image/Import_@1x.png";
            sPressedImage:"image/Import1_@1x.png";
            sHoverImage:"image/Import1_@1x.png";
            sText: "导入标签库"
        }

        ButtonTool{
            id: exportLabel;
            height: 40;
            width: parent.width;
            sNormalImage:"image/export_@1x.png";
            sPressedImage:"image/export1_@1x.png";
            sHoverImage:"image/export1_@1x.png";
            sText: "导出标签库"
        }

        ButtonTool{
            id: exportFile;
            height: 40;
            width: parent.width;
            sNormalImage:"image/Export image_@1x.png";
            sPressedImage:"image/Export image1_@1x.png";
            sHoverImage:"image/Export image1_@1x.png";
            sText: "导出图片"
        }

        ButtonTool{
            id: save;
            height: 40;
            width: parent.width;
            sNormalImage:"image/save_@1x.png";
            sPressedImage:"image/save1_@1x.png";
            sHoverImage:"image/save1_@1x.png";
            sText: "保存"
        }

        ButtonTool{
            id: createAnchor;
            height: 40;
            width: parent.width;
            sNormalImage:"image/Crop_@1x.png";
            sPressedImage:"image/Crop1_@1x.png";
            sHoverImage:"image/Crop1_@1x.png";
            sText: "创建锚点"
        }

        ButtonTool{
            id: edit;
            height: 40;
            width: parent.width;
            sNormalImage:"image/edit_@1x.png";
            sPressedImage:"image/edit1_@1x.png";
            sHoverImage:"image/edit1_@1x.png";
            sText: "编辑"
        }

        ButtonTool{
            id: previous;
            height: 40;
            width: parent.width;
            sNormalImage:"image/Previous_@1x.png";
            sPressedImage:"image/Previous1_@1x.png";
            sHoverImage:"image/Previous1_@1x.png";
            sText: "上一张"
            onRelease: {
                fileList.fileIndex -= 1;
                if(fileList.fileIndex < 0){
                    fileList.fileIndex = fileList.sizeOffileList - 1;
                }
//                    imageShowArea.imagePath = fileList.fileList[fileList.fil eIndex];
                list.children[fileList.fileIndex].release(fileList.fileIndex);
            }
        }

        ButtonTool{
            id: next;
            height: 40;
            width: parent.width;
            sNormalImage:"image/Next_@1x.png";
            sPressedImage:"image/Next1_@1x.png";
            sHoverImage:"image/Next1_@1x.png";
            sText: "下一张"
            onRelease: {
                fileList.fileIndex += 1;
                if(fileList.fileIndex > fileList.sizeOffileList - 1){
                    fileList.fileIndex = 0
                }
//                imageShowArea.imagePath = fileList.fileList[fileList.fileIndex];
                list.children[fileList.fileIndex].release(fileList.fileIndex);
            }
        }

        ButtonTool{
            id: addAnchor;
            height: 40;
            width: parent.width;
            sNormalImage:"image/Add anchor point_@1x.png";
            sPressedImage:"image/Add anchor point1_@1x.png";
            sHoverImage:"image/Add anchor point1_@1x.png";
            sText: "添加锚点"
        }

        ButtonTool{
            id: deleteAnchor;
            height: 40;
            width: parent.width;
            sNormalImage:"image/Delete anchor point_@1x.png";
            sPressedImage:"image/Delete anchor point1_@1x.png";
            sHoverImage:"image/Delete anchor point1_@1x.png";
            sText: "删除锚点"
        }

        ButtonTool{
            id: automaticAnnotation;
            height: 40;
            width: parent.width;
            sNormalImage:"image/Automatic labeling_@1x.png";
            sPressedImage:"image/Automatic labeling1_@1x.png";
            sHoverImage:"image/Automatic labeling1_@1x.png";
            sText: "自动标注"
        }

        ButtonTool{
            id: revocation;
            height: 40;
            width: parent.width;
            sNormalImage:"image/Cancel_@1x.png";
            sPressedImage:"image/Cancel1_@1x.png";
            sHoverImage:"image/Cancel1_@1x.png";
            sText: "撤销"
        }

        ButtonTool{
            id: zoomIn;
            height: 40;
            width: parent.width;
            sNormalImage:"image/amplification_@1x.png";
            sPressedImage:"image/amplification1_@1x.png";
            sHoverImage:"image/amplification1_@1x.png";
            sText: "放大"
            onRelease: {
                imageShowArea.zoomIn();
            }
        }

        ButtonTool{
            id: zoomOut;
            height: 40;
            width: parent.width;
            sNormalImage:"image/minifier_@1x.png";
            sPressedImage:"image/minifier1_@1x.png";
            sHoverImage:"image/minifier1_@1x.png";
            sText: "缩小"
            onRelease: {
                imageShowArea.zoomOut();
            }
        }

        ButtonTool{
            id: deletePolygon;
            height: 40;
            width: parent.width;
            sNormalImage:"image/delete_@1x.png";
            sPressedImage:"image/delete1_@1x.png";
            sHoverImage:"image/delete1_@1x.png";
            sText: "删除"
        }

    }
    New_Button{
        id: fileButton;
        height: 40;
        width: 50;
        anchors.left: parent.left;
        anchors.top: topbackground.bottom;
        anchors.topMargin: 5;
        anchors.leftMargin: 40;
        anchors.verticalCenter: parent.verticalCenter;
        sText: "文件"
    }

    New_Button{
        id: helpButton;
        height: 40;
        width: 50;
        anchors.left: fileButton.right;
        anchors.top: topbackground.bottom;
        anchors.topMargin: 5;
        anchors.leftMargin: 30;
        anchors.verticalCenter: parent.verticalCenter;
        sText: "帮助"
    }
    //图片显示区域
    ImageShowArea{
        id:imageShowArea;
        width: 1220
        height: 709
//        anchors.centerIn: parent;
        anchors.left: functionalbackground.right;
//        anchors.leftMargin: 100;
        anchors.right: parent.right;
        anchors.rightMargin: 430;
        anchors.top: topbackground2.bottom;
//        anchors.topMargin: 100;
        anchors.bottom: bottombackground.top;
//        anchors.bottomMargin: 100;

    }
    //图片文件选择窗口
    FileDialog {
          id: fileDialog
          title: "Please choose a file"
          folder: shortcuts.home
          nameFilters: ["Photo Files", "Image Files (*.jpg *.png *.gif *.bmp *.ico *.json)", "*.*"]
          selectMultiple: true;
          onAccepted: {
              console.log("You chose: " + fileDialog.fileUrls)
//              var imageFile = new String(fileDialog.fileUrls[0]);
              fileList.string2QVector(fileDialog.fileUrls)
              imageShowArea.imagePath = fileList.fileList[fileList.fileIndex];
              imageShowArea.imagecontrol(1)
              //fileListText.text = fileList.printFileUrls();
              list.destroyListButton();
              for(var i = 0;i < fileList.sizeOffileList; i++){
                  list.createListButton(fileList.fileList[i]);
              }

              fileDialog.close();
          }
          onRejected: {
              console.log("Canceled")
              fileDialog.close();
          }
      }
    MouseArea {

            id:allMouseArea

            //        property bool closeAll: false;

            acceptedButtons: Qt.LeftButton
            hoverEnabled: true
            anchors.fill: parent
            property var window: mainW;

            property int borderWidth: 8
            property int minimumWidth: mainW.minimumWidth
            property int minimumHeight: mainW.minimumHeight
            property int maximumWidth: 0
            property int maximumHeight: 0

            property int resizing: 0
            property real firstWidth: 0
            property real firstHeight: 0
            property real firstMouseX: 0
            property real firstMouseY: 0

            function getValidWidth(width) {
                if (minimumWidth > 0 && width < minimumWidth)
                    return minimumWidth;

                if (maximumWidth > minimumWidth && width > maximumWidth)
                    return maximumWidth;

                return width;
            }

            function getValidHeight(height) {
                if (minimumHeight > 0 && height < minimumHeight)
                    return minimumHeight;

                if (maximumHeight > minimumHeight && height > maximumHeight)
                    return maximumHeight;

                return height;
            }

            function getMousePosition(window, mouseX, mouseY) {
                if (mouseX < borderWidth) {
                    if (mouseY < borderWidth) {
                        return 1; // left top
                    } else if (mouseY < window.height - borderWidth) {
                        return 2; // left
                    } else {
                        return 3; // left bottom
                    }
                } else if (mouseX < window.width - borderWidth) {
                    if (mouseY < borderWidth) {
                        return 4; // top
                    } else if (mouseY < window.height - borderWidth) {
                        return 5; // center
                    } else {
                        return 6; // bottom
                    }
                } else {
                    if (mouseY < borderWidth) {
                        return 7; // right top
                    } else if (mouseY < window.height - borderWidth) {
                        return 8; // right
                    } else {
                        return 9; // right bottom
                    }
                }
            }

            function getCursorShape(window, mouseX, mouseY) {
                switch (getMousePosition(window, mouseX, mouseY)) {
                case 1: return Qt.SizeFDiagCursor;
                case 2: return Qt.SizeHorCursor;
                case 3: return Qt.SizeBDiagCursor;
                case 4: return Qt.SizeVerCursor;
                case 5: return Qt.ArrowCursor;
                case 6: return Qt.SizeVerCursor;
                case 7: return Qt.SizeBDiagCursor;
                case 8: return Qt.SizeHorCursor;
                case 9: return Qt.SizeFDiagCursor;
                default: break;
                }

                return Qt.ArrowCursor;
            }

            function resizeLeftTop(window, mouseX, mouseY) {
                var offsetX = mouseX - firstMouseX;
                var offsetY = mouseY - firstMouseY;

                var x = window.x + offsetX;
                var y = window.y + offsetY;
                var width = window.width - offsetX;
                var height = window.height - offsetY;

                // Lock-in maximum and minimum
                offsetX = width - getValidWidth(width);
                offsetY = height - getValidHeight(height);
                x = x + offsetX;
                width = width - offsetX;
                y = y + offsetY;
                height = height - offsetY;

                window.x = x;
                window.y = y;
                window.width = width;
                window.height = height;
            }

            function resizeLeft(window, mouseX, mouseY) {
                var offsetX = mouseX - firstMouseX;

                var x = window.x + offsetX;
                var width = window.width - offsetX;

                // Lock-in maximum and minimum
                offsetX = width - getValidWidth(width);
                x = x + offsetX;
                width = width - offsetX;

                window.x = x;
                window.width = width;
            }

            function resizeLeftBottom(window, mouseX, mouseY) {
                var offsetX = mouseX - firstMouseX;
                var offsetY = mouseY - firstMouseY;

                var x = window.x + offsetX;
                var width = window.width - offsetX;
                var height = firstHeight + offsetY;

                // Lock-in maximum and minimum
                offsetX = width - getValidWidth(width);
                x = x + offsetX;
                width = width - offsetX;
                height = getValidHeight(height);

                window.x = x;
                window.width = width;
                window.height = height;
            }

            function resizeTop(window, mouseX, mouseY) {
                var offsetY = mouseY - firstMouseY;

                var y = window.y + offsetY;
                var height = window.height - offsetY;

                // Lock-in maximum and minimum
                offsetY = height - getValidHeight(height);
                y = y + offsetY;
                height = height - offsetY;

                window.y = y;
                window.height = height;
            }

            function resizeBottom(window, mouseX, mouseY) {
                var offsetY = mouseY - firstMouseY;

                var height = firstHeight + offsetY;

                // Lock-in maximum and minimum
                height = getValidHeight(height);

                window.height = height;
            }

            function resizeRightTop(window, mouseX, mouseY) {
                var offsetX = mouseX - firstMouseX;
                var offsetY = mouseY - firstMouseY;

                var y = window.y + offsetY;
                var width = firstWidth + offsetX;
                var height = window.height - offsetY;

                // Lock-in maximum and minimum
                offsetY = height - getValidHeight(height);
                y = y + offsetY;
                width = getValidWidth(width);
                height = height - offsetY;

                window.y = y;
                window.width = width;
                window.height = height;
            }

            function resizeRight(window, mouseX, mouseY) {
                var offsetX = mouseX - firstMouseX;

                var width = firstWidth + offsetX;

                // Lock-in maximum and minimum
                width = getValidWidth(width);

                window.width = width;
            }

            function resizeRightBottom(window, mouseX, mouseY) {
                var offsetX = mouseX - firstMouseX;
                var offsetY = mouseY - firstMouseY;
                var width = firstWidth + offsetX;
                var height = firstHeight + offsetY;

                // Lock-in maximum and minimum
                width = getValidWidth(width);
                height = getValidHeight(height);

                window.width = width;
                window.height = height;
            }

            function move(window, mouseX, mouseY) {
                window.x = window.x + (mouseX - firstMouseX);
                window.y = window.y + (mouseY - firstMouseY);
            }

            function resize(window, mouseX, mouseY) {
                switch (resizing) {
                case 1:
                    resizeLeftTop(window, mouseX, mouseY);
                    break;
                case 2:
                    resizeLeft(window, mouseX, mouseY);
                    break;
                case 3:
                    resizeLeftBottom(window, mouseX, mouseY);
                    break;
                case 4:
                    resizeTop(window, mouseX, mouseY);
                    break;
                case 5:
                    //                move(window, mouseX, mouseY);
                    break;
                case 6:
                    resizeBottom(window, mouseX, mouseY);
                    break;
                case 7:
                    resizeRightTop(window, mouseX, mouseY);
                    break;
                case 8:
                    resizeRight(window, mouseX, mouseY);
                    break;
                case 9:
                    resizeRightBottom(window, mouseX, mouseY);
                    break;
                default:
                    break;
                }
            }

            onPositionChanged: {
                if (resizing == 0) {
                    cursorShape = getCursorShape(window, mouse.x, mouse.y);
                } else {
                    resize(window, mouse.x, mouse.y);
                }
            }

            onPressed: {
                resizing = getMousePosition(window, mouseX, mouseY);
                firstWidth = window.width;
                firstHeight = window.height;
                firstMouseX = mouseX;
                firstMouseY = mouseY;
            }

            onReleased: {
                resizing = 0;
            }

            onClicked:
            {
                if(mouseX>500 || mouseY>200)
                {

                    //                closeAll = true;
                    //                console.log("closeAll");


                    //                MyMenuBar.rect_MenuFile.visible = false;
                    //                rect_MenuFile.visible = false;
                    //                rect_MenuEdit.visible = false;
                    //                rect_MenuTool.visible = false;
                    //                rect_MenuHelp.visible = false;
                }

            }

        }

}
