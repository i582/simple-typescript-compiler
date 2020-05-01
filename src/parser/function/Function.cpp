#include "Function.h"

stc::Function::Function(const std::string& name, stc::ReturnType return_type,
                        const std::vector<stc::ArgumentType>& arguments, size_t size_local_variable,
                        const vector<Variable*>& local_variables, const vector<Variable*>& argument_variables)
{
    this->m_name = name;
    this->m_return_type = return_type;
    this->m_arguments = arguments;
    this->m_arguments_size = 0;
    this->m_local_variable_size = size_local_variable;
    this->m_local_variables = local_variables;
    this->m_argument_variables = argument_variables;

    for (const auto& argument : arguments)
    {
        this->m_arguments_size += Variable::byte_on_type(argument);
    }
}

std::string stc::Function::name() const
{
    return m_name;
}

stc::ReturnType stc::Function::return_type() const
{
    return m_return_type;
}

const std::vector<stc::ArgumentType>& stc::Function::arguments() const
{
    return m_arguments;
}

bool stc::Function::operator==(const stc::Function& rhs) const
{
    auto eq = m_name == rhs.m_name &&
              m_return_type == rhs.m_return_type &&
              m_arguments.size() == rhs.m_arguments.size();


    if (eq == false)
        return false;

    for (int i = 0; i < m_arguments.size(); ++i)
    {
        if (m_arguments[i] != rhs.m_arguments[i])
        {
            return false;
        }
    }

    return true;
}

size_t stc::Function::arguments_size() const
{
    return m_arguments_size;
}

size_t stc::Function::local_variable_size() const
{
    return m_local_variable_size;
}

std::string stc::Function::arguments_string() const
{
    string result;
    result += "(";
    for (const auto& argument : m_arguments)
    {
        result += Variable::variable_type_to_string(argument) + ",";
    }

    if (m_arguments.empty())
        result += "void";
    else
        result.pop_back();

    result += ")";
    return result;
}

const std::vector<stc::Variable*>& stc::Function::local_variables() const
{
    return m_local_variables;
}

const std::vector<stc::Variable*>& stc::Function::argument_variables() const
{
    return m_argument_variables;
}
