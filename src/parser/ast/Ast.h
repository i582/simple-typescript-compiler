#pragma once

#include <iostream>
#include <chrono>
#include "../node/Node.h"
#include "../function/GlobalFunctions.h"
#include "../array/Array.h"
#include "../class/class.h"
#include "../types/types.h"


namespace stc
{
    class Asm;

    using std::any_cast;


    class Ast
    {
    private:
        vector<std::pair<Node*, Node*>> m_allStatements;

    private: // count blocks
        size_t m_count_blocks;

        VariableTable m_all_variables;
        vector<Variable*> m_global_variables;
        vector<VariableTable*> m_variable_tables;

        FunctionTable m_functions;
        GlobalFunctions m_global_functions;

        vector<Array> m_arrays;



    public:
        Node* m_root;

    public:
        Ast();

    public:
        friend Asm;

    public:
        void print_variable_table();
        void print_functions_table();

    public:

        /**
         * @brief Функция задающая каждому блоку (statement) порядковый номер
         */
        void mark_block();

        /**
         * @brief Функция задающая операторам break и continue идентификатор родительского цикла (блока)
         */
        void mark_break_continue_operators();



        /**
         * @brief Функция задающая оператору return идентификатор родительской функции (блока),
         * а так же устанавливающая значение равное количеству байт, которое занимают аргументы функции
         */
        void mark_return_operator();




        // designate functions
        void designate_blocks();
        void designate_variables();
        void designate_global_variables();
        void designate_functions();
        void designate_arrays();


        // check functions
        void check_const();
        void check_array();
        void check_functions_call();
        void check_expression();




    private:
        void mark_block_recursive(Node* current_node);
        void mark_break_continue_operators_recursive(Node* current_node, size_t current_block);
        void mark_return_operator_recursive(Node* current_node, size_t current_block, const string& function_name);

        // designate functions
        void designate_blocks_recursive(Node* current_node, Node* current_stmt);
        void designate_variables_recursive(Node* node, VariableTable* table);
        void designate_global_variables_recursive(Node* current_node, vector<Variable*>& variables);
        void designate_functions_recursive(Node* current_node);
        void designate_function_arguments_recursive(Node* node, vector<VariableType>& argument_types, vector<Variable*>& arguments);
        void designate_function_local_variables_recursive(Node* current_node, size_t& size, vector<Variable*>& variables);


        void check_functions_call_recursive(Node* node);
        void designate_function_call_arguments_recursive(Node* node, vector<VariableType>* arguments);

        void check_expression_recursive(Node* node);

        void designate_arrays_recursive(Node* node);

        void calculate_array_initialize_list(Node* node, size_t* count);
        void designate_array_initialize_list_recursive(Node* node, vector<VariableValue>& list, VariableType array_type);

        // check functions
        static void check_const_recursive(Node* current_node, Node* current_stmt);
        void check_array_recursive(Node* current_node);
        void give_expression_type_recursive(Node* current_node, VariableType& type);



        VariableType variable_type_of_node(Node* current_node);

        Node* get_stmt_by_id(size_t stmt_id);

    private:
        void error(const string& message);
        void print(Node* sub, size_t level) const;

    public:
        void print() const noexcept;
    };

}