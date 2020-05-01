#include <token/Token.h>
#include "Variable.h"

stc::Variable::Variable(const string& name, const Type& type, size_t scopeId, bool isConst)
{
    this->m_variableName = name;
    this->m_variableType = type;


    this->m_scopeId = scopeId;
    this->m_isConst = isConst;
    this->m_isGlobal = scopeId == 0;
    this->m_isArgument = false;
}

void stc::Variable::print() const noexcept
{
    cout << "Variable name: '" << m_variableName << "'. Type: '" << m_variableType.toString() <<
    "'. Declared in block: '" << m_scopeId << "'" << endl;
}

std::string stc::Variable::name() const noexcept
{
    return m_variableName;
}

bool stc::Variable::isConst() const noexcept
{
    return m_isConst;
}

const stc::Type& stc::Variable::type() const noexcept
{
    return m_variableType;
}

size_t stc::Variable::scopeIdWhereVariableDeclared() const noexcept
{
    return m_scopeId;
}

std::string stc::Variable::nameWithScopeId() const noexcept
{
    return m_variableName + std::to_string(m_scopeId);
}

void stc::Variable::setIsGlobal(bool value) noexcept
{
    m_isGlobal = value;
}

bool stc::Variable::isGlobal() const noexcept
{
    return m_isGlobal;
}

bool stc::Variable::isArgument() const noexcept
{
    return m_isArgument;
}

void stc::Variable::setIsArgument(bool value) noexcept
{
    m_isArgument = value;
}
