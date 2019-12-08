#ifndef MMPTHEMEPLUGIN_H
#define MMPTHEMEPLUGIN_H

#include <QQmlExtensionPlugin>

class MMPThemePlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")
public:
    explicit MMPThemePlugin(QObject *parent = nullptr);

    void registerTypes(const char *uri) override;
};

#endif // MMPTHEMEPLUGIN_H
