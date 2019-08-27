#include "imageitem.h"
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
void ImageItem::setimage(const QImage &image){
    this->image = image;
}
void ImageItem::setpoytgons(const QList<QList<QList<int> > > &poytgons){
    this->poytgons = poytgons;
}
void ImageItem::setlabels(const QMap<int, QStringList> labels){
    this->labels = labels;
}
