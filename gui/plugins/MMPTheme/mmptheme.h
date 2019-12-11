#ifndef MADMAXTHEME_H
#define MADMAXTHEME_H

#include <QObject>
#include <QtGlobal>
#include <QQmlEngine>

#include "mmpthemeattachedtype.h"

class MMPTheme : public QObject
{
    Q_OBJECT
public:
    MMPTheme();
    static MMPThemeAttachedType *qmlAttachedProperties(QObject *object);
};

QML_DECLARE_TYPEINFO(MMPTheme, QML_HAS_ATTACHED_PROPERTIES)

#endif // MADMAXTHEME_H
