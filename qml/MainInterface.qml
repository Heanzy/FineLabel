import QtQuick 2.0

Rectangle {
    id: mainInterface;
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
            font.family: "宋体";
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
}
