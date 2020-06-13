#pragma once
#include "../variable/type/Type.h"

namespace stc
{

class Initializer
{
private:
    size_t m_countElement;
    Type m_type;
    Type m_elementType;

public:
    Initializer(size_t countElement, const Type& initializerType, const Type& elementsType)
    {
        this->m_countElement = countElement;
        this->m_type = initializerType;
        this->m_elementType = elementsType;
    }


public:
    _NODISCARD size_t countElement() const
    {
        return m_countElement;
    }

    _NODISCARD const Type& elementType() const
    {
        return m_elementType;
    }

    _NODISCARD const Type& type() const
    {
        return m_type;
    }
};

}