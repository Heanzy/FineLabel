#include <qquickimageprovider.h>
#include <QImage>
#include <QPainter>
class ColorImageProvider : public QQuickImageProvider
  {
  public:
      ColorImageProvider()
          : QQuickImageProvider(QQuickImageProvider::Pixmap)
      {
      }

      QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize)
      {
          int width = 1220;
          int height = 709;

          if (size)
              *size = QSize(width, height);

          QPixmap pixmap(requestedSize.width() > 0 ? requestedSize.width() : width,
                         requestedSize.height() > 0 ? requestedSize.height() : height);
          if(id == "hello"){
              QImage img;
              img = QImage("C:/Users/sjxy/Pictures/xianhe.png");
              pixmap = QPixmap::fromImage(img);
          }

          return pixmap;
      }
  };
