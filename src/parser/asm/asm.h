#pragma once
#include <iostream>
#include <string>
#include "../../lexer/token/Token.h"
#include "../node/Node.h"
#include "../ast/Ast.h"

#include "asm_constants.h"

namespace stc
{
    using std::to_string;
    using std::ofstream;

    enum class asm_place_for_writing
    {
        DATA,
        BEFORE_MAIN,
        FUNCTION_IMPLEMENTATIONS,
        MAIN
    };


    class Asm
    {
    private:
        ofstream m_file;
        Ast* m_ast;

        // blocks
        string m_data;
        string m_before_main;
        string m_function_implementations;
        string m_main;

        string* m_current_place_for_writing;

    private:
        size_t m_byte_on_stack;

    public:
        explicit Asm(const string& outputFilePath, Ast* tree);
        ~Asm();


    public:
        void generate();


    private:
        void blocks_to_asm();


        void init_local_variables();
        void init_global_variables();

        void init_function_arguments();

        void initGlobalFunctions();
        void init_string_constants();

        // global functions
        void init_input_function();
        void init_print_function();
        void init_println_function();
        void init_sqrt_function();



        void init_operands_for_division();

    private:

        void blocks_recursive(Node* current_node);
        void expression_recursive(Node* current_node);
        void relation_expression_recursive(Node* current_node);
        void function_implementation_recursive(Node* current_node);
        void init_string_constants_recursive(Node* current_node, size_t& count_constant);

        void init_arguments_on_stack_recursive(Node* current_node);
        void initGlobalFunctionsRecursive(Node* currentNode);



        void write(const string& text);

        void set_place_for_writing(asm_place_for_writing place);

        // generic functions
        static string offset(const string& value);
        string stack_var(const string& value);
        static string local_var(const string& value);
        static string global_var(const string& value);
        static string argument_var(const string& value);

        void raw(const string& value);



        void stack_variable(const Variable* var);
        void stack_argument(const Variable* var);

        void global_variable(const Variable* var);
        void global_array(const Array& arr);

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

        void procedure_prolog(size_t level, size_t size_local_variable);
        void procedure_epilogue();


        // fpu
        void finit();
        void fild(const string& value);
        void fdiv(const string& value1, const string& value2);
        void fist(const string& value);
        void fsqrt();



        void comment(const string& value);
    };

}