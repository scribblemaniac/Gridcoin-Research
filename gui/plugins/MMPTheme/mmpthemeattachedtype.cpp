#include "mmpthemeattachedtype.h"

#include <QDebug>

// TODO Propagate theme changes or set global theme with static variable

MMPThemeAttachedType::MMPThemeAttachedType(QObject *parent) : QObject(parent),
    m_mode(Mode::Light)
{
    qDebug() << "Initializing" << m_mode;
}

QString MMPThemeAttachedType::sw(QString lightObj, QString darkObj) const
{
    return m_mode == Mode::Light ? lightObj : darkObj;
}

QColor MMPThemeAttachedType::translucent(QColor color, double opacity) const
{
    color.setAlphaF(opacity);
    return color;
}

QColor MMPThemeAttachedType::combine(QColor top, QColor bottom) const
{
    // Algorithm for alpha compositing taken from here:
    // https://stackoverflow.com/questions/28900598/how-to-combine-two-colors-with-varying-alpha-values
    QColor newColor;
    qreal c1 = (1-top.alphaF())*bottom.alphaF();
    qreal c2 = top.alphaF();
    qreal newAlpha = c1 + c2;
    newColor.setRedF((c1*bottom.redF()+c2*top.redF())/newAlpha);
    newColor.setGreenF((c1*bottom.greenF()+c2*top.greenF())/newAlpha);
    newColor.setBlueF((c1*bottom.blueF()+c2*top.blueF())/newAlpha);
    newColor.setAlphaF(newAlpha);
    return newColor;
}

MMPThemeAttachedType::Mode MMPThemeAttachedType::mode() const
{
    qDebug() << "Returning" << m_mode;
    return m_mode;
}

void MMPThemeAttachedType::setMode(Mode m)
{
    m_mode = m;
    qDebug() << "Setting" << m_mode;
}

void MMPThemeAttachedType::resetMode()
{
    //m_mode = Mode::Light;
    qDebug() << "Resetting" << m_mode;
}

QColor MMPThemeAttachedType::getTextColor() const
{
    switch(mode()) {
    case Mode::Light:
        return getColorOxfordBlue();
    case Mode::Dark:
        return getColorWhite();
    default:
        return getColorMissing();
    }
}

QColor MMPThemeAttachedType::getBackground() const
{
    switch(mode()) {
    case Mode::Light:
        return getColorLilyWhite();
    case Mode::Dark:
        return getColorSpaceBlack();
    default:
        return getColorMissing();
    }
}
