#pragma once

#include "func.h"


namespace compiler
{

    class function_table
    {
    private:
        vector<func*> _functions;

    public:
        function_table() = default;
        ~function_table();

    public:
        void add_function(func* new_function);
        bool has_function(func* function);

        func* get_function(const string& name, const vector<argument_type>& arguments_description);

    };

}