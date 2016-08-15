#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon("://BC_icon.png"));

    app.setOrganizationName("EXL\'s Group");
    app.setOrganizationDomain("exlmoto.ru");
    app.setApplicationName("Bezier Clock");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/NonKDE/mainQt.qml")));

    return app.exec();
}
