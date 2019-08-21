#include "filelist.h"
#include "string"
#include <string>
FileList::FileList()
{
}

FileList::~FileList()
{

}
QStringList FileList::getfileList(){
    return fileList;
}
void FileList::setfileList(const QStringList &n_fileList){
    fileList = n_fileList;
    emit fileListChanged(fileList);
}

/****
QString file:///C:/Users/sjxy/Pictures/xianhe.png,file:///C:/Users/sjxy/Pictures/搜狗截图20190625170346.png
**/
void FileList::string2QVector(const QString &fileUrls){
    QStringList  fileUrl = fileUrls.split(",");
    for(int i =0;i< fileUrl.size();++i){
        QString temp = fileUrl[i];
        fileUrl[i] = temp.mid(8);
    }
    setfileList(fileUrl);
    qDebug()<<"fileUrl"<<fileUrl;
}
QString FileList::printFileUrls(){
    qDebug()<<"进入printFileUrls"<<endl;
    QString printedFileUrls = "";
    for(int i =0 ;i < fileList.size();++i){
        printedFileUrls += fileList[i] + "\n";
    }
    qDebug() <<"printedFileUrls"<<printedFileUrls;
    return printedFileUrls;
}
