#include "array.h"

compiler::array::array(const string& name, size_t size, const vector<variable_value>& values, class variable* var)
{
    this->_name = name;
    this->_size = size;
    this->_values = values;
    this->_variable = var;
}

std::string compiler::array::name() const
{
    return _name;
}

size_t compiler::array::size() const
{
    return _size;
}

compiler::variable* compiler::array::variable() const
{
    return _variable;
}

void compiler::array::values(const std::vector<compiler::variable_value>& values)
{
    _values = values;
}

const std::vector<compiler::variable_value>& compiler::array::values() const
{
    return _values;
}

std::string compiler::array::values_to_string() const
{
    string result;

    for (int i = _values.size() - 1; i >= 0; --i)
    {
        const auto& value = _values[i];

        auto type = variable::type_variable_value(value);

        switch (type)
        {
            case variable_type::NUMBER:
            {
                result += std::to_string((int)std::get<number>(value));
                break;
            }
            case variable_type::BOOLEAN:
            {
                result += std::to_string(std::get<bool>(value));
                break;
            }
            case variable_type::STRING:
            {
                result += std::get<string>(value);
                result += ",0";
                break;
            }

            case variable_type::UNDEFINED:
            case variable_type::VOID:
            case variable_type::ANY:
            case variable_type::NUMBER_ARRAY:
            case variable_type::BOOLEAN_ARRAY:
            case variable_type::STRING_ARRAY:
            case variable_type::VOID_ARRAY:
                break;
        }

        result += ",";
    }

    result.pop_back();

    return result;
}
