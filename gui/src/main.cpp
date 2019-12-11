#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath("../imports");
    //engine.addImportPath("../imports/MMPTheme");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    qDebug() << engine.baseUrl();
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
