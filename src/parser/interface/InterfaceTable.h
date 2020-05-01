#pragma once

#include "interface.h"

namespace stc
{

class InterfaceTable
{
private:
    vector<Interface> m_interfaces;

public:
    InterfaceTable() = default;

public:
    void add(const Interface& an_interface) noexcept;
    _NODISCARD bool contains(const Interface& an_interface) const noexcept;

public:
    _NODISCARD Interface& get(const string& an_interface);

public:
    _NODISCARD const vector<Interface>& raw() const noexcept;

public:
    void print() const noexcept;


};

}