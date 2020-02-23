#include <token/token.h>
#include "variable.h"

compiler::variable::variable(const std::string& variable_name_, compiler::variable_type variable_type_,
                             const compiler::variable_value& variable_value_, bool is_const_)
{
    this->_variable_name = variable_name_;
    this->_variable_type = variable_type_;
    this->_variable_value = variable_value_;

    this->_is_const = is_const_;
}

compiler::variable_value compiler::variable::default_value(compiler::variable_type variable_type_)
{
    switch (variable_type_)
    {
        case variable_type::INT:
        {
            return 0;
        }
        case variable_type::DOUBLE:
        {
            return 0.f;
        }
        case variable_type::BOOLEAN:
        {
            return false;
        }
        case variable_type::INT_ARRAY:
        {
            return 0;
        }
        case variable_type::DOUBLE_ARRAY:
        {
            return 0.f;
        }
        case variable_type::BOOLEAN_ARRAY:
        {
            return false;
        }
        case variable_type::VOID:
        case variable_type::VOID_ARRAY:
        default:
            break;
    }
}

void compiler::variable::print() const
{
    cout << "name: " << _variable_name << " type: " << (int)_variable_type << endl;
}

std::string compiler::variable::name() const
{
    return _variable_name;
}

bool compiler::variable::is_const()
{
    return _is_const;
}

bool compiler::variable::has_equal_type(const compiler::variable& rhs_)
{
    return _variable_type == rhs_._variable_type &&
           _is_const == rhs_._is_const;
}

compiler::variable_type compiler::variable::type() const
{
    return _variable_type;
}

bool compiler::variable::is_array()
{
    return (int)_variable_type > 0x04000;
}

compiler::variable_type compiler::variable::variable_type_from_token_type(compiler::token_type token_type_)
{
    int value = (int)token_type_;
    return variable_type(value);
}
