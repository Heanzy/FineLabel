import QtQuick 2.0
import he.qt.ImageItem 1.0
import he.qt.FileList 1.0
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
        property var positionX;//鼠标x位置
        property var positionY;//鼠标y位置
        property var lastX;//最后一个按钮x位置
        property var lastY;//最后一个按钮y位置
        property ImageItem imageItem;
        property var temporary:[];
        property FileList fileList;//三维数组，第一位文件下标
        property var polygonCount:1;
        property var buttonList:[];
        property Component component:null;
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
        function initTemporary(){
            for(var i =0 ; i < fileList.sizeOffileList; i++){
                temporary[i] = [];
                buttonList[i] = []
                for(var j =0;j < 20;j++){
                    temporary[i][j]=[];
                    buttonList[i][j]=[];
                }
            }
        }
        function createListButton(x,y){
            if(mapItemArea.component == null){
                mapItemArea.component = Qt.createComponent("New_Button2.qml");
            }
            var newButton;
            if(mapItemArea.component.status == Component.Ready){
                console.log("开始创建按钮对象for imageshowarea");
                newButton = mapItemArea.component.createObject(mapItemArea,{"x":x,"y":y,"width":4,"height":4});
                buttonList[fileList.fileIndex][polygonCount-1].push(newButton);
            }
        }
        Image {
            id: mapImg

            visible: false
            source: "image://colors/"+imagePath
            //asynchronous: true
        }
        Image{
            id:buttonLabel

            visible: false
            source: "image/label_button@2x.png"
        }

        Canvas {
            id: mainCanvas;
            width: mapImg.width;
            height: mapImg.height;
            //这里使画布居中显示
            x: mapItemArea.width/2-mainCanvas.width/2
            y: mapItemArea.height/2-mainCanvas.height/2
            visible: false;
            contextType: "2d"
            focus: true;
            Keys.enabled: true;
            Keys.onEscapePressed: {
                temporary[fileList.fileIndex]=[];
                console.log("temporary",temporary[fileList.fileIndex]);
                mainCanvas.requestPaint();
            }

            onPaint: {
                context.drawImage(mapImg,0,0,mapImg.width,mapImg.height);
                context.lineWidth = 1;
                context.strokeStyle = "green";
                context.beginPath();
                for(var j = 0;j <polygonCount;j++){
                    for(var i = 0; i<temporary[fileList.fileIndex][j].length;i++){
//                        context.drawImage(buttonLabel,temporary[fileList.fileIndex][j][i][0],temporary[fileList.fileIndex][j][i][1]);
 //                       console.log(temporary[fileList.fileIndex][j][i][0]);
//                        context.arc(temporary[fileList.fileIndex][j][i][0],temporary[fileList.fileIndex][j][i][1],1,0,Math.PI*2);
                        context.moveTo(temporary[fileList.fileIndex][j][i][0],temporary[fileList.fileIndex][j][i][1]);
                        if(i + 1 < temporary[fileList.fileIndex][j].length){
                            context.lineTo(temporary[fileList.fileIndex][j][i+1][0],temporary[fileList.fileIndex][j][i+1][1]);
                        }
                    }
                }
                console.log(temporary[fileList.fileIndex][polygonCount-1]);
 //               context.fill();
//                var lastOne = [temporary[fileList.fileIndex][polygonCount-1][temporary[fileList.fileIndex].length -1][0],temporary[fileList.fileIndex][polygonCount-1][temporary[fileList.fileIndex].length -1][1]];
                var firstOne = [temporary[fileList.fileIndex][polygonCount-1][0][0],temporary[fileList.fileIndex][polygonCount-1][0][1]];
                if((Math.sqrt(Math.pow(lastX-firstOne[0],2)+Math.pow(lastY-firstOne[1],2)) < 2) && temporary[fileList.fileIndex][polygonCount-1].length >1){
                    console.log("动态1")
                    context.closePath();
                    polygonCount = polygonCount +1;
                }
                else{
//                    console.log("动态2");
                    context.moveTo(lastX,lastY)
                    context.lineTo(positionX,positionY);
                }

                context.stroke();
            }

            Component.onCompleted:{
                loadImage(mapImg);
                loadImage(buttonLabel);
            }
            onImageLoaded: requestPaint();
            MouseArea {
                id: mapDragArea
                anchors.fill: parent;
                drag.target: mainCanvas
                hoverEnabled:true;
//                //这里使图片不管是比显示框大还是比显示框小都不会被拖拽出显示区域
//                drag.minimumX: (mapImg.width > mapItemArea.width) ? (mapItemArea.width - mapImg.width) : 0
//                drag.minimumY: (mapImg.height > mapItemArea.height) ? (mapItemArea.height - mapImg.height) : 0
//                drag.maximumX: (mapImg.width > mapItemArea.width) ? 0 : (mapItemArea.width - mapImg.width)
//                drag.maximumY: (mapImg.height > mapItemArea.height) ? 0 : (mapItemArea.height - mapImg.height)

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
                    lastX = mapDragArea.mouseX;
                    lastY = mapDragArea.mouseY;
                    console.log("polygonCount",polygonCount);
                    temporary[fileList.fileIndex][polygonCount-1].push([lastX,lastY]);
                    createListButton(lastX,lastY);
                    mainCanvas.requestPaint();
                }
                onPositionChanged: {
                    positionX = mapDragArea.mouseX;
                    positionY = mapDragArea.mouseY;
//                    console.log("当前坐标",mouseX,mouseY)
                    if(temporary[fileList.fileIndex][polygonCount-1].length){
                        mainCanvas.requestPaint()
                    }


                }
                onEntered: {
                    positionX = mapDragArea.mouseX;
                    positionY = mapDragArea.mouseY;
                    if(temporary[fileList.fileIndex][polygonCount-1].length){
                        mainCanvas.requestPaint()
                    }
                }
            }
        }

    }
