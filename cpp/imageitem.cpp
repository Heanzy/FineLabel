#include "imageitem.h"
#include <QDir>
#include "filelist.h"
ImageItem::ImageItem()
{

}
ImageItem::~ImageItem(){

}

QImage ImageItem::getimage(){
    return image;
}
QMap<int,QStringList> ImageItem::getlabels(){
    return labels;
}
QList<QList<QList<int>>> ImageItem::getpoytgons(){
    return poytgons;
}
void ImageItem::setimagetest(const QString &fileUrl){
    QFile file(fileUrl);
    if(!file.open(QIODevice::ReadWrite)) {
        qDebug() << "File open error";
    } else {
        qDebug() <<"image File open !";
    }
    QByteArray t = file.readAll();
    file.close();
    QFile filew("C:/Users/sjxy/123.png");
    if(!filew.open(QIODevice::ReadWrite)) {
        qDebug() << "wFile open error";
    } else {
        qDebug() <<"wimage File open !";
    }
    filew.write(t);
    filew.close();
}

void ImageItem::setimage(const QImage &image){
    this->image = image;
}

void ImageItem::setpoytgons(const QList<QList<QList<int> > > &poytgons){
    this->poytgons = poytgons;
}
void ImageItem::setlabels(const QMap<int, QStringList> labels){
    this->labels = labels;
}
void ImageItem::output(const QString &jsonData,const QString &fileUrl,const QString &fileUrl1){
    QFile file(fileUrl.mid(8));
        if(!file.open(QIODevice::ReadWrite)) {
            qDebug() << "File open error";
        } else {
            qDebug() <<"File open!";
        }
     file.write(jsonData.toUtf8());
     qDebug() << "Write to file";

     QFile filer(fileUrl1);
     if(!filer.open(QIODevice::ReadWrite)) {
         qDebug() << "Filer open error";
     } else {
         qDebug() <<"imager File open !";
     }
     QByteArray t = filer.readAll();
     filer.close();
     file.write(t);
}
