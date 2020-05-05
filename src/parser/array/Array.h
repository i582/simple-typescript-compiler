#pragma once

#include <vector>
#include "../variable/Variable.h"

namespace stc
{

using std::vector;
using std::string;

class Array
{
private:
    string m_name;
    size_t m_size;

    vector<VariableValue> m_values;

    Variable* m_variable;

public:
    Array(const string& name, size_t size, const vector<VariableValue>& values = {}, Variable* variable = nullptr);

public:
    _NODISCARD string name() const;
    _NODISCARD size_t size() const;

    _NODISCARD Variable* variable() const;

    void values(const vector<VariableValue>& values);
    _NODISCARD const vector<VariableValue>& values() const;

    _NODISCARD string valuesToString() const;

};

}