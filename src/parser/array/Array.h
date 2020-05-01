#pragma once

#include <vector>
#include "../variable/variable.h"

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
        Array(const string& name, size_t size, const vector<VariableValue>& values = {}, Variable* var = nullptr);

    public:
        [[nodiscard]] string name() const;
        [[nodiscard]] size_t size() const;

        [[nodiscard]] Variable* variable() const;

        void values(const vector<VariableValue>& values);
        [[nodiscard]] const vector<VariableValue>& values() const;

        [[nodiscard]] string values_to_string() const;

    };

}