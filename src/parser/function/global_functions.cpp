#include "global_functions.h"

compiler::global_functions::global_functions()
{
    this->_table = nullptr;

    this->init();
}

compiler::global_functions::~global_functions()
{
    delete _table;
}

void compiler::global_functions::init()
{
    _table = new function_table();

    auto array_new_function = new function("Array", return_type::ANY, {variable_type::NUMBER});
    _table->add_function(array_new_function);

    auto new_function = new function("input", return_type::NUMBER, {});
    _table->add_function(new_function);

    new_function = new function("print", return_type::VOID, {return_type::NUMBER});
    _table->add_function(new_function);

    new_function = new function("println", return_type::VOID, {return_type::STRING});
    _table->add_function(new_function);

    new_function = new function("sqrt", return_type::NUMBER, {return_type::NUMBER});
    _table->add_function(new_function);
}

compiler::function* compiler::global_functions::get_function(const std::string& name,
                                                             const std::vector<compiler::argument_type>& arguments_description)
{
    return _table->get_function(name, arguments_description);
}

bool compiler::global_functions::has_function(compiler::function* function)
{
    return _table->has_function(function);
}

bool compiler::global_functions::has_function(const std::string& name)
{
    function* new_function = nullptr;

    if (name == "Array")
    {
        new_function = new function(name, return_type::ANY, {argument_type::NUMBER });
    }
    else if (name == "input")
    {
        new_function = new function(name, return_type::NUMBER, {});
    }
    else if (name == "print")
    {
        new_function = new function(name, return_type::VOID, {return_type::NUMBER});
    }
    else if (name == "println")
    {
        new_function = new function(name, return_type::VOID, {return_type::STRING});
    }
    else if (name == "sqrt")
    {
        new_function = new function(name, return_type::NUMBER, {return_type::NUMBER});
    }
    else
    {
        return false;
    }

    return _table->has_function(new_function);
}
