#pragma once
#include <iostream>
#include <iomanip>
#include <string>
#include <variant>
#include "../../lexer/token/Token.h"

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


enum class VariableType
{
    UNDEFINED       = 0xffffff,

    NUMBER          = 0x1000,
    BOOLEAN         = 0x2000,
    STRING          = 0x3000,
    VOID            = 0x4000,
    ANY             = 0x5000,


    // types for array
    NUMBER_ARRAY    = 0x10000,
    BOOLEAN_ARRAY   = 0x20000,
    STRING_ARRAY    = 0x30000,
    VOID_ARRAY      = 0x40000,
};

class Variable
{
private:
    string m_variableName;
    VariableType m_variableType;

    bool m_isConst;
    size_t m_scopeId;

    bool m_isGlobal;
    bool m_isArgument;


public:
    Variable(const string& variableName, VariableType variableType, size_t scopeId, bool isConst = false);



public:
    void print() const;

public:
    _NODISCARD string name() const;
    _NODISCARD VariableType type() const;
    _NODISCARD string nameWithPostfix() const;
    _NODISCARD size_t scopeId() const;

    _NODISCARD bool isConst() const;
    _NODISCARD bool isArray() const;


    void isGlobal(bool value);
    _NODISCARD bool isGlobal() const;

    void isArgument(bool value);
    _NODISCARD bool isArgument() const;

    /**
     * @brief Возвращает истину, если переданный тип является массивом
     * @param type
     * @return
     */
    static bool isArrayType(VariableType type);

public:

    /**
     * @brief Возвращает тип переменной, равной типу токена
     * @param token_type_
     * @return
     */
    static VariableType variableTypeFromTokenType(TokenType token_type_);

    /**
     * @brief Возвращает истину если типы совместимы
     * @param type1
     * @param type2
     * @return true | false
     */
    static bool isTypesReducible(VariableType type1, VariableType type2);


    /**
     * @brief Возвращает строковое представление переданного типа
     * @param type
     * @return string
     */
    static string variableTypeToString(VariableType type);


    /**
     * @brief Возвращает тип массива
     * @param type
     * @return variable_type
     */
    static VariableType typeOfArrayType(VariableType type);

    /**
     * @brief Возвращает тип, хранящийся в переданном значении
     * @param value
     * @return variable_type
     */
    static VariableType typeVariableValue(VariableValue value);


    /**
     * @brief Возвращает размер в байтах для переданного типа
     * @param type
     * @return
     */
    static size_t typeSizeInByte(VariableType type);
};


}