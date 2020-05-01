#include "VariableTable.h"

stc::VariableTable::VariableTable(size_t block_id) : m_block_id(block_id)
{
    this->m_parent = nullptr;
}

stc::VariableTable::VariableTable()
{
    this->m_parent = nullptr;
}

stc::VariableTable::~VariableTable()
{
    m_variables.clear();
}

void stc::VariableTable::add_variable(stc::Variable* var)
{
    m_variables.push_back(var);
}

void stc::VariableTable::print()
{
    for (const auto& var : m_variables)
    {
        var->print();
    }
}

void stc::VariableTable::set_parent(VariableTable* parent)
{
    m_parent = parent;
}

bool stc::VariableTable::has_variable(const std::string& name_) const
{
    auto it = std::find_if(m_variables.begin(), m_variables.end(), [&name_](Variable* var_)
    {
        return var_->name() == name_;
    });

    return it != m_variables.end();
}

bool stc::VariableTable::has_variable_globally(const std::string& name_) const
{
    if (!has_variable(name_))
    {
        if (m_parent == nullptr)
        {
            return false;
        }
        else
        {
            return m_parent->has_variable_globally(name_);
        }
    }
    else
    {
        return true;
    }
}

stc::Variable* stc::VariableTable::get_variable_by_name(const string& name_) const
{
    auto it = std::find_if(m_variables.begin(), m_variables.end(), [&name_](Variable* var_)
    {
        return var_->name() == name_;
    });

    if (it == m_variables.end())
    {
        if (m_parent == nullptr)
        {
            cout << "Variable '" << name_ << "' not found!" << endl;
            throw std::logic_error("Variable not found!");
        }
        else
        {
            return m_parent->get_variable_by_name(name_);
        }
    }

    return *it;
}

std::tuple<size_t, stc::Variable*> stc::VariableTable::get_variable_and_block_id_where_it_defined(const string& name) const
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
            return m_parent->get_variable_and_block_id_where_it_defined(name);
        }
    }

    return std::make_tuple(m_block_id, *it);
}

const std::vector<stc::Variable*>& stc::VariableTable::vars() const
{
    return m_variables;
}

std::string stc::VariableTable::generate_prefix() const
{
    return "__" + std::to_string(m_block_id);
}

std::string stc::VariableTable::generate_variable_with_prefix(const string& variable_name) const
{
    return generate_prefix() + variable_name;
}

size_t stc::VariableTable::block_id() const
{
    return m_block_id;
}

stc::Variable* stc::VariableTable::get_variable(const std::string& name, size_t block_id) const
{
    auto it = std::find_if(m_variables.begin(), m_variables.end(), [&name, &block_id](Variable* var)
    {
        return var->name() == name && var->block_id() == block_id;
    });

    if (it == m_variables.end())
    {
        cout << "Variable '" << name << "' from block " << block_id << " not found!" << endl;
        throw std::logic_error( "Variable '" + name + "' from block " + std::to_string(block_id) + " not found!");
    }

    return *it;
}

stc::Variable* stc::VariableTable::get_variable_globally(const std::string& name, size_t block_id) const
{
    auto it = std::find_if(m_variables.begin(), m_variables.end(), [&name, &block_id](Variable* var)
    {
        return var->name() == name && var->block_id() == block_id;
    });

    if (it == m_variables.end())
    {
        if (m_parent == nullptr)
        {
            cout << "Variable '" << name << "' from block " << block_id << " not found!" << endl;
            throw std::logic_error( "Variable '" + name + "' from block " + std::to_string(block_id) + " not found!");
        }
        else
        {
            return m_parent->get_variable_globally(name, block_id);
        }
    }

    return *it;
}
