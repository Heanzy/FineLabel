import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 1.0
Window{
    id: mainwindow
    visible: true
    width: 1920;
    height: 1080;
//    property int originwidth: 1920
//    property int originheight: 1080
    title: qsTr("交互标注软件");
//    ScrollView{
//        id:scroll;
//        anchors.fill:parent;
//        MainInterface{
//            id: mainInterface;
//            Keys.enabled: true;
//            focus: true;
//            width:mainwindow.width;
//            height:1080
//            visible: true;
//        }
//    }
    MainInterface{
                id: mainInterface;
                anchors.fill: parent
//                width:mainwindow.width;
//                height:1080
//                visible: true;
            }
//    ScrollView{
//        id:scroll;
////        width: 1920;
////        height: 1080;
//        anchors.fill: parent
//        MainInterface{
//            id: mainInterface;
//            width:mainwindow.width-15;  //-15是因为主窗口宽度大于scrollview宽度导致出现横向滚动条，原因暂时不明----任文超
//            height:1080;
//            visible: true;
//            }

////    MainInterface{
////        id: mainInterface;
////        anchors.fill: parent;

////        visible: true;
////    }
//    }


}

