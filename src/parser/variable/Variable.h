#pragma once

#include <iostream>
#include <string>
#include <variant>

#include "../other/other.h"

#include "../../lexer/token/Token.h"

#include "../types/types.h"

namespace stc
{

using std::string;
using std::cout;
using std::endl;


using number = long double;


class Variable
{
private:
    string m_variableName;
    Type m_variableType;

    bool m_isConst;



    size_t m_scopeId;

    bool m_isGlobal;
    bool m_isArgument;

public:
    Variable(const string& name, const Type& type, size_t scopeId, bool isConst = false);


public:
    void print() const noexcept;

    _NODISCARD string name() const noexcept;
    _NODISCARD string nameWithScopeId() const noexcept;
    _NODISCARD const Type& type() const noexcept;

    _NODISCARD bool isConst() const noexcept;
    _NODISCARD size_t scopeIdWhereVariableDeclared() const noexcept;


    void setIsGlobal(bool value) noexcept;
    _NODISCARD bool isGlobal() const noexcept;


    void setIsArgument(bool value) noexcept;
    _NODISCARD bool isArgument() const noexcept;

};


}