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
    cout << "name: '" << _variable_name << "' with type: '" << variable_type_to_string(_variable_type) << "' in block: '"
                                                                                        << _block_id  << "'" << endl;
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
    return type1 == type2 || type2 == variable_type::ANY;
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
        default:
            return "not defined, possible error";
    }
}

void compiler::variable::block_id(size_t block_id)
{
    _block_id = block_id;
}

size_t compiler::variable::block_id() const
{
    return _block_id;
}

bool compiler::variable::is_array_type(compiler::variable_type type)
{
    return (size_t)type >= (size_t)variable_type::NUMBER_ARRAY;
}

std::string compiler::variable::name_with_postfix() const
{
    return _variable_name + std::to_string(_block_id);
}

compiler::variable_type compiler::variable::type_of_array_type(variable_type type)
{
    return (variable_type)(size_t(type) >> 4);
}

compiler::variable_type compiler::variable::type_variable_value(variable_value value)
{
    variable_type type = variable_type::UNDEFINED;

    std::visit(overload {
        [&](const number& n)
        {
            type = variable_type::NUMBER;
        },
        [&](const string& s)
        {
            type = variable_type::STRING;
        },
        [&](const bool b)
        {
            type = variable_type::BOOLEAN;
        }
    }, value);

    return type;
}

size_t compiler::variable::byte_on_type(variable_type type)
{
    switch (type)
    {
        case variable_type::UNDEFINED:
            return 0;
        case variable_type::NUMBER:
            return 4;
        case variable_type::BOOLEAN:
            return 4;
        case variable_type::STRING:
            return 4;
        case variable_type::VOID:
            return 0;
        case variable_type::ANY:
            return 0;
        case variable_type::NUMBER_ARRAY:
            return 4;
        case variable_type::BOOLEAN_ARRAY:
            return 4;
        case variable_type::STRING_ARRAY:
            return 4;
        case variable_type::VOID_ARRAY:
            return 0;
    }
}
