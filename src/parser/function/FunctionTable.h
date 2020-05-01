#pragma once

#include "Function.h"


namespace stc
{

class FunctionTable
{
private:
    vector<Function> m_functions;

public:
    FunctionTable() = default;

public:
    void add(const Function& function) noexcept;
    _NODISCARD bool contains(const Function& function) const noexcept;

public:
    _NODISCARD Function& get(const string& function, const vector<ArgumentType>& arguments);

public:
    _NODISCARD const vector<Function>& raw() const noexcept;

public:
    void print() const noexcept;

};

}