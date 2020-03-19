#include "node.h"

compiler::node::node(compiler::node_type type_, const any& value_, compiler::node* operand1_,
                     compiler::node* operand2_, compiler::node* operand3_, compiler::node* operand4_,
                     variable_table* vars_)
{
    this->type = type_;
    this->value = value_;
    this->operand1 = operand1_;
    this->operand2 = operand2_;
    this->operand3 = operand3_;
    this->operand4 = operand4_;
    this->_statement_id = -1;
    this->vars = vars_;

    this->_in_function_id = -1;
}

void compiler::node::statement_id(size_t statement_id)
{
    _statement_id = statement_id;
}

size_t compiler::node::statement_id() const
{
    return _statement_id;
}

std::string compiler::node::node_type_to_string(compiler::node_type type)
{
    switch (type)
    {
        case node_type::VARIABLE_DECLARATION:
        {
            return "var decl";
        }
        case node_type::USING_VARIABLE:
        {
            return "var use";
        }
        case node_type::VARIABLE_TYPE:
        {
            return "var type";
        }
        case node_type::CONSTANT_DECLARATION:
        {
            return "const decl";
        }
        case node_type::USING_CONSTANT:
        {
            return "const use";
        }
        case node_type::NUMBER_CONST:
        {
            return "number const";
        }
        case node_type::BOOLEAN_CONST:
        {
            return "boolean const";
        }
        case node_type::ADD:
        {
            return "add (+)";
        }
        case node_type::SUB:
        {
            return "sub (-)";
        }
        case node_type::MUL:
        {
            return "mul (*)";
        }
        case node_type::DIV:
        {
            return "div (/)";
        }
        case node_type::LESS:
        {
            return "less (<)";
        }
        case node_type::GREATER:
        {
            return "greater (>)";
        }
        case node_type::EQUAL:
        {
            return "equal (==)";
        }
        case node_type::NOT_EQUAL:
        {
            return "not equal (!=)";
        }
        case node_type::LESS_EQUAL:
        {
            return "less equal (<=)";
        }
        case node_type::GREATER_EQUAL:
        {
            return "greater equal (>)";
        }
        case node_type::FOR:
        {
            return "for";
        }
        case node_type::WHILE:
        {
            return "while";
        }
        case node_type::BREAK:
        {
            return "break";
        }
        case node_type::CONTINUE:
        {
            return "continue";
        }
        case node_type::IF:
        {
            return "if";
        }
        case node_type::IF_ELSE:
        {
            return "if else";
        }
        case node_type::NON_TERMINAL_NAME:
        {
            return "non terminal name";
        }
        case node_type::BEFORE_INC:
        {
            return "postfix inc (a++)";
        }
        case node_type::BEFORE_DEC:
        {
            return "postfix dec (a--)";
        }
        case node_type::AFTER_INC:
        {
            return "prefix inc (++a)";
        }
        case node_type::AFTER_DEC:
        {
            return "prefix dec (--a)";
        }
        case node_type::UNARY_PLUS:
        {
            return "unary + (+a)";
        }
        case node_type::UNARY_MINUS:
        {
            return "unary - (-a)";
        }
        case node_type::UNARY_EXCLAMATION:
        {
            return "unary ! (!a)";
        }
        case node_type::LOGICAL_AND:
        {
            return "logic and (&&)";
        }
        case node_type::LOGICAL_OR:
        {
            return "logic or (||)";
        }
        case node_type::SET:
        {
            return "set";
        }
        case node_type::INDEX_CAPTURE:
        {
            return "index capture";
        }
        case node_type::FUNCTION_CALL:
        {
            return "function call";
        }
        case node_type::FUNCTION_ARG:
        {
            return "function arg";
        }
        case node_type::EXPRESSION:
        {
            return "expr";
        }
        case node_type::CONST_EXPRESSION:
        {
            return "const expr";
        }
        case node_type::STATEMENT:
        {
            return "stmt";
        }
        case node_type::SEQ_STATEMENT:
        {
            return "stmt seq";
        }
        case node_type::STATEMENT_LIST:
        {
            return "stmt list";
        }
        case node_type::PROGRAM:
        {
            return "program";
        }
        case node_type::DO_WHILE:
        {
            return " do (while)";
        }
        case node_type::INITIALIZER:
        {
            return "initializer";
        }
        case node_type::INITIALIZER_LIST:
        {
            return "initializer list";
        }
        case node_type::NEW:
        {
            return "new";
        }
        case node_type::FUNCTION_IMPLEMENTATION:
        {
            return "function impl";
        }
        case node_type::FUNCTION_IMPLEMENTATION_ARG:
        {
            return "function impl arg";
        }
        case node_type::FUNCTION_IMPLEMENTATION_RETURN_TYPE:
        {
            return "function impl return type";
        }
        case node_type::RETURN:
        {
            return "return";
        }
        case node_type::FUNCTION_IMPLEMENTATION_ARGS:
        {
            return "function impl args";
        }
        case node_type::FUNCTION_ARGS:
        {
            return "function args";
        }
        case node_type::STRING_CONST:
        {
            return "string const";
        }
        case node_type::EXPONENTIATION:
        {
            return "exponentiation (**)";
        }
    }
}

size_t compiler::node::in_function_id() const
{
    return _in_function_id;
}

void compiler::node::in_function_id(size_t in_function_id)
{
    _in_function_id = in_function_id;
}

bool compiler::node::is_comparison_operator(node_type type)
{
    return type == node_type::LESS ||
           type == node_type::GREATER ||
           type == node_type::LESS_EQUAL ||
           type == node_type::GREATER_EQUAL ||
           type == node_type::EQUAL ||
           type == node_type::NOT_EQUAL ||
           type == node_type::LOGICAL_AND ||
           type == node_type::LOGICAL_OR ||
           type == node_type::UNARY_EXCLAMATION;
}
