#pragma once

#include <iostream>
#include <chrono>
#include "../node/node.h"
#include "../function/global_functions.h"
#include "../array/array.h"

namespace compiler
{

    class assembler;

    using std::any_cast;

    class ast
    {
    private:
        vector<std::pair<node*, node*>> _stmts;

    private: // count blocks
        size_t _count_blocks;
        variable_table _all_variables;
        vector<variable_table*> _variables_tables;

        function_table _functions;

        global_functions _global_functions;

        vector<array> _arrays;

    public:
        node* _tree;

    public:
        ast();

    public:
        friend assembler;

    public:
        void print_variable_table();

    public:
        void mark_block();
        void mark_break_continue_operators();
        void mark_return_operator();


        // designate functions
        void designate_blocks();
        void designate_variables();
        void designate_functions();
        void designate_arrays();

        // check functions
        void check_const();
        void check_array();
        void check_functions_call();
        void check_expression();




    private:
        void mark_block_recursive(node* current_node);
        void mark_break_continue_operators_recursive(node* current_node, size_t current_block);
        void mark_return_operator_recursive(node* current_node, size_t current_block);



        // designate functions
        void designate_blocks_recursive(node* current_node, node* current_stmt);
        void designate_variables_recursive(node* node, variable_table* table);
        void designate_functions_recursive(node* node);
        static void designate_function_arguments_recursive(node* node, vector<variable_type>* arguments);
        void check_functions_call_recursive(node* node);
        void designate_function_call_arguments_recursive(node* node, vector<variable_type>* arguments);

        void check_expression_recursive(node* node);

        void designate_arrays_recursive(node* node);

        void calculate_array_initialize_list(node* node, size_t* count);
        void designate_array_initialize_list_recursive(node* node, vector<variable_value>& list, variable_type array_type);

        // check functions
        static void check_const_recursive(node* current_node, node* current_stmt);
        void check_array_recursive(node* current_node);
        void give_expression_type_recursive(node* current_node, variable_type& type);



        variable_type variable_type_of_node(node* current_node);


    private:
        void error(const string& message);

    public:
        void print(node* sub, size_t level);
    };

}