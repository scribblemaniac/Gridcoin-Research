#include "mmpthemeplugin.h"

#include <QQmlEngine>

MMPThemePlugin::MMPThemePlugin(QObject *parent) :
    QQmlExtensionPlugin(parent)
{

}

void MMPThemePlugin::registerTypes(const char *uri)
{
    Q_ASSERT(QLatin1String(uri) == QLatin1String("MMPTheme"));
    qmlRegisterModule(uri, 1, 0);
}
