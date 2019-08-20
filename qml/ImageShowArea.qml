import QtQuick 2.0

Rectangle{
        id: mapItemArea
        clip: true

        /*************************************************/

        property var nIndex: 0;
        property var imagePath: ""

        function imagecontrol(nIndex){
            if(nIndex == 1){
                mapImg.visible = true;
                console.log("图片已显示")
            }
            else {
                mapImg.visible = false;
                console.log("图片未显示")
            }
        }

        Image {
            id: mapImg
            //这里使图片居中显示
            visible: false
            x: mapItemArea.width/2-mapImg.width/2
            y: mapItemArea.height/2-mapImg.height/2
            source: "image://colors/"+imagePath
            //asynchronous: true
        }
        MouseArea {
            id: mapDragArea
            anchors.fill: mapImg
            drag.target: mapImg
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
                    mapImg.scale = mapImg.scale/0.9
                }
                else
                {
                    mapImg.scale = mapImg.scale*0.9
                }
            }
        }
    }
