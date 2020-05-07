#pragma once
#include <iostream>
#include <iomanip>
#include <string>
#include <variant>
#include "../../lexer/token/Token.h"
#include "../../log/Log.h"

#include "type/Type.h"

namespace stc
{
using std::string;
using std::cout;
using std::endl;

template<class... Ts>
struct overload : Ts...
{
    using Ts::operator()...;
};
template<class... Ts>
overload(Ts...)->overload<Ts...>;

using number = long double;

using VariableValue = std::variant<number, bool, string>;


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
    void print() const;

public:
    _NODISCARD string name() const;
    _NODISCARD const Type& type() const;
    _NODISCARD string nameWithPostfix() const;
    _NODISCARD size_t scopeId() const;

    _NODISCARD bool isConst() const;
    _NODISCARD bool isArray() const;


    void isGlobal(bool value);
    _NODISCARD bool isGlobal() const;

    void isArgument(bool value);
    _NODISCARD bool isArgument() const;



public:
    static Type typeVariableValue(VariableValue value);

};


}