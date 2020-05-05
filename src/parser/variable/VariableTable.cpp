#include "VariableTable.h"

stc::VariableTable::VariableTable(size_t scopeId)
{
    this->m_scopeId = scopeId;
    this->m_parent = nullptr;
}

stc::VariableTable::VariableTable()
{
    this->m_scopeId = -1;
    this->m_parent = nullptr;
}

stc::VariableTable::~VariableTable()
{
    m_variables.clear();
}

void stc::VariableTable::add(stc::Variable* variable)
{
    m_variables.push_back(variable);
}

void stc::VariableTable::print() const
{
    for (const auto& variable : m_variables)
    {
        Log::write("   ");
        variable->print();
    }
}

void stc::VariableTable::setParent(VariableTable* parent)
{
    m_parent = parent;
}

bool stc::VariableTable::contains(const std::string& name) const
{
    auto it = std::find_if(m_variables.begin(), m_variables.end(), [&name](Variable* variable)
    {
        return variable->name() == name;
    });

    return it != m_variables.end();
}

bool stc::VariableTable::containsGlobally(const std::string& name) const
{
    if (!contains(name))
    {
        if (m_parent == nullptr)
        {
            return false;
        }
        else
        {
            return m_parent->containsGlobally(name);
        }
    }
    else
    {
        return true;
    }
}

stc::Variable* stc::VariableTable::getByName(const string& name) const
{
    auto it = std::find_if(m_variables.begin(), m_variables.end(), [&name](Variable* variable)
    {
        return variable->name() == name;
    });

    if (it == m_variables.end())
    {
        if (m_parent == nullptr)
        {
            ErrorHandle::raise("Variable '" + name + "' not found!");
        }
        else
        {
            return m_parent->getByName(name);
        }
    }

    return *it;
}

std::tuple<size_t, stc::Variable*> stc::VariableTable::getVariableAndScopeIdWhereItDeclared(const string& name) const
{
    auto it = std::find_if(m_variables.begin(), m_variables.end(), [&name](Variable* variable)
    {
        return variable->name() == name;
    });


    if (it == m_variables.end())
    {
        if (m_parent == nullptr)
        {
            ErrorHandle::raise("Variable '" + name + "' not found!");
        }
        else
        {
            return m_parent->getVariableAndScopeIdWhereItDeclared(name);
        }
    }

    return std::make_tuple((*it)->scopeId(), *it);
}

const std::vector<stc::Variable*>& stc::VariableTable::raw() const
{
    return m_variables;
}

size_t stc::VariableTable::scopeId() const
{
    return m_scopeId;
}

stc::Variable* stc::VariableTable::getByNameAndScopeId(const std::string& name, size_t scopeId) const
{
    auto it = std::find_if(m_variables.begin(), m_variables.end(), [&name, &scopeId](Variable* variable)
    {
        return variable->name() == name && variable->scopeId() == scopeId;
    });

    if (it == m_variables.end())
    {
        ErrorHandle::raise("Variable '" + name + "' from scope " + std::to_string(scopeId) + " not found!");
    }

    return *it;
}
