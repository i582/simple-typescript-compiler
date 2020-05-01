#pragma once

#include "Function.h"


namespace stc
{

    class FunctionTable
    {
    private:
        vector<Function*> m_functions;

    public:
        FunctionTable() = default;
        ~FunctionTable();

    public:
        void add_function(Function* new_function);
        bool has_function(Function* function);

        Function* get_function(const string& name, const vector<ArgumentType>& arguments_description);
        Function* get_function(const string& name);

        [[nodiscard]] const vector<Function*>& functions() const;

    public:
        void print() const;

    };

}