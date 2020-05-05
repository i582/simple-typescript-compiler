#include "../../lexer/token/Token.h"
#include "Variable.h"

stc::Variable::Variable(const std::string& variableName, stc::VariableType variableType, size_t scopeId,
                        bool isConst)
{
    this->m_variableName = variableName;
    this->m_variableType = variableType;


    this->m_scopeId = scopeId;
    this->m_isConst = isConst;
    this->m_isGlobal = scopeId == 1;
    this->m_isArgument = false;
}

void stc::Variable::print() const
{
    Log::write("{ ");

    Log::write("Variable name: ");
    Log::write("'" + m_variableName + "', ");

    Log::write("Type: ");
    Log::write("'" + variableTypeToString(m_variableType) + "', ");

    Log::write("Scope ID: ");
    Log::write(std::to_string(m_scopeId));

    Log::write(" }\n");
}

std::string stc::Variable::name() const
{
    return m_variableName;
}

bool stc::Variable::isConst() const
{
    return m_isConst;
}

stc::VariableType stc::Variable::type() const
{
    return m_variableType;
}

bool stc::Variable::isArray() const
{
    return (size_t)m_variableType >= (size_t)VariableType::NUMBER_ARRAY;
}

stc::VariableType stc::Variable::variableTypeFromTokenType(stc::TokenType token_type_)
{
    auto value = (int)token_type_;
    return VariableType(value);
}

bool stc::Variable::isTypesReducible(VariableType type1, VariableType type2)
{
    return type1 == type2 || type2 == VariableType::ANY;
}

std::string stc::Variable::variableTypeToString(VariableType type)
{
    switch (type)
    {
        case VariableType::UNDEFINED:
            return "undefined";
        case VariableType::NUMBER:
            return "number";
        case VariableType::BOOLEAN:
            return "boolean";
        case VariableType::VOID:
            return "void";
        case VariableType::STRING:
            return "string";
        case VariableType::NUMBER_ARRAY:
            return "number[]";
        case VariableType::BOOLEAN_ARRAY:
            return "boolean[]";
        case VariableType::VOID_ARRAY:
            return "void[]";
        case VariableType::STRING_ARRAY:
            return "string[]";
        default:
            return "not defined, possible error";
    }
}

size_t stc::Variable::scopeId() const
{
    return m_scopeId;
}

bool stc::Variable::isArrayType(stc::VariableType type)
{
    return (size_t)type >= (size_t)VariableType::NUMBER_ARRAY;
}

std::string stc::Variable::nameWithPostfix() const
{
    return m_variableName + std::to_string(m_scopeId);
}

stc::VariableType stc::Variable::typeOfArrayType(VariableType type)
{
    return (VariableType)(size_t(type) >> 4);
}

stc::VariableType stc::Variable::typeVariableValue(VariableValue value)
{
    VariableType type = VariableType::UNDEFINED;

    std::visit(overload {
        [&](const number& n)
        {
            type = VariableType::NUMBER;
        },
        [&](const string& s)
        {
            type = VariableType::STRING;
        },
        [&](const bool b)
        {
            type = VariableType::BOOLEAN;
        }
    }, value);

    return type;
}

size_t stc::Variable::typeSizeInByte(VariableType type)
{
    switch (type)
    {
        case VariableType::UNDEFINED:
            return 0;
        case VariableType::NUMBER:
            return 4;
        case VariableType::BOOLEAN:
            return 4;
        case VariableType::STRING:
            return 4;
        case VariableType::VOID:
            return 0;
        case VariableType::ANY:
            return 0;
        case VariableType::NUMBER_ARRAY:
            return 4;
        case VariableType::BOOLEAN_ARRAY:
            return 4;
        case VariableType::STRING_ARRAY:
            return 4;
        case VariableType::VOID_ARRAY:
            return 0;
        default:
            return 0;
    }
}

void stc::Variable::isGlobal(bool value)
{
    m_isGlobal = value;
}

bool stc::Variable::isGlobal() const
{
    return m_isGlobal;
}

bool stc::Variable::isArgument() const
{
    return m_isArgument;
}

void stc::Variable::isArgument(bool value)
{
    m_isArgument = value;
}
