#include "mmptheme.h"

MMPTheme::MMPTheme()
{

}

MMPThemeAttachedType* MMPTheme::qmlAttachedProperties(QObject *object)
{
    return new MMPThemeAttachedType(object);
}
