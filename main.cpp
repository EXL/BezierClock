#include <QGuiApplication>
#include <QQuickView>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickView view(QUrl(QStringLiteral("qrc:/main.qml")));
    view.show();

    return app.exec();
}
