TEMPLATE = lib

QT += qml quick

CONFIG += c++11 plugin

DESTDIR = ../../imports/MMPTheme
TARGET = mmpthemeplugin

HEADERS += \
    mmpthemeplugin.h

SOURCES += \
    mmpthemeplugin.cpp

#DISTFILES += \
    #qmldir

qmldir.files = qmldir
qmldir.path = $$DESTDIR
COPIES += qmldir
