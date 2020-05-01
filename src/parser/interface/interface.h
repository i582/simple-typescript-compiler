#pragma once
#include <vector>
#include <string>

#include "../function/FunctionTable.h"

namespace stc
{

class Interface
{
private:
    string m_name;
    FunctionTable m_functions;

public:
    explicit Interface(const string& name)
    {
        this->m_name = name;
    }

    bool operator==(const Interface& rhs) const
    {
        return m_name == rhs.m_name;
    }

public:
    _NODISCARD const string& name() const
    {
        return m_name;
    }

    _NODISCARD const FunctionTable& functions() const
    {
        return m_functions;
    }

    void name(const string& name)
    {
        m_name = name;
    }

    void functions(const FunctionTable& functions)
    {
        m_functions = functions;
    }

public:
    template<typename... Vals>
    void addFunction(Vals&&... vals)
    {
        m_functions.add(Function(std::forward<Vals>(vals...)));
    }

public:
    void print() const noexcept
    {
        cout << "Interface '" << m_name << "'" << endl;
        m_functions.print();

        cout << "\n\n";
    }

};


}