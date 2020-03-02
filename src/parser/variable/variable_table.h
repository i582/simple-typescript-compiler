#pragma once

#include <algorithm>
#include <vector>
#include "variable.h"
#include "tuple"

namespace compiler
{
    using std::vector;
    using std::tuple;



    class variable_table
    {
    private:
        size_t _block_id;

        vector<variable*> _vars;
        variable_table* _parent;

    public:
        variable_table(size_t block_id);

        variable_table();
        ~variable_table();

    private:
        string generate_prefix();


    public:
        void add_variable(variable* new_var_);

        void set_parent(variable_table* parent_);

        bool has_variable(const string& name_);
        bool has_variable_or_has_in_parent(const string& name_);

        variable* get_variable_by_name(const string& name_);
        tuple<size_t, variable*> get_variable(const string& name);

        size_t block_id() const;

        vector<variable*>& vars();

        string generate_variable_with_prefix(const string& variable_name);

    public:
        void print();

    };

}