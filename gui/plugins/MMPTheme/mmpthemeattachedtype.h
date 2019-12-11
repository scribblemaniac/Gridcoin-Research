#ifndef MADMAXTHEMEATTACHEDTYPE_H
#define MADMAXTHEMEATTACHEDTYPE_H

#include <QObject>

class MMPThemeAttachedType : public QObject
{
    Q_OBJECT
    Q_PROPERTY(Mode mode READ mode WRITE setMode NOTIFY modeChanged FINAL)
public:
    enum Mode {
        Light = 0,
        Dark = 1,
        System = 2
    };
    Q_ENUM(Mode)

    explicit MMPThemeAttachedType(QObject *parent = nullptr);

    Q_INVOKABLE QString sw(QString lightObj, QString darkObj) const;

    Mode mode() const;
    void setMode(Mode m);
    void resetMode();
signals:
    void modeChanged();

private:
    Mode m_mode;
};

#endif // MADMAXTHEMEATTACHEDTYPE_H
