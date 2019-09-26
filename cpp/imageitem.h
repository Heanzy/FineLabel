#ifndef IMAGEITEM_H
#define IMAGEITEM_H
#include <QObject>
#include <QtQuick/QQuickItem>
#include <QImage>
#include <QPainter>
#include <QList>
#include <QMap>
#include <QQmlListProperty>
#include "filelist.h"
class ImageItem:public QQuickItem
{
    Q_OBJECT
public:
    ImageItem();
    ~ImageItem();
public:
    QImage image;
    QList<QList<QList<int>>> poytgons;
    QMap<int,QStringList> labels;
public:
    Q_PROPERTY(QImage image READ getimage WRITE setimage NOTIFY imageChanged)
    Q_PROPERTY(QList<QList<QList<int>>> poytgons READ getpoytgons WRITE setpoytgons NOTIFY poytgonsChanged)
    Q_PROPERTY(QMap<int,QStringList> labels READ getlabels WRITE setlabels NOTIFY labelsChanged)
    Q_INVOKABLE void output(const QString &jsonData,const QString &fileUrl);//向文件系统写json文件
//    Q_INVOKABLE QString input(const QString &fileUrl);
    Q_INVOKABLE QString output1(const QString &fileUrl1);
public:
    QImage getimage();
    QList<QList<QList<int>>> getpoytgons();
    QMap<int,QStringList> getlabels();
    Q_INVOKABLE void setimagetest(const QString &fileUrl);
    void setimage(const QImage &image);
    void setpoytgons(const QList<QList<QList<int>>> &poytgons);
    void setlabels(const QMap<int,QStringList> labels);

signals:
    void imageChanged(const QImage &image);
    void poytgonsChanged(const QList<QList<QList<int>>> &poytgons);
    void labelsChanged(const QMap<int,QStringList> labels);
};

#endif // IMAGEITEM_H
