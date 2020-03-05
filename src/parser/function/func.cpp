#include "func.h"

compiler::func::func(const std::string& name, compiler::return_type return_type,
                     const std::vector<compiler::argument_type>& arguments)
{
    this->_name = name;
    this->_return_type = return_type;
    this->_arguments = arguments;
    this->_arguments_size = 0;

    for (const auto& argument : arguments)
    {
        this->_arguments_size += variable::byte_on_type(argument);
    }
}

std::string compiler::func::name()
{
    return _name;
}

compiler::return_type compiler::func::return_type()
{
    return _return_type;
}

const std::vector<compiler::argument_type>& compiler::func::arguments()
{
    return _arguments;
}

bool compiler::func::operator==(const compiler::func& rhs) const
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

size_t compiler::func::arguments_size() const
{
    return _arguments_size;
}
