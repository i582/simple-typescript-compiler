#include "../../lexer/token/Token.h"
#include "Variable.h"
#include "../class/Class.h"

stc::Variable::Variable(const std::string& name, const Type& type, size_t scopeId,
                        bool isConst)
{
    this->m_name = name;
    this->m_type = type;


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
    Log::write("'" + m_name + "', ");

    Log::write("Type: ");
    Log::write("'" + m_type.toString() + "', ");

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
    return m_name;
}

bool stc::Variable::isConst() const
{
    return m_isConst;
}

const stc::Type& stc::Variable::type() const
{
    return m_type;
}

std::string stc::Variable::nameWithPostfix() const
{
    return m_name + std::to_string(m_scopeId);
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
    return m_type.isArray();
}

stc::Type stc::Variable::typeVariableValue(VariableValue value)
{
    Type type{};

    std::visit(overload {
        [&](const number& n)
        {
            type = Type(FundamentalType::Number);
        },
        [&](const string& s)
        {
            type = Type(FundamentalType::Symbol, true);
        },
        [&](const bool b)
        {
            type = Type(FundamentalType::Boolean);
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

stc::string stc::Variable::toString() const
{
    return "{ Variable name: '" + m_name +
           "'. Type: '" + m_type.toString() +
           "'. Scope ID: '" + to_string(m_scopeId) +
           "'. Visibility Modifier: '" + Class::modifierToString(m_visibilityModifier) +
           "'. Is static: " + (m_isStatic ? "true" : "false") +
           ". Address: 0x" + to_string((int)this) +
           " }";
}
