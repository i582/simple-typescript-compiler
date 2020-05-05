#include "Array.h"

stc::Array::Array(const string& name, size_t size, const vector<VariableValue>& values, class Variable* variable)
{
    this->m_name = name;
    this->m_size = size;
    this->m_values = values;
    this->m_variable = variable;
}

std::string stc::Array::name() const
{
    return m_name;
}

size_t stc::Array::size() const
{
    return m_size;
}

stc::Variable* stc::Array::variable() const
{
    return m_variable;
}

void stc::Array::values(const std::vector<stc::VariableValue>& values)
{
    m_values = values;
}

const std::vector<stc::VariableValue>& stc::Array::values() const
{
    return m_values;
}

std::string stc::Array::valuesToString() const
{
    string result;

    for (int i = m_values.size() - 1; i >= 0; --i)
    {
        const auto& value = m_values[i];

        auto type = Variable::typeVariableValue(value);

        switch (type)
        {
            case VariableType::NUMBER:
            {
                result += std::to_string((int)std::get<number>(value));
                break;
            }
            case VariableType::BOOLEAN:
            {
                result += std::to_string(std::get<bool>(value));
                break;
            }
            case VariableType::STRING:
            {
                result += std::get<string>(value);
                result += ",0";
                break;
            }

            case VariableType::UNDEFINED:
            case VariableType::VOID:
            case VariableType::ANY:
            case VariableType::NUMBER_ARRAY:
            case VariableType::BOOLEAN_ARRAY:
            case VariableType::STRING_ARRAY:
            case VariableType::VOID_ARRAY:
                break;
        }

        result += ",";
    }
    result.pop_back();

    return result;
}
