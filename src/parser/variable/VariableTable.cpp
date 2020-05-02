#include "VariableTable.h"

stc::VariableTable::VariableTable(size_t scopeId)
{
    this->m_parent = nullptr;
    this->m_scopeId = scopeId;
}

void stc::VariableTable::add(stc::Variable* variable)
{
    m_variables.push_back(variable);
}

void stc::VariableTable::print() const noexcept
{
    for (const auto& variable : m_variables)
    {
        variable->print();
    }
}

void stc::VariableTable::setParentTable(VariableTable* parent) noexcept
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

stc::Variable* stc::VariableTable::getByName(const string& name)
{
    auto it = std::find_if(m_variables.begin(), m_variables.end(), [&name](Variable* variable)
    {
        return variable->name() == name;
    });

    if (it == m_variables.end())
    {
        if (m_parent == nullptr)
        {
            cout << "Variable '" << name << "' not found!" << endl;
            throw std::logic_error("Variable not found!");
        }
        else
        {
            return m_parent->getByName(name);
        }
    }

    return *it;
}

std::tuple<size_t, stc::Variable*> stc::VariableTable::getVariableAndScopeIdWhereItDeclared(const string& name)
{
    auto it = std::find_if(m_variables.begin(), m_variables.end(), [&name](Variable* var)
    {
        return var->name() == name;
    });


    if (it == m_variables.end())
    {
        if (m_parent == nullptr)
        {
            cout << "Variable '" << name << "' not found!" << endl;
            throw std::logic_error("Variable not found!");
        }
        else
        {
            return m_parent->getVariableAndScopeIdWhereItDeclared(name);
        }
    }

    return std::make_tuple(m_scopeId, *it);
}

const std::vector<stc::Variable*>& stc::VariableTable::raw() const
{
    return m_variables;
}

std::vector<stc::Variable*>& stc::VariableTable::raw()
{
    return m_variables;
}

size_t stc::VariableTable::scopeId() const noexcept
{
    return m_scopeId;
}

stc::Variable* stc::VariableTable::getByNameAndScopeId(const std::string& name, size_t block_id)
{
    auto it = std::find_if(m_variables.begin(), m_variables.end(), [&name, &block_id](Variable* var)
    {
        return var->name() == name && var->scopeIdWhereVariableDeclared() == block_id;
    });

    if (it == m_variables.end())
    {
        cout << "Variable '" << name << "' from block " << block_id << " not found!" << endl;
        throw std::logic_error( "Variable '" + name + "' from block " + std::to_string(block_id) + " not found!");
    }

    return *it;
}
