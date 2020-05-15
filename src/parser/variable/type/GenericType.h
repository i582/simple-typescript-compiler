#pragma once
#include <iostream>
#include <string>

#include "../../../log/Log.h"

namespace stc
{

using std::string;

class Class;

class GenericType
{
private:
    string m_value;
    Class* m_class;

public:
    GenericType()
    {
        this->m_class = nullptr;
    }

    explicit GenericType(const string& value)
    {
        this->m_value = value;
        this->m_class = nullptr;
    }

public:
    bool operator==(const GenericType& rhs) const
    {
        return m_value == rhs.m_value;
    }

    bool operator!=(const GenericType& rhs) const
    {
        return !(rhs == *this);
    }

public:
    void print() const noexcept
    {
        Log::write(m_value);
    }

public:
    _NODISCARD size_t size() const;


    _NODISCARD const string& toString() const
    {
        return m_value;
    }

public:
    void setClass(Class* a_class)
    {
        m_class = a_class;
    }

    _NODISCARD Class* getClass() const
    {
        return m_class;
    }



};

}