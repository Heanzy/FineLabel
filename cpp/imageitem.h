#ifndef IMAGEITEM_H
#define IMAGEITEM_H
#include <QObject>
#include <QtQuick/QQuickItem>
#include <QImage>
#include <QPainter>
#include <QList>
#include <QMap>
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

public:
    QImage getimage();
    QList<QList<QList<int>>> getpoytgons();
    QMap<int,QStringList> getlabels();
    void setimage(const QImage &image);
    void setpoytgons(const QList<QList<QList<int>>> &poytgons);
    void setlabels(const QMap<int,QStringList> labels);

signals:
    void imageChanged(const QImage &image);
    void poytgonsChanged(const QList<QList<QList<int>>> &poytgons);
    void labelsChanged(const QMap<int,QStringList> labels);
};

#endif // IMAGEITEM_H
