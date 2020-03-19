#pragma once
#include <iostream>
#include <string>
#include "../../lexer/token/token.h"
#include "../node/node.h"
#include "../ast/ast.h"

#include "asm_constants.h"

namespace compiler
{
    using std::to_string;

    enum class asm_place_for_writing
    {
        DATA,
        BEFORE_MAIN,
        FUNCTION_IMLEMENTATIONS,
        MAIN
    };


    class generic_asm
    {
    private:
        std::ofstream _file;
        ast* _ast;

        // blocks
        string _data;
        string _before_main;
        string _function_implementations;
        string _main;

        string* _current_place_for_writing;

    private:
        size_t _byte_on_stack;

    public:
        explicit generic_asm(const string& file_name, ast* tree);
        ~generic_asm();


    public:
        void generate();


    private:
        void blocks_to_asm();


        void init_variables();
        void init_global_functions();
        void init_string_constants();

        // global functions
        void init_input_function();
        void init_print_function();
        void init_println_function();
        void init_sqrt_function();



        void init_operands_for_division();

    private:

        void blocks_recursive(node* current_node);
        void expression_recursive(node* current_node);
        void relation_expression_recursive(node* current_node);
        void function_implementation_recursive(node* current_node);
        void function_implementation_args_recursive(node* current_node, size_t& stack_shift);

        void init_string_constants_recursive(node* current_node, size_t& count_constant);

        void init_arguments_on_stack_recursive(node* current_node);
        void init_global_functions_recursive(node* current_node);



        void write(const string& text);

        void set_place_for_writing(asm_place_for_writing place);

        // generic functions
        string offset(const string& value);
        string stack_var(const string& value);
        string local_var(const string& value);

        void raw(const string& value);

        void stack_variable(const string& name);
        void local_variable(const variable* var);
        void local_array(const array& arr);

        // stack
        void push(const string& value);
        void pop(const string& value);


        // arithmetic operations
        void add(const string& value1, const string& value2);
        void sub(const string& value1, const string& value2);
        void imul(const string& value1, const string& value2);


        // general
        void mov(const string& value1, const string& value2);


        // logical
        void logical_or(const string& value1, const string& value2);
        void logical_and(const string& value1, const string& value2);
        void logical_xor(const string& value1, const string& value2);


        // comparisons
        void cmp(const string& value1, const string& value2);

        void jmp(const string& value);
        void je(const string& value);
        void jne(const string& value);
        void jl(const string& value);
        void jle(const string& value);
        void jg(const string& value);
        void jge(const string& value);

        void label(const string& value);


        // functions
        void call(const string& value);
        void ret(const string& value = "");

        void proc(const string& value);
        void endp(const string& value);

        void procedure_prolog();
        void procedure_epilogue();


        // fpu
        void finit();
        void fild(const string& value);
        void fdiv(const string& value1, const string& value2);
        void fist(const string& value);
        void fsqrt();

    };

}