#include "profile.h"
#include <QtDebug>

Profile::Profile() {
    setName("Max");
}

Profile::~Profile() {

}

QString Profile::name() const{
    return m_name;
}

void Profile::setName(QString name){
    m_name = name;
    emit nameChanged();
}
