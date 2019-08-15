import QtQuick 2.10
import QtQuick.Window 2.10

Window{
    id: mainwindow
    visible: true
    width: Screen.desktopAvailableWidth;
    height: Screen.desktopAvailableHeight;
    title: qsTr("交互标注软件");

    MainInterface{
        id: mainInterface;
        anchors.fill: parent;

        visible: ture;
    }
}
