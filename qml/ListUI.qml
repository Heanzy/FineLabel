import QtQuick 2.0
import he.qt.FileList 1.0
import QtQuick.Controls 1.2
Rectangle{
    id: list;
    color:"transparent";
    property var count:0;
    property Component component:null;
    function createListButton(sText){
        if(list.component == null){
            list.component = Qt.createComponent("New_Button.qml");
        }
        var newButton;
        if(list.component.status == Component.Ready){
            console.log("开始创建按钮对象");
            newButton = list.component.createObject(list,{"textColor":"black","fontsize":16,"x":0,"y":list.count*16,"sText":sText,"width":430,"height":16});
        }
        list.count++;
    }
     function createNListButton(n){
         for( i = 0;i < n;i++){
             createListButton();
         }


     }



}
