#include "function_table.h"

compiler::function_table::~function_table()
{
    _functions.clear();
}

void compiler::function_table::add_function(compiler::function* new_function)
{
    _functions.push_back(new_function);
}

bool compiler::function_table::has_function(compiler::function* function)
{
    for (const auto& item : _functions)
    {
        if (*item == *function)
            return true;
    }

    return false;
}

compiler::function* compiler::function_table::get_function(const std::string& name,
                                                           const std::vector<compiler::argument_type>& arguments_description)
{
    auto it = std::find_if(_functions.begin(), _functions.end(), [&](function* current_func_)
    {
        auto eq = current_func_->name() == name && current_func_->arguments().size() == arguments_description.size();

        if (!eq) return false;

        auto current_args = current_func_->arguments();

        for (int i = current_args.size() - 1, j = 0; i >= 0; --i, ++j)
        {
            if (current_args[i] != arguments_description[j])
            {
                return false;
            }
        }

        return true;
    });

    if (it == _functions.end())
    {
        cout << "Error! A function with name '" + name + "' and this parameter list was not found!" << endl;
        throw std::logic_error("");
    }

    return *it;
}

compiler::function* compiler::function_table::get_function(const std::string& name)
{
    auto it = std::find_if(_functions.begin(), _functions.end(), [&](function* current_func_)
    {
        return current_func_->name() == name;
    });

    if (it == _functions.end())
    {
        cout << "Error! A function with name '" + name + "' was not found!" << endl;
        throw std::logic_error("");
    }

    return *it;
}

void compiler::function_table::print() const
{
    for (const auto& function : _functions)
    {
        cout << "name: " << function->name() <<
                ", return type: " << variable::variable_type_to_string(function->return_type()) <<
                ", arguments: " << function->arguments_string() <<
                " with size: " << function->arguments_size() <<
                ", local variable size: " << function->local_variable_size() << endl ;
    }
}

const std::vector<compiler::function*>& compiler::function_table::functions() const
{
    return _functions;
}
