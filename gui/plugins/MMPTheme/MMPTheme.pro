TEMPLATE = lib

QT += qml quick

CONFIG += c++11 plugin

DESTDIR = ../../imports/MMPTheme
TARGET = mmpthemeplugin

HEADERS += \
    mmpthemeplugin.h \
    mmptheme.h \
    mmpthemeattachedtype.h

SOURCES += \
    mmpthemeplugin.cpp \
    mmptheme.cpp \
    mmpthemeattachedtype.cpp

RESOURCES += \
    resources.qrc

OTHER_FILES += ../themes.qrc

#DISTFILES += \
    #qmldir

qmldir.files = qmldir
qmldir.path = $$DESTDIR
COPIES += qmldir

DISTFILES += \
    SpinBox.qml \
    GroupBox.qml

