import QtQuick 2.0

Rectangle{
    Canvas {
        id: mainCanvas;
        property var currentImg:"image/delete1_@1x.png";
        anchors.fill: parent;
        contextType: "2d"
        onPaint: {
             context.drawImage(currentImg,mainCanvas.width/2-context,0);

        }
        Component.onCompleted:  loadImage(currentImg);
        onImageLoaded: requestPaint();

        MouseArea{

        }
    }
}


