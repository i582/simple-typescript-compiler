#pragma once

#include <algorithm>
#include <vector>
#include "variable.h"

namespace compiler
{
    using std::vector;

    class variable_table
    {
    private:
        vector<variable*> _vars;
        variable_table* _parent;

    public:
        variable_table();
        ~variable_table();

    public:
        void add_variable(variable* new_var_);

        void set_parent(variable_table* parent_);

        bool has_variable(const string& name_);
        bool has_variable_or_has_in_parent(const string& name_);

        variable* get_variable_by_name(const string& name_);

        vector<variable*>& vars();

    public:
        void print();
    };

}