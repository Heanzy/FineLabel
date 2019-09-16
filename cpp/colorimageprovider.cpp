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
          int width = 150;
          int height = 50;

          if (size)
              *size = QSize(width, height);

          QPixmap pixmap(requestedSize.width() > 0 ? requestedSize.width() : width,
                         requestedSize.height() > 0 ? requestedSize.height() : height);
              QImage img;
              img = QImage(id);
              pixmap = QPixmap::fromImage(img);

          return pixmap;
      }
  };
