#pragma once

#include <string>
#include <stdexcept>


namespace stc
{
using std::string;


enum class FundamentalType
{
    NUMBER,
    BOOLEAN,
    SYMBOL,
    VOID,
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


public:
    void print() const noexcept
    {
        cout << typeToString(m_fundamentalType) << (m_isArray ? ": Array" : "");
    }

    string toString() const noexcept
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

    _NODISCARD size_t countByte() const noexcept
    {
        switch (m_fundamentalType)
        {
            case FundamentalType::NUMBER:
                return 4;
            case FundamentalType::BOOLEAN:
                return 1;
            case FundamentalType::SYMBOL:
                return 1;
            case FundamentalType::VOID:
                return 0;
            default:
                return 0;
        }
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
            default:
                return "";
        }
    }

};

}