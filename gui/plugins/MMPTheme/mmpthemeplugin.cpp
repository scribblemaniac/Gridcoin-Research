#include "mmpthemeplugin.h"

#include <QQmlEngine>
#include <QResource>

#include "mmptheme.h"
#include "mmpthemeattachedtype.h"

MMPThemePlugin::MMPThemePlugin(QObject *parent) :
    QQmlExtensionPlugin(parent)
{

}

void MMPThemePlugin::registerTypes(const char *uri)
{
    Q_ASSERT(QLatin1String(uri) == QLatin1String("MMPTheme"));
    qmlRegisterModule(uri, 1, 0);
    qmlRegisterUncreatableType<MMPTheme>(uri, 1, 0, "MMPTheme", "MMPTheme is an attached type");
}

void MMPThemePlugin::initializeEngine(QQmlEngine *engine, const char *uri)
{
    Q_UNUSED(engine)
    Q_UNUSED(uri)
    //engine->addImportPath(QStringLiteral("qrc:/"));
}
