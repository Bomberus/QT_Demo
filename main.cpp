#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "receiver.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    //Receiver
    Receiver receiver;
     QQmlContext* ctx = engine.rootContext();
     ctx->setContextProperty("receiver", &receiver);

    engine.load(QUrl(QStringLiteral("qrc:/mainForm.qml")));

    return app.exec();
}
