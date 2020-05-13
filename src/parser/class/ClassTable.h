#pragma once

#include "Class.h"

namespace stc
{

class ClassTable
{
private:
    vector<Class> m_classes;

public:
    ClassTable() = default;

public:
    void add(const Class& a_class) noexcept;
    _NODISCARD bool contains(const Class& a_class) const noexcept;

public:
    _NODISCARD Class* get(const string& name);

public:
    _NODISCARD const vector<Class>& raw() const noexcept;

public:
    void print() const noexcept;


};

}