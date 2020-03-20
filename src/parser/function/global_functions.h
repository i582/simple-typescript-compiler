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
        function* get_function(const string& name, const vector<argument_type>& arguments_description);
        bool has_function(function* function);
        bool has_function(const string& name);

    private:
        void init();
    };

}