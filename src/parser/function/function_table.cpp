#include "function_table.h"

compiler::function_table::~function_table()
{
    _functions.clear();
}

void compiler::function_table::add_function(compiler::func* new_function)
{
    _functions.push_back(new_function);
}

bool compiler::function_table::has_function(compiler::func* function)
{
    auto it = std::find(_functions.begin(), _functions.end(), function);

    return it == _functions.end();
}

compiler::func* compiler::function_table::get_function(const std::string& name,
                                                       const std::vector<compiler::argument_type>& arguments_description)
{
    auto it = std::find_if(_functions.begin(), _functions.end(), [&](func* current_func_)
    {
        auto eq = current_func_->name() == name && current_func_->arguments().size() == arguments_description.size();

        if (!eq) return false;

        auto current_args = current_func_->arguments();

        for (int i = 0; i < current_args.size(); ++i)
        {
            if (current_args[i] != arguments_description[i])
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
