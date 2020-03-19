#pragma once

#include <any>
#include "../lexer/lexer.h"
#include "../variable/variable_table.h"

namespace compiler
{
    using std::any;
    using std::any_cast;

    enum class node_type
    {
        NON_TERMINAL_NAME,

        // variables
        VARIABLE_DECLARATION,
        USING_VARIABLE,
        VARIABLE_TYPE,

        // const
        CONSTANT_DECLARATION,
        USING_CONSTANT,
        NUMBER_CONST,
        BOOLEAN_CONST,
        STRING_CONST,

        // math
        ADD,
        SUB,
        MUL,
        DIV,

        EXPONENTIATION,

        BEFORE_INC,
        BEFORE_DEC,

        AFTER_INC,
        AFTER_DEC,

        UNARY_PLUS,
        UNARY_MINUS,
        UNARY_EXCLAMATION,

        // logical
        LOGICAL_AND,
        LOGICAL_OR,

        // setter
        SET,

        // relationship operators
        LESS, // <
        GREATER, // >
        EQUAL, // ==
        NOT_EQUAL, // !=
        LESS_EQUAL, // <=
        GREATER_EQUAL, // >=

        // cycles
        DO_WHILE,
        FOR,
        WHILE,
        // cycles addition
        BREAK,
        CONTINUE,

        // conditions
        IF,
        IF_ELSE,

        // index capture
        INDEX_CAPTURE,

        // function
        FUNCTION_CALL,
        FUNCTION_ARGS,
        FUNCTION_ARG,

        RETURN,

        // function implement
        FUNCTION_IMPLEMENTATION,
        FUNCTION_IMPLEMENTATION_ARG,
        FUNCTION_IMPLEMENTATION_ARGS,
        FUNCTION_IMPLEMENTATION_RETURN_TYPE,

        // expression
        EXPRESSION,
        CONST_EXPRESSION,

        STATEMENT,
        SEQ_STATEMENT,
        STATEMENT_LIST,


        INITIALIZER,
        INITIALIZER_LIST,

        // operator new
        NEW,

        PROGRAM
    };

    class node
    {
    public:
        any value;
        node_type type;

        node* operand1;
        node* operand2;
        node* operand3;
        node* operand4;

        variable_table* vars;


    private:
        size_t _statement_id;
        size_t _in_function_id;


    public:
        explicit node(node_type type_, const any& value_ = "", node* operand1_ = nullptr, node* operand2_ = nullptr,
                      node* operand3_ = nullptr, node* operand4_ = nullptr, variable_table* vars_ = nullptr);

    public:
        void statement_id(size_t statement_id);
        [[nodiscard]] size_t statement_id() const;

        [[nodiscard]] size_t in_function_id() const;
        void in_function_id(size_t in_function_id);

        static string node_type_to_string(node_type type);

        static bool is_comparison_operator(node_type type);
    };


}