import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 1.0
import he.qt.FileList 1.0
Window{
    id:labelWindow;
    property var label1:[]
    property var fileIndex;
    property var index:-1;
    LabelInterface{
        id:labelInterface;
        anchors.fill: parent
        width: 450;
        height: 618;        
    }
}
