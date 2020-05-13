#include "FunctionTable.h"

stc::FunctionTable::~FunctionTable()
{
    m_functions.clear();
}

void stc::FunctionTable::add(stc::Function* function)
{
    m_functions.push_back(function);
}

bool stc::FunctionTable::contains(stc::Function* function) const
{
    for (const auto& item : m_functions)
    {
        if (*item == *function)
            return true;
    }

    return false;
}

stc::Function* stc::FunctionTable::get(const std::string& name,
                                       const std::vector<stc::ArgumentType>& argumentDescriptions) const
{
    auto it = std::find_if(m_functions.begin(), m_functions.end(), [&](Function* function)
    {
        auto eq = function->name() == name && function->arguments().size() == argumentDescriptions.size();

        if (!eq)
            return false;

        auto current_args = function->arguments();

        for (int i = current_args.size() - 1, j = 0; i >= 0; --i, ++j)
        {
            if (current_args[i] != argumentDescriptions[j])
            {
                return false;
            }
        }

        return true;
    });

    if (it == m_functions.end())
    {
        ErrorHandle::raise("Error! A function with name '" + name + "' and " +
        Function::argumentsToString(argumentDescriptions) + " parameter list was not found!");
    }

    return *it;
}

stc::Function* stc::FunctionTable::get(const std::string& name) const
{
    auto it = std::find_if(m_functions.begin(), m_functions.end(), [&](Function* function)
    {
        return function->name() == name;
    });

    if (it == m_functions.end())
    {
        ErrorHandle::raise("Error! A function with name '" + name + "' was not found!");
    }

    return *it;
}

void stc::FunctionTable::print() const
{
    for (const auto& function : m_functions)
    {
        function->print();
    }
}

const std::vector<stc::Function*>& stc::FunctionTable::raw() const
{
    return m_functions;
}

bool stc::FunctionTable::contains(const std::string& name) const
{
    auto it = std::find_if(m_functions.begin(), m_functions.end(), [&](Function* function)
    {
        return function->name() == name;
    });

    if (it == m_functions.end())
    {
        return false;
    }

    return true;
}

void stc::FunctionTable::clear()
{
    m_functions.clear();
}
