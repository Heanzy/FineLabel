#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "colorimageprovider.cpp"
#include "filelist.h"
#include "imageitem.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterType<FileList>("he.qt.FileList",1,0,"FileList");
    qmlRegisterType<ImageItem>("he.qt.ImageItem",1,0,"ImageItem");
    QQmlApplicationEngine engine;
    engine.addImageProvider(QLatin1String("colors"),new ColorImageProvider);
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
