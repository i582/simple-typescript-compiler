#pragma once

#include <iostream>
#include <chrono>
#include "../node/node.h"


namespace compiler
{

    using std::any_cast;

    class ast
    {
    private:
        vector<std::pair<node*, node*>> _stmts;

    private: // count blocks
        size_t _count_blocks;
        variable_table _all_variables;
        vector<variable_table*> _variables_tables;

    public:
        node* _tree;

    public:
        ast();


    public:
        void mark_block();
        void mark_break_continue_operators();
        void mark_return_operator();


        void designate_blocks();
        void designate_variables();


        // check functions
        void check_const();
        void check_array();

    private:
        void mark_block_recursive(node* current_node);
        void mark_break_continue_operators_recursive(node* current_node, size_t current_block);
        void mark_return_operator_recursive(node* current_node, size_t current_block);
        void designate_blocks_recursive(node* current_node, node* current_stmt);
        void designate_variables_recursive(node* node, variable_table* table);


        // check functions
        static void check_const_recursive(node* current_node, node* current_stmt);
        void check_array_recursive(node* current_node);

    public:
        static void print(node* sub, size_t level);
    };

}