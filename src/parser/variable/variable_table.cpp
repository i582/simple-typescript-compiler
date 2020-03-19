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

void compiler::variable_table::add_variable(compiler::variable* new_var_)
{
    _vars.push_back(new_var_);
}

void compiler::variable_table::print()
{
    for (const auto& var : _vars)
    {
        var->print();
    }
}

void compiler::variable_table::set_parent(variable_table* parent_)
{
    _parent = parent_;
}

bool compiler::variable_table::has_variable(const std::string& name_)
{
    auto it = std::find_if(_vars.begin(), _vars.end(), [&name_](variable* var_)
    {
        return var_->name() == name_;
    });

    return it != _vars.end();
}

bool compiler::variable_table::has_variable_or_has_in_parent(const std::string& name_)
{
    if (!has_variable(name_))
    {
        if (_parent == nullptr)
        {
            return false;
        }
        else
        {
            return _parent->has_variable_or_has_in_parent(name_);
        }
    }
    else
    {
        return true;
    }
}

compiler::variable* compiler::variable_table::get_variable_by_name(const string& name_)
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

std::tuple<size_t, compiler::variable*> compiler::variable_table::get_variable(const string& name)
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
            return _parent->get_variable(name);
        }
    }

    return std::make_tuple(_block_id, *it);
}

std::vector<compiler::variable*>& compiler::variable_table::vars()
{
    return _vars;
}

std::string compiler::variable_table::generate_prefix()
{
    return "__" + std::to_string(_block_id);
}

std::string compiler::variable_table::generate_variable_with_prefix(const string& variable_name)
{
    return generate_prefix() + variable_name;
}

size_t compiler::variable_table::block_id() const
{
    return _block_id;
}

bool compiler::variable_table::has_variable_in_current_function(const std::string& name)
{
    if (!has_variable(name))
    {
        if (_parent == nullptr || for_function())
        {
            return false;
        }
        else
        {
            if (!_parent->for_function())
            {
                return _parent->has_variable_or_has_in_parent(name);
            }
            else
            {
                return _parent->has_variable(name);
            }
        }
    }
    else
    {
        return true;
    }
}

bool compiler::variable_table::for_function() const
{
    return _for_function;
}

void compiler::variable_table::for_function(bool for_function)
{
    _for_function = for_function;
}
