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
        case variable_type::NUMBER:
        {
            return (long double)0.0;
        }
        case variable_type::BOOLEAN:
        {
            return false;
        }
        case variable_type::STRING:
        {
            return "";
        }
        case variable_type::NUMBER_ARRAY:
        {
            return (long double)0.0;
        }
        case variable_type::BOOLEAN_ARRAY:
        {
            return false;
        }
        case variable_type::STRING_ARRAY:
        {
            return "";
        }
        case variable_type::VOID:
        case variable_type::VOID_ARRAY:
        default:
            return (long double)0;
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
    return (size_t)_variable_type >= (size_t)variable_type::NUMBER_ARRAY;
}

compiler::variable_type compiler::variable::variable_type_from_token_type(compiler::token_type token_type_)
{
    int value = (int)token_type_;
    return variable_type(value);
}

bool compiler::variable::is_types_reducible(variable_type type1, variable_type type2)
{
    return type1 == type2;
}

std::string compiler::variable::variable_type_to_string(variable_type type)
{
    switch (type)
    {
        case variable_type::UNDEFINED:
            return "undefined";
        case variable_type::NUMBER:
            return "number";
        case variable_type::BOOLEAN:
            return "boolean";
        case variable_type::VOID:
            return "void";
        case variable_type::STRING:
            return "string";
        case variable_type::NUMBER_ARRAY:
            return "number[]";
        case variable_type::BOOLEAN_ARRAY:
            return "boolean[]";
        case variable_type::VOID_ARRAY:
            return "void[]";
        case variable_type::STRING_ARRAY:
            return "string[]";
    }
}
