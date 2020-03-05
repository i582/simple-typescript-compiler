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

    auto array_new_function = new func("Array", return_type::ANY, {variable_type::NUMBER});
    _table->add_function(array_new_function);

    auto function = new func("input", return_type::NUMBER, {});
    _table->add_function(function);

    function = new func("print", return_type::VOID, {return_type::NUMBER});
    _table->add_function(function);

    function = new func("println", return_type::VOID, {return_type::STRING});
    _table->add_function(function);

    function = new func("sqrt", return_type::NUMBER, {return_type::NUMBER});
    _table->add_function(function);
}

compiler::func* compiler::global_functions::get_function(const std::string& name,
                                                         const std::vector<compiler::argument_type>& arguments_description)
{
    return _table->get_function(name, arguments_description);
}

bool compiler::global_functions::has_function(compiler::func* function)
{
    return _table->has_function(function);
}

bool compiler::global_functions::has_function(const std::string& name)
{
    func* function = nullptr;

    if (name == "Array")
    {
        function = new func(name, return_type::ANY, { argument_type::NUMBER });
    }
    else if (name == "input")
    {
        function = new func(name, return_type::NUMBER, {});
    }
    else if (name == "print")
    {
        function = new func(name, return_type::VOID, {return_type::NUMBER});
    }
    else if (name == "println")
    {
        function = new func(name, return_type::VOID, {return_type::STRING});
    }
    else if (name == "sqrt")
    {
        function = new func(name, return_type::NUMBER, {return_type::NUMBER});
    }
    else
    {
        return false;
    }

    return _table->has_function(function);
}
