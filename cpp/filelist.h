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
    Q_PROPERTY(int fileIndex READ getfileIndex WRITE setfileIndex NOTIFY fileIndexChanged)
    Q_PROPERTY(int sizeOffileList READ getsizeOffileList WRITE setsizeOffileList NOTIFY sizeOffileListChanged)

public:
    QStringList getfileList();
    int getfileIndex();
    int getsizeOffileList();
    void setfileList(const QStringList &n_fileList);
    void setfileIndex(const int &fileIndex);
    void setsizeOffileList(const int &sizeOffileList);
signals:
    void fileListChanged(const QStringList &fileList);
    void fileIndexChanged(const int &fileIndex);
    void sizeOffileListChanged(const int &sizeOffileList);
public:
    Q_INVOKABLE void string2QVector(const QString &fileUrls);
    Q_INVOKABLE QString printFileUrls();
public:
    QStringList fileList;
    int fileIndex;
    int sizeOffileList;
};

#endif // FILELIST_H
