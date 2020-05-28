#pragma once

#include <string>
#include <stdexcept>

#include "../../../errorHandle/errorHandle.h"
#include "../../../lexer/Lexer.h"
#include "../../../log/Log.h"

namespace stc
{
using std::string;


enum class FundamentalType
{
    NUMBER,
    BOOLEAN,
    SYMBOL,
    VOID,
    ANY
};

class Type
{
private:
    FundamentalType m_fundamentalType;
    bool m_isArray;

public:
    Type() = default;

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
                this->m_fundamentalType = FundamentalType::NUMBER;
                break;
            }
            case TokenType::BOOLEAN:
            {
                this->m_fundamentalType = FundamentalType::BOOLEAN;
                break;
            }
            case TokenType::STRING:
            {
                this->m_fundamentalType = FundamentalType::SYMBOL;
                this->m_isArray = true;
                break;
            }
            case TokenType::VOID:
            {
                this->m_fundamentalType = FundamentalType::VOID;
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
            case FundamentalType::NUMBER:
                return 4;
            case FundamentalType::BOOLEAN:
                return 1;
            case FundamentalType::SYMBOL:
                return isArray() ? 4 : 1;
            case FundamentalType::VOID:
                return 0;
            default:
                return 0;
        }
    }


    _NODISCARD bool isReducibleWith(const Type& type) const noexcept
    {
        return  this->m_fundamentalType == type.m_fundamentalType ||
                type.m_fundamentalType == FundamentalType::ANY;
    }

public:
    static FundamentalType typeFromString(const string& value)
    {
        if (value == "number")
            return FundamentalType::NUMBER;
        if (value == "boolean")
            return FundamentalType::BOOLEAN;
        if (value == "symbol")
            return FundamentalType::SYMBOL;
        if (value == "string")
            return FundamentalType::SYMBOL;
        if (value == "void")
            return FundamentalType::VOID;

        throw std::logic_error("Unrecognized type!");
    }
    static string typeToString(FundamentalType type)
    {
        switch (type)
        {
            case FundamentalType::NUMBER:
                return "number";
            case FundamentalType::BOOLEAN:
                return "boolean";
            case FundamentalType::SYMBOL:
                return "symbol";
            case FundamentalType::VOID:
                return "void";
            case FundamentalType::ANY:
                return "any";
            default:
                return "";

        }
    }

};

}