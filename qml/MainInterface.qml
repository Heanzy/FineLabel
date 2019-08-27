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

        width: 1920;
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
        fileList: fileList;
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
//    New_Cnavas {
//        id:mainCanvas;
//        visible: true
//        width: 1220
//        height: 709

//        //        anchors.centerIn: parent;
//        anchors.left: functionalbackground.right;
//        //        anchors.leftMargin: 100;
//        anchors.right: parent.right;
//        anchors.rightMargin: 430;
//        anchors.top: topbackground2.bottom;
//        //        anchors.topMargin: 100;
//        anchors.bottom: bottombackground.top;
//        //        anchors.bottomMargin: 100;

//    }
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
              imageShowArea.initTemporary();
              fileDialog.close();
          }
          onRejected: {
              console.log("Canceled")
              fileDialog.close();
          }
      }

}
