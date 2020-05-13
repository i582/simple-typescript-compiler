#include "../../lexer/token/Token.h"
#include "Variable.h"
#include "../class/Class.h"

stc::Variable::Variable(const std::string& name, const Type& type, size_t scopeId,
                        bool isConst)
{
    this->m_variableName = name;
    this->m_variableType = type;


    this->m_scopeId = scopeId;
    this->m_isConst = isConst;
    this->m_isGlobal = scopeId == 1;
    this->m_isArgument = false;

    this->m_visibilityModifier = ClassVisibilityModifier::PUBLIC;
    this->m_isStatic = false;
}

void stc::Variable::print() const
{
    Log::write("{ ");

    Log::write("Variable name: ");
    Log::write("'" + m_variableName + "', ");

    Log::write("Type: ");
    Log::write("'" + m_variableType.toString() + "', ");

    Log::write("Scope ID: ");
    Log::write(std::to_string(m_scopeId) + "', ");

    Log::write("Visibility Modifier: ");
    Log::write(Class::modifierToString(m_visibilityModifier) + "', ");

    Log::write("Is static: ");
    Log::write(m_isStatic ? "true" : "false");


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

const stc::Type& stc::Variable::type() const
{
    return m_variableType;
}

std::string stc::Variable::nameWithPostfix() const
{
    return m_variableName + std::to_string(m_scopeId);
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

size_t stc::Variable::scopeId() const
{
    return m_scopeId;
}

bool stc::Variable::isArray() const
{
    return m_variableType.isArray();
}

stc::Type stc::Variable::typeVariableValue(VariableValue value)
{
    Type type{};

    std::visit(overload {
        [&](const number& n)
        {
            type = Type(FundamentalType::NUMBER);
        },
        [&](const string& s)
        {
            type = Type(FundamentalType::SYMBOL, true);
        },
        [&](const bool b)
        {
            type = Type(FundamentalType::BOOLEAN);
        }
    }, value);

    return type;
}

stc::ClassVisibilityModifier stc::Variable::visibilityModifier() const
{
    return m_visibilityModifier;
}

void stc::Variable::setVisibilityModifier(stc::ClassVisibilityModifier value)
{
    m_visibilityModifier = value;
}

bool stc::Variable::isStatic() const
{
    return m_isStatic;
}

void stc::Variable::setIsStatic(bool value)
{
    m_isStatic = value;
}

