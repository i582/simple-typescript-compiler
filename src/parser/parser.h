#pragma once

#include "ast/ast.h"

namespace compiler
{

    class parser
    {
    private:
        lexer* _lex;
        ast* _tree;

    public:
        explicit parser(const string& file_path_);
        ~parser();

    public:
        node* parse();

    private:
        void error(const string& message);



    private: // grammar functions
        node* primary_expression();
        node* parenthesized_expression();
        node* postfix_expression();

        node* argument_expression_list();

        node* unary_expression();
        node* exponentiation_expression();
        node* multiplicative_expression();
        node* additive_expression();
        node* relational_expression();
        node* equality_expression();
        node* logical_and_expression();
        node* logical_or_expression();
        node* conditional_expression();
        node* assignment_expression();
        node* expression();
        node* constant_expression();


        node* statement();
        node* compound_statement();
        node* statement_list();
        node* expression_statement();
        node* selection_statement();
        node* iteration_statement();


        node* declaration_type();
        node* declaration_statement();


        node* initializer();
        node* initializer_list();


        node* function_argument();
        node* function_argument_list();
        node* function_statement();


        node* operator_statement();

    };


}