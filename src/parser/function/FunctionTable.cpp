#include "FunctionTable.h"

void stc::FunctionTable::add(const stc::Function& function) noexcept
{
    m_functions.push_back(function);
}

bool stc::FunctionTable::contains(const stc::Function& function) const noexcept
{
    for (const auto& m_function : m_functions)
    {
        if (m_function == function)
            return true;
    }

    return false;
}

stc::Function& stc::FunctionTable::get(const std::string& name,
                                       const std::vector<stc::ArgumentType>& arguments)
{
    auto it = std::find_if(m_functions.begin(), m_functions.end(), [&](const Function& function)
    {
        auto eq = function.name() == name && function.arguments().size() == arguments.size();

        if (!eq) return false;

        auto current_args = function.arguments();

        for (int i = current_args.size() - 1, j = 0; i >= 0; --i, ++j)
        {
            if (!(current_args[i] == arguments[j]))
            {
                return false;
            }
        }

        return true;
    });

    if (it == m_functions.end())
    {
        cout << "Error! A function with name '" + name + "' and " << Function::argumentsToString(arguments) << " parameter list was not found!" << endl;
        throw std::logic_error("");
    }

    return *it;
}

void stc::FunctionTable::print() const noexcept
{
    for (const auto& function : m_functions)
    {
        function.print();
    }
}

const std::vector<stc::Function>& stc::FunctionTable::raw() const noexcept
{
    return m_functions;
}
