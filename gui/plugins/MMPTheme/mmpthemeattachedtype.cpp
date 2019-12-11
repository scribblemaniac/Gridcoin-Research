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
