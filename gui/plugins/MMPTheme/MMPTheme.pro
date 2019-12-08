TEMPLATE = lib

QT += qml quick

CONFIG += c++11 plugin

DESTDIR = ../../imports/MMPTheme
TARGET = mmpthemeplugin

DISTFILES += \
    qmldir

HEADERS += \
    mmpthemeplugin.h

SOURCES += \
    mmpthemeplugin.cpp

qmldir.files = qmldir
qmldir.path = $$DESTDIR
COPIES += qmldir
