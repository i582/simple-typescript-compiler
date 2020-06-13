#pragma once

#include <string>
#include <stdexcept>

#include "../../../errorHandle/errorHandle.h"
#include "../../../lexer/Lexer2.h"
#include "../../../log/Log.h"

namespace stc
{
using std::string;


enum class FundamentalType
{
    Undefined,

    Number,
    Boolean,
    Symbol,
    Void,
    Any
};

class Type
{
private:
    FundamentalType m_fundamentalType;
    bool m_isArray;

public:
    Type()
    {
        this->m_fundamentalType = FundamentalType::Undefined;
        this->m_isArray = false;
    }

    explicit Type(const string& value, bool isArray = false)
    {
        this->m_fundamentalType = typeFromString(value);
        this->m_isArray = isArray || value == "string";
    }

    explicit Type(TokenType type, bool isArray = false)
    {
        switch (type)
        {
            case TokenType::NUMBER:
            {
                this->m_fundamentalType = FundamentalType::Number;
                break;
            }
            case TokenType::BOOLEAN:
            {
                this->m_fundamentalType = FundamentalType::Boolean;
                break;
            }
            case TokenType::STRING:
            {
                this->m_fundamentalType = FundamentalType::Symbol;
                this->m_isArray = true;
                break;
            }
            case TokenType::VOID:
            {
                this->m_fundamentalType = FundamentalType::Void;
                break;
            }

            default:
            {
                ErrorHandle::raise("Invalid TokenType");
                break;
            }

        }


        this->m_isArray = isArray;
    }

    explicit Type(FundamentalType type, bool isArray = false)
    {
        this->m_fundamentalType = type;
        this->m_isArray = isArray;
    }

public:
    bool operator==(const Type& rhs) const noexcept
    {
        return m_fundamentalType == rhs.m_fundamentalType &&
               m_isArray == rhs.m_isArray;
    }

    bool operator!=(const Type& rhs) const
    {
        return !(rhs == *this);
    }


public:
    bool isUndefined() const
    {
        return m_fundamentalType == FundamentalType::Undefined;
    }

    bool is(FundamentalType type, bool isArray = false) const noexcept
    {
        return m_fundamentalType == type && m_isArray == isArray;
    }

    void print() const noexcept
    {
        Log::write(toString());
    }

    _NODISCARD string toString() const noexcept
    {
        return typeToString(m_fundamentalType) + (m_isArray ? ": Array" : "");
    }

    _NODISCARD FundamentalType fundamentalType() const noexcept
    {
        return m_fundamentalType;
    }
    _NODISCARD bool isArray() const noexcept
    {
        return m_isArray;
    }

    _NODISCARD Type nonArrayType() const noexcept
    {
        return Type(m_fundamentalType, false);
    }

    _NODISCARD size_t size() const noexcept
    {
        switch (m_fundamentalType)
        {
            case FundamentalType::Number:
                return 4;
            case FundamentalType::Boolean:
                return 1;
            case FundamentalType::Symbol:
                return isArray() ? 4 : 1;
            case FundamentalType::Void:
                return 0;
            default:
                return 0;
        }
    }

    /**
     * @brief Функция проверяющая являются ли переданные типы приводимыми друг к другу
     * @param type Тип для проверки
     * @return bool
     */
    _NODISCARD bool isReducibleWith(const Type& type) const noexcept
    {
        return  this->m_fundamentalType == type.m_fundamentalType ||
                type.m_fundamentalType == FundamentalType::Any;
    }

public:
    static FundamentalType typeFromString(const string& value)
    {
        if (value == "number")
            return FundamentalType::Number;
        if (value == "boolean")
            return FundamentalType::Boolean;
        if (value == "symbol")
            return FundamentalType::Symbol;
        if (value == "string")
            return FundamentalType::Symbol;
        if (value == "void")
            return FundamentalType::Void;
        if (value == "any")
            return FundamentalType::Any;

        throw std::logic_error("Unrecognized type!");
    }
    static string typeToString(FundamentalType type)
    {
        switch (type)
        {
            case FundamentalType::Number:
                return "number";
            case FundamentalType::Boolean:
                return "boolean";
            case FundamentalType::Symbol:
                return "symbol";
            case FundamentalType::Void:
                return "void";
            case FundamentalType::Any:
                return "any";
            case FundamentalType::Undefined:
                return "undefined";
            default:
                return "";

        }
    }

};

}