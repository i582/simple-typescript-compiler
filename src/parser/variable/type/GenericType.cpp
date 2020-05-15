#include "GenericType.h"
#include "../../class/Class.h"

size_t stc::GenericType::size() const
{
    return m_class->fieldsSize();
}
