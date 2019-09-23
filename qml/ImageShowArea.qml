import QtQuick 2.0
import he.qt.ImageItem 1.0
import he.qt.FileList 1.0
Rectangle{
        id: mapItemArea
        clip: true

        /*************************************************/

        property var nIndex: 0;
        property var imagePath:[];
//        property var canvaslastX[fileList.fileIndex];
//        property var canvaslastY[fileList.fileIndex];
//        property var currentX;
//        property var currentY;
        property var positionX;//鼠标x位置
        property var positionY;//鼠标y位置
//        property var lastX[fileList.fileIndex];//最后一个按钮x位置
//        property var lastY[fileList.fileIndex];//最后一个按钮y位置
        property ImageItem imageItem;
        property var temporary:[];
        property FileList fileList;//三维数组，第一位文件下标
        property var polygonCount:[];
        property var buttonList:[];
        property var isPathClosed:[];
        property var isDynamicline:[]
        property var lastX: [];
        property var lastY: [];
        property var label:[];
        property var image:[];
        property var isOpted:[];
        property var currentClipCount:[];
        property var labelSpace:[]
        property var labelString;
        property var copytemporary:[]
        property var copyllabel:[]        
        property Component component:null;
        function copy(){
            copytemporary = temporary.slice();
            console.log(copytemporary[fileList.fileIndex][0])
 //           copyllabel = label.slice();
        }
        function rePaint(){
            mainCanvas.requestPaint();
        }

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
                copytemporary[i] = []
                buttonList[i] = [];
                polygonCount[i] = 1;
                isPathClosed[i] = [];
                isOpted[i] = false;
                currentClipCount[i] = 0;
//                imageItem.poytgons[i].append({});
                label[i] = [];
                lastX = [];
                lastY = [];
                for(var j =0;j < 20;j++){
                    temporary[i][j]=[];
                    copytemporary[i][j]=[];
                    buttonList[i][j]=[];
                    isPathClosed[i][j] = false;
                    label[i][j] =[];
//                    imageItem.poytgons[i][j].append({});
                }
                if(fileList.fileList[i].indexOf(".json") != -1){
                    parseJson(imageItem.output1(fileList.fileList[i]),i)
                }
                else{
                    imagePath[i] =fileList.fileList[i];
                    console.log(imagePath[i]);
                }
            }
        }
        function destroyTemporary(){
            for(var i =0 ; i < fileList.sizeOffileList; i++){
                for(var j =0;j < polygonCount[i];j++){
                    if(buttonList[i][j].length){
                        for(var k in buttonList[i][j]){
                            console.log("销毁按钮")
                            buttonList[i][j][k].destroy();
                        }
                    }
                }
            }

        }

        function createListButton(x,y,index){
            if(mainCanvas.component == null){
                mainCanvas.component = Qt.createComponent("New_Button2.qml");
            }
            var newButton;
            if(mainCanvas.component.status == Component.Ready){
                console.log("开始创建按钮对象for imageshowarea");
                newButton = mainCanvas.component.createObject(mainCanvas,{"x":x-1,"y":y-1,"width":2,"height":2,"nIndex":polygonCount[index]-1});
                buttonList[index][polygonCount[index]-1].push(newButton);
                if(buttonList[index][polygonCount[index]-1].length == 1){
                    buttonList[index][polygonCount[index]-1][0].release.connect(closePath);
                }
            }
        }
        function closePath(nIndex){
            isPathClosed[fileList.fileIndex][nIndex] = true;
            labelWindow.visible = true;
            labelWindow.index = nIndex
        }

        function saveData(fileUrl){
            for(var i = 0;i<polygonCount[fileList.fileIndex]-1;i++){
                var polygon = new Object();
                polygon.label = label[fileList.fileIndex][i]
                polygon.points = copytemporary[fileList.fileIndex][i]
                image.push(polygon)
            }
            var imageTemp = new Object();
            imageTemp.picture =fileList.fileList[fileList.fileIndex];
            image.push(imageTemp);
            console.log(JSON.stringify(image,null,4));
            imageItem.output(JSON.stringify(image,null,4),fileUrl);
//            imageItem.setimagetest(fileList.fileList[fileList.fileIndex]);
        }
        function createAnchor(){
            isOpted[fileList.fileIndex] = true;
        }
        function outputImage(){
//            currentClipCount[fileList.fileIndex] = 0;
//            console.log(polygonCount[fileList.fileIndex]);
//            for(var i= 0 ;i<polygonCount[fileList.fileIndex] - 1;i++){
//                console.log("cur",currentClipCount[fileList.fileIndex]);

//            }
            clipCanvas.requestPaint();
        }
        function parseJson(jsonData,index){
            var jsonObject = JSON.parse(jsonData);
            for(var i = 0;i < jsonObject.length -1; i++){
                var object = jsonObject[i];
                label[index][i] = object.label;
                temporary[index][i] = object.points;
                copytemporary[index][i] = object.points;
                for(var j = 0;j < temporary[index][i].length; j++){
                    createListButton(temporary[index][i][j][0],temporary[index][i][j][1],index);
                }
                polygonCount[index]++;
                isPathClosed[index][i] = true;
                console.log(object.label);
            }
            imagePath[index] = jsonObject[jsonObject.length -1].picture;
            console.log("imagePath",imagePath[index])
        }

        function printLabel(){
            var labelStringtemp = "";
            for(var i = 0;i < label.length;i++){
                for(var j = 0;j < polygonCount[i];j++){
                    labelStringtemp = labelStringtemp + label[i][j] + "\n";
                }
            }
            console.log("labelString:",labelStringtemp)
            labelString = labelStringtemp
        }
        LabelWindow{
            id:labelWindow;
            width:450;
            height:618;
            visible:false;
            label1: label;
            fileIndex:fileList.fileIndex;
        }

        Image {
            id: mapImg

            visible: false
            source: "image://colors/"+imagePath[fileList.fileIndex]
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
            property Component component:null;
            Keys.onEscapePressed: {
                temporary[fileList.fileIndex][polygonCount[fileList.fileIndex]-1] = [];
                copytemporary[fileList.fileIndex][polygonCount[fileList.fileIndex]-1] = [];
                for (var i in buttonList[fileList.fileIndex][polygonCount[fileList.fileIndex]-1]){
                    buttonList[fileList.fileIndex][polygonCount[fileList.fileIndex]-1][i].destroy();
                }
                buttonList[fileList.fileIndex][polygonCount[fileList.fileIndex]-1]= [];
                lastX[fileList.fileIndex] = null;
                lastY[fileList.fileIndex] = null;
          //      console.log("temporary",temporary[fileList.fileIndex]);
                mainCanvas.requestPaint();

            }

            onPaint: {
                context.drawImage(mapImg,0,0,mapImg.width,mapImg.height);
                context.lineWidth = 1;
                context.strokeStyle = "green";
                context.beginPath();
                for(var j = 0;j <polygonCount[fileList.fileIndex];j++){
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
                if(isPathClosed[fileList.fileIndex][polygonCount[fileList.fileIndex]-1] == true){
//                    console.log("fileList.fileIndex",fileList.fileIndex)
//                    console.log("动态1")
                    context.moveTo(lastX[fileList.fileIndex],lastY[fileList.fileIndex])
                    context.lineTo(temporary[fileList.fileIndex][polygonCount[fileList.fileIndex]-1][0][0],temporary[fileList.fileIndex][polygonCount[fileList.fileIndex]-1][0][1]);
                    temporary[fileList.fileIndex][polygonCount[fileList.fileIndex]-1].push([temporary[fileList.fileIndex][polygonCount[fileList.fileIndex]-1][0][0],temporary[fileList.fileIndex][polygonCount[fileList.fileIndex]-1][0][1]]);
                    context.closePath();
                    polygonCount[fileList.fileIndex] = polygonCount[fileList.fileIndex] +1;
                    lastX[fileList.fileIndex] = null
                    lastY[fileList.fileIndex] = null
                }
                else if(lastX[fileList.fileIndex] && lastY[fileList.fileIndex]){
//                    console.log("动态2");
                    context.moveTo(lastX[fileList.fileIndex],lastY[fileList.fileIndex])
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
                    if(isOpted[fileList.fileIndex] == true){
                        lastX[fileList.fileIndex] = mapDragArea.mouseX;
                        lastY[fileList.fileIndex] = mapDragArea.mouseY;
    //                    console.log("polygonCount[fileList.fileIndex]",polygonCount[fileList.fileIndex]);
                        temporary[fileList.fileIndex][polygonCount[fileList.fileIndex]-1].push([lastX[fileList.fileIndex],lastY[fileList.fileIndex]]);
                        copytemporary[fileList.fileIndex][polygonCount[fileList.fileIndex]-1].push([lastX[fileList.fileIndex],lastY[fileList.fileIndex]]);
                        createListButton(lastX[fileList.fileIndex],lastY[fileList.fileIndex],fileList.fileIndex);
                        mainCanvas.requestPaint();
                    }
                }
                onPositionChanged: {
                    positionX = mapDragArea.mouseX;
                    positionY = mapDragArea.mouseY;
                    //console.log("当前坐标",mouseX,mouseY)
                    if(copytemporary[fileList.fileIndex][polygonCount[fileList.fileIndex]-1].length){
                        mainCanvas.requestPaint()
                    }


                }
                onEntered: {
                    positionX = mapDragArea.mouseX;
                    positionY = mapDragArea.mouseY;
   //                 if(temporary[fileList.fileIndex][polygonCount[fileList.fileIndex]-1].length){
                        mainCanvas.requestPaint()
 //                   }
                }
            }
        }
        Canvas{
            id:clipCanvas
            width: mapImg.width;
            height: mapImg.height;
            //这里使画布居中显示
            x: 0;
            y: 0;
            visible: true;
            contextType: "2d"
            focus: true;
            onPaint: {
                context.save();
                context.lineWidth = 1;
                context.strokeStyle = "transparent";
                context.beginPath();
                context.clearRect(0,0,width,height);
                console.log("裁切",currentClipCount[fileList.fileIndex]);
            //    console.log(temporary[fileList.fileIndex][currentClipCount[fileList.fileIndex]].length);
                context.moveTo(copytemporary[fileList.fileIndex][currentClipCount[fileList.fileIndex]][0][0],copytemporary[fileList.fileIndex][currentClipCount[fileList.fileIndex]][0][1]);
                for(var i = 1;i <copytemporary[fileList.fileIndex][currentClipCount[fileList.fileIndex]].length;i++){
                        context.lineTo(copytemporary[fileList.fileIndex][currentClipCount[fileList.fileIndex]][i][0],copytemporary[fileList.fileIndex][currentClipCount[fileList.fileIndex]][i][1]);
                }
                context.closePath();
                context.clip();
                context.drawImage(mapImg,0,0,mapImg.width,mapImg.height);
                context.stroke();
                var nameList = fileList.fileList[fileList.fileIndex].split("/");
                var name = nameList[nameList.length-1]
                console.log(name);
                var finalName = name.slice(0,-4);
                var dir = fileList.fileList[fileList.fileIndex].slice(0,-name.length)
                console.log(dir+finalName+currentClipCount[fileList.fileIndex]+".png");
                save(dir+finalName+currentClipCount[fileList.fileIndex]+".png");
                currentClipCount[fileList.fileIndex] = currentClipCount[fileList.fileIndex] + 1;
                context.restore()
            }

            Component.onCompleted:{
                loadImage(mapImg);
                loadImage(buttonLabel);
            }
            onImageLoaded: requestPaint();
        }

    }
