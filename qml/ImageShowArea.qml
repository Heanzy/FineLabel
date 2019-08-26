import QtQuick 2.0
import he.qt.ImageItem 1.0
Rectangle{
        id: mapItemArea
        clip: true

        /*************************************************/

        property var nIndex: 0;
        property var imagePath: "";
//        property var canvasLastX;
//        property var canvasLastY;
//        property var currentX;
//        property var currentY;
        property ImageItem imageItem;
        property var temporary:[];
        function imagecontrol(nIndex){
            if(nIndex == 1){
                mainCanvas.visible = true;
                console.log("图片已显示")
            }
            else {
                mainCanvas.visible = false;
                console.log("图片未显示");
            }
        }
        function zoomIn(){
            mainCanvas.scale = mainCanvas.scale/0.9;
        }
        function zoomOut(){
            mainCanvas.scale = mainCanvas.scale*0.9;
        }

        Image {
            id: mapImg

            visible: false
            source: "image://colors/"+imagePath
            //asynchronous: true
        }
        Canvas {
            id: mainCanvas;
            width: mapImg.width;
            height: mapImg.height;
            //这里使画布居中显示
            x: mapItemArea.width/2-mapImg.width/2
            y: mapItemArea.height/2-mapImg.height/2
            visible: false;
            contextType: "2d"
            signal new_paint();
            onPaint: {
                context.drawImage(mapImg,0,0);
                context.lineWidth = 2;
                context.strokeStyle = "red";
                context.beginPath();
                for(var i = 0; i<temporary.length -1;i++){
                    context.moveTo(temporary[i][0],temporary[i][1]);
                    context.lineTo(temporary[i+1][0],temporary[i+1][1]);
                }

                context.stroke();
            }

            Component.onCompleted:  loadImage(mapImg);
            onImageLoaded: requestPaint();
        }
        MouseArea {
            id: mapDragArea
            anchors.fill: mainCanvas
            drag.target: mainCanvas
            //这里使图片不管是比显示框大还是比显示框小都不会被拖拽出显示区域
//            drag.minimumX: (mapImg.width > mapItemArea.width) ? (mapItemArea.width - mapImg.width) : 0
//            drag.minimumY: (mapImg.height > mapItemArea.height) ? (mapItemArea.height - mapImg.height) : 0
//            drag.maximumX: (mapImg.width > mapItemArea.width) ? 0 : (mapItemArea.width - mapImg.width)
//            drag.maximumY: (mapImg.height > mapItemArea.height) ? 0 : (mapItemArea.height - mapImg.height)

            //使用鼠标滚轮缩放
            onWheel: {
                //每次滚动都是120的倍数
                var datla = wheel.angleDelta.y/120;
                if(datla > 0)
                {
                    mainCanvas.scale = mainCanvas.scale/0.9
                }
                else
                {
                    mainCanvas.scale = mainCanvas.scale*0.9
                }
            }
            onPressed: {
                temporary.push([mapDragArea.mouseX,mapDragArea.mouseY]);
                mainCanvas.requestPaint();
            }
//            onPositionChanged: {
//                mainCanvas.requestPaint()//当鼠标press位置改变  完成当前绘制
//            }
        }
    }
