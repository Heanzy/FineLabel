import QtQuick 2.0

Rectangle {
    id: mainInterface;
    color: "#EAEAEA"
    Image {
        id: topbackground;
        source: "image/Top background_@2x.png";

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

    Image {
        id: topbackground2;
        source: "image/top_@1x.png";
        width: 1920;
        height: 40;
        anchors.top: topbackground.bottom;

    }
    Image {
        id: functionalbackground;
        source: "image/Functional background_@1x.png";
        width: 70;
        height: 949;
        anchors.top: topbackground2.bottom;
        anchors.left: parent.left;

    }
    Image {
        id: bottombackground;
        source: "image/bottom_@2x.png";
        width: 1850;
        height: 40;
        anchors.bottom: parent.bottom;
        anchors.left: functionalbackground.right;

    }
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
    Rectangle{
        id: labellist1;
        color:"#ffffff";

        width: 430;
        height: 237;

        anchors.top:labellist.bottom ;
        anchors.topMargin: 2;
        anchors.right: parent.right;
    }
    Rectangle{
        id: polygonlabel;
        color: "#ffffff"

        width: 430;
        height: 40

        anchors.right:parent.right;
        anchors.top: labellist1.bottom;
        Image {
            id: polygonimage;
            source: "image/组 68.png"
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
    Rectangle{
        id: polygonlabel1;
        color:"#ffffff";

        width: 430;
        height: 237;

        anchors.top:polygonlabel.bottom ;
        anchors.topMargin: 2;
        anchors.right: parent.right;
    }
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
            id: filelisttext;
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
    Rectangle{
        id: filelist1;
        color:"#ffffff";

        width: 430;
        height: 237;

        anchors.top:filelist.bottom ;
        anchors.topMargin: 2;
        anchors.right: parent.right;
        anchors.bottom: bottombackground.top;
    }
}
