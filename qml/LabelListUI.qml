import QtQuick 2.0
import he.qt.FileList 1.0
import QtQuick.Controls 1.2
Rectangle{
    id: labellist;
    color:"transparent";
    property var count:[];
    property Component component:null;
    property ImageShowArea imageShowArea:null;
    property FileList fileList:null;
    property var buttonList:[];
    property var isButtonHide:[]
    function init(){
        for(var i = 0 ;i < fileList.sizeOffileList ; i++){
            buttonList[i] = [];
            isButtonHide[i] = false;
            count[i] = 0
        }
    }

    function hideButton1(nIndex){
        if(isButtonHide[fileList.fileIndex][nIndex] == false){
            isButtonHide[fileList.fileIndex][nIndex] = true;
            imageShowArea.temporary[fileList.fileIndex][nIndex] = []
            for(var i =0;i < imageShowArea.buttonList[fileList.fileIndex][nIndex].length;i++){
                imageShowArea.buttonList[fileList.fileIndex][nIndex][i].visible = false
            }
            imageShowArea.rePaint();
        }
        else{
            isButtonHide[fileList.fileIndex][nIndex] = false;
            imageShowArea.temporary[fileList.fileIndex][nIndex] = imageShowArea.copytemporary[nIndex];
            for(var j =0;j < imageShowArea.buttonList[fileList.fileIndex][nIndex].length;i++){
                imageShowArea.buttonList[fileList.fileIndex][nIndex][j].visible = true;
            }
            imageShowArea.rePaint();
        }
    }
    function createListButton(sText){
        if(labellist.component == null){
            labellist.component = Qt.createComponent("Nwq_Button4.qml");
        }
        var newButton;
        if(labellist.component.status == Component.Ready){
            console.log("开始创建按钮对象");
            newButton = labellist.component.createObject(labellist,{"textColor":"black","fontsize":16,"x":0,"y":labellist.count[fileList.fileIndex]*16,"sText":sText,"width":430,"height":16,"nIndex":labellist.count[fileList.fileIndex]});
            newButton.release.connect(labellist.hideButton1);
        }
        buttonList[fileList.fileIndex].push(newButton);
        labellist.count[fileList.fileIndex]++;
    }
    function destroyListButton(){
        if(labellist.component !=null){
            for(var i = 0 ;i < buttonList.length ; ++i){
                count[i] = 0;
                for(var j = 0;j < buttonList[i].length; ++i){
                    buttonList[i][j].destroy();
                }
            }
            labellist.component = null;
        }
    }

}
