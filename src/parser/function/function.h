#pragma once

#include <vector>
#include "../variable/variable.h"

namespace compiler
{
    using std::string;
    using std::vector;

    using return_type = variable_type;
    using argument_type = variable_type;

    class function
    {
    private:
        string _name;
        return_type _return_type;
        vector<argument_type> _arguments;
        size_t _arguments_size;
        size_t _local_variable_size;
        vector<variable*> _local_variables;
        vector<variable*> _argument_variables;

    public:
        function(const string& name, return_type return_type, const vector<argument_type>& arguments,
                 size_t size_local_variable = 0, const vector<variable*>& local_variables = {},
                 const vector<variable*>& argument_variables = {});


    public:
        bool operator==(const function& rhs) const;

    public:
        [[nodiscard]] string name() const;
        [[nodiscard]] return_type return_type() const;
        [[nodiscard]] const vector<argument_type>& arguments() const;
        [[nodiscard]] const vector<variable*>& local_variables() const;
        [[nodiscard]] const vector<variable*>& argument_variables() const;

        [[nodiscard]] string arguments_string() const;

        [[nodiscard]] size_t arguments_size() const;
        [[nodiscard]] size_t local_variable_size() const;
    };


}