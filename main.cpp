#include <QApplication>
#include <QQuickView>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "receiver.h"
#include "profile.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    //Receiver
    Receiver receiver;
    QQmlContext* ctx = engine.rootContext();
         ctx->setContextProperty("receiver", &receiver);

    engine.load(QUrl(QStringLiteral("qrc:/mainForm.qml")));

    Profile profileData;

    QQuickView view;
    view.rootContext()->setContextProperty("profileData", (QObject *)&profileData);
    view.setSource(QUrl(QStringLiteral("qrc:/profileForm.qml")));
    view.show();


    return app.exec();
}
