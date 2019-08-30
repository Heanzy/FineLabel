import QtQuick 2.0
import he.qt.FileList 1.0
import QtQuick.Controls 1.2
Rectangle{
    id: list;
    color:"transparent";
    property var count:0;
    property Component component:null;
    property ImageShowArea imageShowArea:null;
    property FileList fileList:null;
    function buttonControl(nIndex){
        for(var i = 0; i < list.count;i++){
            list.children[i].state = "normal";
            if(i === nIndex)
            {
                console.log("选定的是",nIndex);
                list.children[i].state = "pressed";
                console.log(list.children[i].state);
            }
            console.log("第",i,"个的状态：",list.children[i].state)
        }

    }
    function hideButton(nIndex){
        for(var i =0 ; i < fileList.sizeOffileList; i++){
            for(var j =0;j < imageShowArea.polygonCount[i];j++){
                if(imageShowArea.buttonList[i][j].length){
                        for(var k in imageShowArea.buttonList[i][j]){
                            if(i == nIndex){
                                console.log("显示按钮")
                                imageShowArea.buttonList[i][j][k].visible = true;
                            }
                            else{
                                imageShowArea.buttonList[i][j][k].visible = false;
                            }
                        }
                }
            }
        }
    }

    function imageChange(nIndex){
        imageShowArea.imagePath = fileList.fileList[nIndex];
        fileList.fileIndex = nIndex;
    }

    function createListButton(sText,imagePath){
        if(list.component == null){
            list.component = Qt.createComponent("New_button1.qml");
        }
        var newButton;
        if(list.component.status == Component.Ready){
            console.log("开始创建按钮对象");
            newButton = list.component.createObject(list,{"textColor":"black","fontsize":16,"x":0,"y":list.count*16,"sText":sText,"width":430,"height":16,"nIndex":list.count});
            newButton.release.connect(list.buttonControl);
            newButton.release.connect(list.imageChange);
            newButton.release.connect(list.hideButton);
        }
        list.count++;
    }
     function createNListButton(n){
         for( i = 0;i < n;i++){
             createListButton();
         }
     }
    function destroyListButton(){
        if(list.component !=null){
            for(var i = 0 ;i < list.count ; ++i){
                list.children[i].destroy();
            }
            list.count = 0;
            list.component = null;
        }
    }



}
