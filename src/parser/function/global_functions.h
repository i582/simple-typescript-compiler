#pragma once
#include "function_table.h"

namespace compiler
{

    class global_functions
    {
    private:
        function_table* _table;

    public:
        global_functions();
        ~global_functions();


    public:
        func* get_function(const string& name, const vector<argument_type>& arguments_description);
        bool has_function(func* function);

    private:
        void init();
    };

}