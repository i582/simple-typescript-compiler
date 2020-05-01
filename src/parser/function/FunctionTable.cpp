#include "FunctionTable.h"

stc::FunctionTable::~FunctionTable()
{
    m_functions.clear();
}

void stc::FunctionTable::add_function(stc::Function* new_function)
{
    m_functions.push_back(new_function);
}

bool stc::FunctionTable::has_function(stc::Function* function)
{
    for (const auto& item : m_functions)
    {
        if (*item == *function)
            return true;
    }

    return false;
}

stc::Function* stc::FunctionTable::get_function(const std::string& name,
                                                const std::vector<stc::ArgumentType>& arguments_description)
{
    auto it = std::find_if(m_functions.begin(), m_functions.end(), [&](Function* current_func_)
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

    if (it == m_functions.end())
    {
        cout << "Error! A function with name '" + name + "' and this parameter list was not found!" << endl;
        throw std::logic_error("");
    }

    return *it;
}

stc::Function* stc::FunctionTable::get_function(const std::string& name)
{
    auto it = std::find_if(m_functions.begin(), m_functions.end(), [&](Function* current_func_)
    {
        return current_func_->name() == name;
    });

    if (it == m_functions.end())
    {
        cout << "Error! A function with name '" + name + "' was not found!" << endl;
        throw std::logic_error("");
    }

    return *it;
}

void stc::FunctionTable::print() const
{
    for (const auto& function : m_functions)
    {
        cout << "name: " << function->name() <<
             ", return type: " << Variable::variable_type_to_string(function->return_type()) <<
             ", arguments: " << function->arguments_string() <<
                " with size: " << function->arguments_size() <<
                ", local variable size: " << function->local_variable_size() << endl ;
    }
}

const std::vector<stc::Function*>& stc::FunctionTable::functions() const
{
    return m_functions;
}
