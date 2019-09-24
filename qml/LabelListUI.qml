import QtQuick 2.0
import he.qt.FileList 1.0
import QtQuick.Controls 1.2
Rectangle{
    id: fucklist;
    color:"transparent";
    property var count:[];
    property Component component:null;
    property ImageShowArea imageShowArea:null;
    property FileList fileList:null;
    property var buttonList:[];
    property var isButtonHide:[];

    property var selectedlabel;

    function init(){
        for(var i = 0 ;i < fileList.sizeOffileList ; i++){
            buttonList[i] = [];
            isButtonHide[i] = [];
            count[i] = 0;
        }
    }

    function hideButton1(nIndex){
        console.log("隐藏标签列表")
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
            console.log(imageShowArea.copytemporary[fileList.fileIndex][nIndex])
            imageShowArea.temporary[fileList.fileIndex][nIndex] = imageShowArea.copytemporary[fileList.fileIndex][nIndex];
            console.log("显示标签列表")
            for(var j =0;j < imageShowArea.buttonList[fileList.fileIndex][nIndex].length;j++){
                imageShowArea.buttonList[fileList.fileIndex][nIndex][j].visible = true;
            }
            imageShowArea.rePaint();
        }
    }
    function createListButton(sText){
        if(fucklist.component == null){
            fucklist.component = Qt.createComponent("New_Button_polygonlabel.qml");
        }
        var newButton;
        if(fucklist.component.status == Component.Ready){
            console.log("开始创建按钮对象");
            newButton = fucklist.component.createObject(fucklist,{"textColor":"black","fontsize":16,"x":0,"y":fucklist.count[fileList.fileIndex]*16,"sText":sText,"width":430,"height":16,"nIndex":fucklist.count[fileList.fileIndex]});
            newButton.release.connect(fucklist.hideButton1);
            newButton.release.connect(fucklist.selectedLabel);
        }
        buttonList[fileList.fileIndex].push(newButton);
        fucklist.count[fileList.fileIndex]++;
    }
    function destroyListButton(){
        if(fucklist.component !=null){
            for(var i = 0 ;i < buttonList.length ; ++i){
                count[i] = 0;
                for(var j = 0;j < buttonList[i].length; ++i){
                    buttonList[i][j].destroy();
                }
            }
            fucklist.component = null;
        }
    }
    function selectedLabel(nIndex){
        imageShowArea.selectedLabel = nIndex;
        selectedlabel = nIndex;
    }
    function deleteLabelButton(){
        buttonList[fileList.fileIndex][selectedlabel].destroy();
    }
}
