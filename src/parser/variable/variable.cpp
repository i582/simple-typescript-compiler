#include <token/Token.h>
#include "variable.h"

stc::Variable::Variable(const std::string& variable_name, stc::VariableType variable_type, size_t block_id,
                        bool is_const)
{
    this->m_variable_name = variable_name;
    this->m_variable_type = variable_type;


    this->m_block_id = block_id;
    this->m_is_const = is_const;
    this->m_is_global = false;
    this->m_is_argument = false;
}

void stc::Variable::print() const
{
    cout << "name: '" << m_variable_name << "' with type: '" << variable_type_to_string(m_variable_type) << "' in block: '"
         << m_block_id << "'" << endl;
}

std::string stc::Variable::name() const
{
    return m_variable_name;
}

bool stc::Variable::is_const() const
{
    return m_is_const;
}

bool stc::Variable::has_equal_type(const stc::Variable& rhs_)
{
    return m_variable_type == rhs_.m_variable_type &&
           m_is_const == rhs_.m_is_const;
}

stc::VariableType stc::Variable::type() const
{
    return m_variable_type;
}

bool stc::Variable::is_array() const
{
    return (size_t)m_variable_type >= (size_t)VariableType::NUMBER_ARRAY;
}

stc::VariableType stc::Variable::variable_type_from_token_type(stc::TokenType token_type_)
{
    auto value = (int)token_type_;
    return VariableType(value);
}

bool stc::Variable::is_types_reducible(VariableType type1, VariableType type2)
{
    return type1 == type2 || type2 == VariableType::ANY;
}

std::string stc::Variable::variable_type_to_string(VariableType type)
{
    switch (type)
    {
        case VariableType::UNDEFINED:
            return "undefined";
        case VariableType::NUMBER:
            return "number";
        case VariableType::BOOLEAN:
            return "boolean";
        case VariableType::VOID:
            return "void";
        case VariableType::STRING:
            return "string";
        case VariableType::NUMBER_ARRAY:
            return "number[]";
        case VariableType::BOOLEAN_ARRAY:
            return "boolean[]";
        case VariableType::VOID_ARRAY:
            return "void[]";
        case VariableType::STRING_ARRAY:
            return "string[]";
        default:
            return "not defined, possible error";
    }
}

void stc::Variable::block_id(size_t block_id)
{
    m_block_id = block_id;
}

size_t stc::Variable::block_id() const
{
    return m_block_id;
}

bool stc::Variable::is_array_type(stc::VariableType type)
{
    return (size_t)type >= (size_t)VariableType::NUMBER_ARRAY;
}

std::string stc::Variable::name_with_postfix() const
{
    return m_variable_name + std::to_string(m_block_id);
}

stc::VariableType stc::Variable::type_of_array_type(VariableType type)
{
    return (VariableType)(size_t(type) >> 4);
}

stc::VariableType stc::Variable::type_variable_value(VariableValue value)
{
    VariableType type = VariableType::UNDEFINED;

    std::visit(overload {
        [&](const number& n)
        {
            type = VariableType::NUMBER;
        },
        [&](const string& s)
        {
            type = VariableType::STRING;
        },
        [&](const bool b)
        {
            type = VariableType::BOOLEAN;
        }
    }, value);

    return type;
}

size_t stc::Variable::byte_on_type(VariableType type)
{
    switch (type)
    {
        case VariableType::UNDEFINED:
            return 0;
        case VariableType::NUMBER:
            return 4;
        case VariableType::BOOLEAN:
            return 4;
        case VariableType::STRING:
            return 4;
        case VariableType::VOID:
            return 0;
        case VariableType::ANY:
            return 0;
        case VariableType::NUMBER_ARRAY:
            return 4;
        case VariableType::BOOLEAN_ARRAY:
            return 4;
        case VariableType::STRING_ARRAY:
            return 4;
        case VariableType::VOID_ARRAY:
            return 0;
        default:
            return 0;
    }
}

void stc::Variable::is_global_variable(bool is_global_variable)
{
    m_is_global = is_global_variable;
}

bool stc::Variable::is_global_variable() const
{
    return m_is_global;
}

bool stc::Variable::is_argument_variable() const
{
    return m_is_argument;
}

void stc::Variable::is_argument_variable(bool is_argument_variable)
{
    m_is_argument = is_argument_variable;
}
