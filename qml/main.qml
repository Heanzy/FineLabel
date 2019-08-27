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
    ScrollView{
        id:scroll;
        anchors.fill:parent;
        MainInterface{
            id: mainInterface;
            width:mainwindow.width;
            height:1080
            visible: true;
        }
    }
}
