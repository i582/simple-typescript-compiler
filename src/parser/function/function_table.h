#pragma once

#include "function.h"


namespace compiler
{

    class function_table
    {
    private:
        vector<function*> _functions;

    public:
        function_table() = default;
        ~function_table();

    public:
        void add_function(function* new_function);
        bool has_function(function* function);

        function* get_function(const string& name, const vector<argument_type>& arguments_description);
        function* get_function(const string& name);

        [[nodiscard]] const vector<function*>& functions() const;

    public:
        void print() const;

    };

}