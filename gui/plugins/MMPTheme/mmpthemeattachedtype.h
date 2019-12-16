#ifndef MADMAXTHEMEATTACHEDTYPE_H
#define MADMAXTHEMEATTACHEDTYPE_H

#include <QObject>
#include <QFont>
#include <QColor>

class MMPThemeAttachedType : public QObject
{
    Q_OBJECT
    Q_PROPERTY(Mode mode READ mode WRITE setMode NOTIFY modeChanged FINAL)

    // Palette Colors
    Q_PROPERTY(QColor cMirage READ getColorMirage CONSTANT FINAL)
    Q_PROPERTY(QColor cSpaceBlack READ getColorSpaceBlack CONSTANT FINAL)
    Q_PROPERTY(QColor cMobster READ getColorMobster CONSTANT FINAL)
    Q_PROPERTY(QColor cOxfordBlue READ getColorOxfordBlue CONSTANT FINAL)
    Q_PROPERTY(QColor cOxfordOffBlue READ getColorOxfordOffBlue CONSTANT FINAL)
    Q_PROPERTY(QColor cLightSlateGray READ getColorLightSlateGray CONSTANT FINAL)
    Q_PROPERTY(QColor cLilyWhite READ getColorLilyWhite CONSTANT FINAL)
    Q_PROPERTY(QColor cFrostWhite READ getColorFrostWhite CONSTANT FINAL)
    Q_PROPERTY(QColor cWhite READ getColorWhite CONSTANT FINAL)
    Q_PROPERTY(QColor cViolentViolet READ getColorViolentViolet CONSTANT FINAL)
    Q_PROPERTY(QColor cBluePurple READ getColorBluePurple CONSTANT FINAL)
    Q_PROPERTY(QColor cHavelockBlue READ getColorHavelockBlue CONSTANT FINAL)
    Q_PROPERTY(QColor cDullLime READ getColorDullLime CONSTANT FINAL)
    Q_PROPERTY(QColor cCarminePink READ getColorCarminePink CONSTANT FINAL)
    Q_PROPERTY(QColor cMissing READ getColorMissing CONSTANT FINAL)

    // Read-Only Properties
    Q_PROPERTY(QFont font READ getFont CONSTANT FINAL)
    Q_PROPERTY(QColor textColor READ getTextColor NOTIFY textColorChanged FINAL)
    Q_PROPERTY(QColor background READ getBackground NOTIFY backgroundChanged FINAL)
public:
    enum Mode {
        Light = 0,
        Dark = 1,
        System = 2
    };
    Q_ENUM(Mode)

    explicit MMPThemeAttachedType(QObject *parent = nullptr);

    Q_INVOKABLE QString sw(QString lightObj, QString darkObj) const;
    Q_INVOKABLE QColor translucent(QColor color, double opacity) const;
    Q_INVOKABLE QColor combine(QColor top, QColor bottom) const;

    Mode mode() const;
    void setMode(Mode m);
    void resetMode();
    Q_INVOKABLE bool isLightMode() { return m_mode == Mode::Light; }
    Q_INVOKABLE bool isDarkMode() { return m_mode == Mode::Dark; }
signals:
    void modeChanged();
    void textColorChanged();
    void backgroundChanged();

private:
    QColor getColorMirage() const { return QColor(23, 30, 38); }
    QColor getColorSpaceBlack() const { return QColor(26, 38, 50); }
    QColor getColorMobster() const { return QColor(23, 27, 36); }
    QColor getColorOxfordBlue() const { return QColor(58, 70, 93); }
    QColor getColorOxfordOffBlue() const { return QColor(23, 34, 44); }
    QColor getColorLightSlateGray() const { return QColor(115, 131, 161); }
    QColor getColorLilyWhite() const { return QColor(234, 237, 237); }
    QColor getColorFrostWhite() const { return QColor(244, 247, 249); }
    QColor getColorWhite() const { return QColor(255, 255, 255); }
    QColor getColorViolentViolet() const { return QColor(54, 1, 102); }
    QColor getColorBluePurple() const { return QColor(144, 19, 254); }
    QColor getColorHavelockBlue() const { return QColor(74, 144, 226); }
    QColor getColorDullLime() const { return QColor(42, 201, 64); }
    QColor getColorCarminePink() const { return QColor(237, 81, 68); }
    QColor getColorMissing() const { return Qt::magenta; }

    QFont getFont() const { return QFont("SF Pro Text", 9); }
    QColor getTextColor() const;
    QColor getBackground() const;

    Mode m_mode;
};

#endif // MADMAXTHEMEATTACHEDTYPE_H
