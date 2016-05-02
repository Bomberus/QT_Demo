TEMPLATE = app

QT += qml quick widgets

CONFIG += c++11

SOURCES += main.cpp \
    receiver.cpp \
    profile.cpp

RESOURCES += \
    forms.qrc \
    icons.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    mainForm.qml

HEADERS += \
    receiver.h \
    profile.h
