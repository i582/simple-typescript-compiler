#pragma once
#include "FunctionTable.h"

namespace stc
{

    class GlobalFunctions
    {
    private:
        FunctionTable* m_table;

    public:
        GlobalFunctions();
        ~GlobalFunctions();

    public:
        Function* get_function(const string& name, const vector<ArgumentType>& arguments_description);
        bool has_function(Function* function);
        bool has_function(const string& name);

    private:
        void init();
    };

}