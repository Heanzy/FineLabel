#ifndef FILELIST_H
#define FILELIST_H
#include <QObject>
#include <QtQuick/QQuickItem>
#include<QVector>
class FileList:public QQuickItem
{
    Q_OBJECT
public:
    FileList();
    ~FileList();
public:
    Q_PROPERTY(QStringList fileList READ getfileList WRITE setfileList NOTIFY fileListChanged)

public:
    QStringList getfileList();
    void setfileList(const QStringList &n_fileList);

signals:
    void fileListChanged(const QStringList &fileList);

public:
    Q_INVOKABLE void string2QVector(const QString &fileUrls);
    Q_INVOKABLE QString printFileUrls();
public:
    QStringList fileList;
};

#endif // FILELIST_H
