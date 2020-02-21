#include "ast.h"

compiler::ast::ast()
{

}

void compiler::ast::print(compiler::node* sub, size_t level)
{
    if (sub != nullptr)
    {
        for (size_t i = 0; i < level; i++) std::cout << "  ";

        switch (sub->_type)
        {
            case node_type::VARIABLE_DECLARATION:
            {
                cout << "new var ";
                cout << "" << std::any_cast<string>(sub->_value);
                break;
            }
            case node_type::USE_VAR:
            {
                cout << "use var ";
                cout << "" << std::any_cast<string>(sub->_value);
                break;
            }
            case node_type::VARIABLE_TYPE:
            {
                cout << "var type ";
                cout << "" << (int)std::any_cast<token_type>(sub->_value);
                break;
            }
            case node_type::CONSTANT_DECLARATION:
            {
                cout << "new const ";
                cout << "" << std::any_cast<string>(sub->_value);
                break;
            }
            case node_type::USE_CONST:
            {
                cout << "use const ";
                cout << "" << std::any_cast<string>(sub->_value);
                break;
            }
            case node_type::NUMBER_CONST:
            {
                cout << "number const ";
                cout << "" << std::any_cast<int>(sub->_value);
                break;
            }
            case node_type::BOOLEAN_CONST:
            {
                cout << "boolean const ";
                break;
            }
            case node_type::ADD:
            {
                cout << "add ";
                break;
            }
            case node_type::SUB:
            {
                cout << "sub ";
                break;
            }
            case node_type::MUL:
            {
                cout << "mul ";
                break;
            }
            case node_type::DIV:
            {
                cout << "div ";
                break;
            }
            case node_type::LESS:
            {
                cout << "less ";
                break;
            }
            case node_type::GREATER:
            {
                cout << "greater ";
                break;
            }
            case node_type::EQUAL:
            {
                cout << "equal ";
                break;
            }
            case node_type::NOT_EQUAL:
            {
                cout << "not equal ";
                break;
            }
            case node_type::LESS_EQUAL:
            {
                cout << "less equal ";
                break;
            }
            case node_type::GREATER_EQUAL:
            {
                cout << "greater equal ";
                break;
            }
            case node_type::FOR:
            {
                cout << "for ";
                break;
            }
            case node_type::WHILE:
            {
                cout << "while ";
                break;
            }
            case node_type::BREAK:
            {
                cout << "break ";
                break;
            }
            case node_type::CONTINUE:
            {
                cout << "continue ";
                break;
            }
            case node_type::IF:
            {
                cout << "if ";
                break;
            }
            case node_type::IF_ELSE:
            {
                cout << "if else ";
                break;
            }
            case node_type::NON_TERMINAL_NAME:
            {
                cout << "non terminal name ";

                cout << "" << std::any_cast<string>(sub->_value);
                break;
            }
            case node_type::BEFORE_INC:
            {
                cout << "before inc ";
                break;
            }
            case node_type::BEFORE_DEC:
            {
                cout << "before dec ";
                break;
            }
            case node_type::AFTER_INC:
            {
                cout << "after inc ";
                break;
            }
            case node_type::AFTER_DEC:
            {
                cout << "after dec ";
                break;
            }
            case node_type::UNARY_PLUS:
            {
                cout << "unary + ";
                break;
            }
            case node_type::UNARY_MINUS:
            {
                cout << "unary - ";
                break;
            }
            case node_type::UNARY_EXCLAMATION:
            {
                cout << "unary ! ";
                break;
            }
            case node_type::LOGICAL_AND:
            {
                cout << "AND ";
                break;
            }
            case node_type::LOGICAL_OR:
            {
                cout << "OR ";
                break;
            }
            case node_type::SET:
            {
                cout << "set ";
                break;
            }
            case node_type::INDEX_CAPTURE:
            {
                cout << "index capture ";
                break;
            }
            case node_type::FUNCTION_CALL:
            {
                cout << "function call ";
                break;
            }
            case node_type::FUNCTION_ARG:
            {
                cout << "function arg ";
                break;
            }
            case node_type::EXPRESSION:
            {
                cout << "expr ";
                break;
            }
            case node_type::CONST_EXPRESSION:
            {
                cout << "const expr ";
                break;
            }
            case node_type::STATEMENT:
            {
                cout << "stmt ";
                break;
            }
            case node_type::SEQ_STATEMENT:
            {
                cout << "seq ";
                break;
            }
            case node_type::STATEMENT_LIST:
            {
                cout << "statement list ";
                break;
            }
            case node_type::PROGRAM:
            {
                cout << "program ";
                break;
            }
            case node_type::DO_WHILE:
            {
                cout << "do (while) ";
                break;
            }
            case node_type::INITIALIZER:
            {
                cout << "initializer ";
                break;
            }
            case node_type::INITIALIZER_LIST:
            {
                cout << "initializer list ";
                break;
            }
            case node_type::NEW:
            {
                cout << "new ";
                break;
            }
        }

        //cout << "" << sub->_value << endl;



        cout << endl;

        print(sub->_operand1, level + 1);

        print(sub->_operand2, level + 1);
        print(sub->_operand3, level + 1);
        print(sub->_operand4, level + 1);
    }
}
