#include "ast.h"

compiler::ast::ast()
{
    this->_count_blocks = 1;
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
                cout << "" << std::any_cast<bool>(sub->_value);
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
                cout << "seq ";
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
            case node_type::FUNCTION_IMPLEMENTATION:
            {
                cout << "function impl ";
                cout << "" << std::any_cast<string>(sub->_value);
                break;
            }
            case node_type::FUNCTION_IMPLEMENTATION_ARG:
            {
                cout << "function impl arg ";
                break;
            }
            case node_type::FUNCTION_IMPLEMENTATION_RETURN_TYPE:
            {
                cout << "function impl return type ";
                cout << "" << (int)std::any_cast<token_type>(sub->_value);
                break;
            }
            case node_type::RETURN:
            {
                cout << "return ";
                break;
            }
        }

        if (sub->_statement_id != 4294967295)
        {
            cout << "\t\tstmt-id " << sub->_statement_id;
        }
        cout << endl;

        print(sub->_operand1, level + 1);
        print(sub->_operand2, level + 1);
        print(sub->_operand3, level + 1);
        print(sub->_operand4, level + 1);
    }
}

void compiler::ast::designate_blocks()
{
    designate_blocks_recursive(_tree->_operand1, nullptr);
    designate_blocks_recursive(_tree->_operand2, nullptr);
    designate_blocks_recursive(_tree->_operand3, nullptr);
    designate_blocks_recursive(_tree->_operand4, nullptr);
}

void compiler::ast::designate_blocks_recursive(node* current_node, node* current_stmt)
{
    if (current_node == nullptr)
        return;


    if (current_node->_type == node_type::STATEMENT)
    {
        _stmts.emplace_back(current_stmt, current_node);
        current_stmt = current_node;
    }

    designate_blocks_recursive(current_node->_operand1, current_stmt);
    designate_blocks_recursive(current_node->_operand2, current_stmt);
    designate_blocks_recursive(current_node->_operand3, current_stmt);
    designate_blocks_recursive(current_node->_operand4, current_stmt);
}

void compiler::ast::mark_block()
{
    mark_block_recursive(_tree->_operand1);
    mark_block_recursive(_tree->_operand2);
    mark_block_recursive(_tree->_operand3);
    mark_block_recursive(_tree->_operand4);
}

void compiler::ast::mark_block_recursive(node* current_node)
{
    if (current_node == nullptr)
        return;

    if (current_node->_type == node_type::STATEMENT)
    {
        if (current_node->_operand1->_type == node_type::IF ||
            current_node->_operand1->_type == node_type::IF_ELSE ||
            current_node->_operand1->_type == node_type::WHILE ||
            current_node->_operand1->_type == node_type::DO_WHILE ||
            current_node->_operand1->_type == node_type::FOR ||
            current_node->_operand1->_type == node_type::FUNCTION_IMPLEMENTATION)
        {
            current_node->statement_id(_count_blocks);
            ++_count_blocks;
        }
    }
    else if (current_node->_type == node_type::IF ||
        current_node->_type == node_type::IF_ELSE ||
        current_node->_type == node_type::WHILE ||
        current_node->_type == node_type::WHILE ||
        current_node->_type == node_type::DO_WHILE)
    {
        current_node->_operand2->statement_id(_count_blocks);
        ++_count_blocks;
    }
    else if (current_node->_type == node_type::FOR)
    {
        current_node->_operand4->statement_id(_count_blocks);
        ++_count_blocks;
    }
    else if (current_node->_type == node_type::FUNCTION_IMPLEMENTATION)
    {
        current_node->_operand3->statement_id(_count_blocks);
        ++_count_blocks;
    }



    mark_block_recursive(current_node->_operand1);
    mark_block_recursive(current_node->_operand2);
    mark_block_recursive(current_node->_operand3);
    mark_block_recursive(current_node->_operand4);
}

void compiler::ast::mark_break_continue_operators()
{
    for (auto& [parent_stmt, stmt] : _stmts)
    {
        if (stmt->_operand1 != nullptr &&
           (stmt->_operand1->_type == node_type::FOR ||
            stmt->_operand1->_type == node_type::WHILE ||
            stmt->_operand1->_type == node_type::DO_WHILE))
        {
            mark_break_continue_operators_recursive(stmt->_operand1->_operand1, stmt->statement_id());
            mark_break_continue_operators_recursive(stmt->_operand1->_operand2, stmt->statement_id());
            mark_break_continue_operators_recursive(stmt->_operand1->_operand3, stmt->statement_id());
            mark_break_continue_operators_recursive(stmt->_operand1->_operand4, stmt->statement_id());
        }
    }
}

void compiler::ast::mark_break_continue_operators_recursive(compiler::node* current_node, size_t current_block)
{
    if (current_node == nullptr)
        return;


    // if there is another cycle in the cycle, then you do not need to enter it
    if (current_node->_type == node_type::FOR ||
        current_node->_type == node_type::WHILE ||
        current_node->_type == node_type::DO_WHILE)
    {
        return;
    }



    if (current_node->_type == node_type::BREAK ||
        current_node->_type == node_type::CONTINUE)
    {
        current_node->statement_id(current_block);
    }


    mark_break_continue_operators_recursive(current_node->_operand1, current_block);
    mark_break_continue_operators_recursive(current_node->_operand2, current_block);
    mark_break_continue_operators_recursive(current_node->_operand3, current_block);
    mark_break_continue_operators_recursive(current_node->_operand4, current_block);
}

void compiler::ast::mark_return_operator()
{
    for (auto& [parent_stmt, stmt] : _stmts)
    {
        if (stmt->_operand1 != nullptr &&
            stmt->_operand1->_type == node_type::FUNCTION_IMPLEMENTATION)
        {
            mark_return_operator_recursive(stmt->_operand1->_operand3, stmt->statement_id());
        }
    }
}

void compiler::ast::mark_return_operator_recursive(compiler::node* current_node, size_t current_block)
{
    if (current_node == nullptr)
        return;


    if (current_node->_type == node_type::FUNCTION_IMPLEMENTATION)
    {
        return;
    }



    if (current_node->_type == node_type::RETURN)
    {
        current_node->statement_id(current_block);
    }


    mark_return_operator_recursive(current_node->_operand1, current_block);
    mark_return_operator_recursive(current_node->_operand2, current_block);
    mark_return_operator_recursive(current_node->_operand3, current_block);
    mark_return_operator_recursive(current_node->_operand4, current_block);
}
