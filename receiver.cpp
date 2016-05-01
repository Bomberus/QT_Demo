#include "receiver.h"

Receiver::Receiver(QObject *parent) :
    QObject(parent)
{
}

void Receiver::receiveFromQml(int count) {
    this->sendToQml(count+100);
}
