#include "variable_table.h"

compiler::variable_table::variable_table(size_t block_id) : _block_id(block_id)
{
    this->_parent = nullptr;
}

compiler::variable_table::variable_table()
{
    this->_parent = nullptr;
}

compiler::variable_table::~variable_table()
{
    _vars.clear();
}

void compiler::variable_table::add_variable(compiler::variable* var)
{
    _vars.push_back(var);
}

void compiler::variable_table::print()
{
    for (const auto& var : _vars)
    {
        var->print();
    }
}

void compiler::variable_table::set_parent(variable_table* parent)
{
    _parent = parent;
}

bool compiler::variable_table::has_variable(const std::string& name_) const
{
    auto it = std::find_if(_vars.begin(), _vars.end(), [&name_](variable* var_)
    {
        return var_->name() == name_;
    });

    return it != _vars.end();
}

bool compiler::variable_table::has_variable_globally(const std::string& name_) const
{
    if (!has_variable(name_))
    {
        if (_parent == nullptr)
        {
            return false;
        }
        else
        {
            return _parent->has_variable_globally(name_);
        }
    }
    else
    {
        return true;
    }
}

compiler::variable* compiler::variable_table::get_variable_by_name(const string& name_) const
{
    auto it = std::find_if(_vars.begin(), _vars.end(), [&name_](variable* var_)
    {
        return var_->name() == name_;
    });

    if (it == _vars.end())
    {
        if (_parent == nullptr)
        {
            cout << "Variable '" << name_ << "' not found!" << endl;
            throw std::logic_error("Variable not found!");
        }
        else
        {
            return _parent->get_variable_by_name(name_);
        }
    }

    return *it;
}

std::tuple<size_t, compiler::variable*> compiler::variable_table::get_variable_and_block_id_where_it_defined(const string& name) const
{
    auto it = std::find_if(_vars.begin(), _vars.end(), [&name](variable* var)
    {
        return var->name() == name;
    });


    if (it == _vars.end())
    {
        if (_parent == nullptr)
        {
            cout << "Variable '" << name << "' not found!" << endl;
            throw std::logic_error("Variable not found!");
        }
        else
        {
            return _parent->get_variable_and_block_id_where_it_defined(name);
        }
    }

    return std::make_tuple(_block_id, *it);
}

const std::vector<compiler::variable*>& compiler::variable_table::vars() const
{
    return _vars;
}

std::string compiler::variable_table::generate_prefix() const
{
    return "__" + std::to_string(_block_id);
}

std::string compiler::variable_table::generate_variable_with_prefix(const string& variable_name) const
{
    return generate_prefix() + variable_name;
}

size_t compiler::variable_table::block_id() const
{
    return _block_id;
}

compiler::variable* compiler::variable_table::get_variable(const std::string& name, size_t block_id) const
{
    auto it = std::find_if(_vars.begin(), _vars.end(), [&name, &block_id](variable* var)
    {
        return var->name() == name && var->block_id() == block_id;
    });

    if (it == _vars.end())
    {
        cout << "Variable '" << name << "' from block " << block_id << " not found!" << endl;
        throw std::logic_error( "Variable '" + name + "' from block " + std::to_string(block_id) + " not found!");
    }

    return *it;
}

compiler::variable* compiler::variable_table::get_variable_globally(const std::string& name, size_t block_id) const
{
    auto it = std::find_if(_vars.begin(), _vars.end(), [&name, &block_id](variable* var)
    {
        return var->name() == name && var->block_id() == block_id;
    });

    if (it == _vars.end())
    {
        if (_parent == nullptr)
        {
            cout << "Variable '" << name << "' from block " << block_id << " not found!" << endl;
            throw std::logic_error( "Variable '" + name + "' from block " + std::to_string(block_id) + " not found!");
        }
        else
        {
            return _parent->get_variable_globally(name, block_id);
        }
    }

    return *it;
}
