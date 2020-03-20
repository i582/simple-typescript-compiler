#include "function.h"

compiler::function::function(const std::string& name, compiler::return_type return_type,
                             const std::vector<compiler::argument_type>& arguments, size_t size_local_variable,
                             const vector<variable*>& local_variables, const vector<variable*>& argument_variables)
{
    this->_name = name;
    this->_return_type = return_type;
    this->_arguments = arguments;
    this->_arguments_size = 0;
    this->_local_variable_size = size_local_variable;
    this->_local_variables = local_variables;
    this->_argument_variables = argument_variables;

    for (const auto& argument : arguments)
    {
        this->_arguments_size += variable::byte_on_type(argument);
    }
}

std::string compiler::function::name() const
{
    return _name;
}

compiler::return_type compiler::function::return_type() const
{
    return _return_type;
}

const std::vector<compiler::argument_type>& compiler::function::arguments() const
{
    return _arguments;
}

bool compiler::function::operator==(const compiler::function& rhs) const
{
    auto eq = _name == rhs._name &&
              _return_type == rhs._return_type &&
              _arguments.size() == rhs._arguments.size();


    if (eq == false)
        return false;

    for (int i = 0; i < _arguments.size(); ++i)
    {
        if (_arguments[i] != rhs._arguments[i])
        {
            return false;
        }
    }

    return true;
}

size_t compiler::function::arguments_size() const
{
    return _arguments_size;
}

size_t compiler::function::local_variable_size() const
{
    return _local_variable_size;
}

std::string compiler::function::arguments_string() const
{
    string result;
    result += "(";
    for (const auto& argument : _arguments)
    {
        result += variable::variable_type_to_string(argument) + ",";
    }

    if (_arguments.empty())
        result += "void";
    else
        result.pop_back();

    result += ")";
    return result;
}

const std::vector<compiler::variable*>& compiler::function::local_variables() const
{
    return _local_variables;
}

const std::vector<compiler::variable*>& compiler::function::argument_variables() const
{
    return _argument_variables;
}
