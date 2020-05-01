#pragma once

#include <vector>
#include "../variable/variable.h"

namespace stc
{
    using std::string;
    using std::vector;

    using ReturnType = VariableType;
    using ArgumentType = VariableType;

    class Function
    {
    private:
        string m_name;
        ReturnType m_return_type;
        vector<ArgumentType> m_arguments;
        size_t m_arguments_size;
        size_t m_local_variable_size;
        vector<Variable*> m_local_variables;
        vector<Variable*> m_argument_variables;

    public:
        Function(const string& name, ReturnType return_type, const vector<ArgumentType>& arguments,
                 size_t size_local_variable = 0, const vector<Variable*>& local_variables = {},
                 const vector<Variable*>& argument_variables = {});


    public:
        bool operator==(const Function& rhs) const;

    public:
        [[nodiscard]] string name() const;
        [[nodiscard]] ReturnType return_type() const;
        [[nodiscard]] const vector<ArgumentType>& arguments() const;
        [[nodiscard]] const vector<Variable*>& local_variables() const;
        [[nodiscard]] const vector<Variable*>& argument_variables() const;

        [[nodiscard]] string arguments_string() const;

        [[nodiscard]] size_t arguments_size() const;
        [[nodiscard]] size_t local_variable_size() const;
    };


}