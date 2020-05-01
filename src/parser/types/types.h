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
    STRING,
    VOID,
    ANY,
};

class Type
{
private:
    FundamentalType m_fundamentalType;
    bool m_isArray;

public:
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
    void print()
    {
        cout << typeToString(m_fundamentalType) << (m_isArray ? ": Array" : "");
    }

public:
    static FundamentalType typeFromString(const string& value)
    {
        if (value == "number")
            return FundamentalType::NUMBER;
        if (value == "boolean")
            return FundamentalType::BOOLEAN;
        if (value == "string")
            return FundamentalType::STRING;
        if (value == "void")
            return FundamentalType::VOID;
        if (value == "any")
            return FundamentalType::ANY;

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
            case FundamentalType::STRING:
                return "string";
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