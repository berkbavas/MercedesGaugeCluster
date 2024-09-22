#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "Animation.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/Qml/Main.qml"));
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    DrivingData *data = new DrivingData;
    Animation animation;
    animation.SetData(data);
    animation.SetBlinkIndicator(false);

    engine.rootContext()->setContextProperty("drivingData", data);
    engine.load(url);

    animation.Init();
    return app.exec();
}
