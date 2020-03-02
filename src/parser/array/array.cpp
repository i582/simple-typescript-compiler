#include "array.h"

compiler::array::array(const string& name, size_t size)
{
    this->_name = name;
    this->_size = size;
}

std::string compiler::array::name() const
{
    return _name;
}

size_t compiler::array::size() const
{
    return _size;
}

void compiler::array::values(const std::vector<compiler::variable_value>& values)
{
    _values = values;
}
