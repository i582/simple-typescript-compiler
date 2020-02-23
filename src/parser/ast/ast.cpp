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
            case node_type::USING_VARIABLE:
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
                try
                {
                    cout << std::any_cast<string>(sub->_value);
                }
                catch (...)
                {

                }

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
        return;


    if (current_node->_type == node_type::RETURN)
    {
        current_node->statement_id(current_block);
    }


    mark_return_operator_recursive(current_node->_operand1, current_block);
    mark_return_operator_recursive(current_node->_operand2, current_block);
    mark_return_operator_recursive(current_node->_operand3, current_block);
    mark_return_operator_recursive(current_node->_operand4, current_block);
}

void compiler::ast::designate_variables()
{
    _variables_tables.reserve(_stmts.size());

    for (auto& [parent_stmt, stmt] : _stmts)
    {
        auto new_variable_table = new variable_table();
        _variables_tables.push_back(new_variable_table);


        if (parent_stmt != nullptr)
        {
            new_variable_table->set_parent(parent_stmt->_vars);
        }


        stmt->_vars = new_variable_table;

        designate_variables_recursive(stmt->_operand1, new_variable_table);
    }
}

void compiler::ast::designate_variables_recursive(compiler::node* node, compiler::variable_table* table)
{
    if (node == nullptr)
        return;


    if (node->_type == node_type::STATEMENT ||
        node->_type == node_type::FUNCTION_IMPLEMENTATION)
        return;



    if (node->_type == node_type::VARIABLE_DECLARATION || node->_type == node_type::CONSTANT_DECLARATION)
    {
        auto variable_name = std::any_cast<string>(node->_value);


        if (table->has_variable_or_has_in_parent(variable_name))
        {
            cout << "ERROR: The variable '" << variable_name << "' has already been declared!" << endl;

            throw std::logic_error("");
        }

        bool is_const = false;

        if (node->_type == node_type::CONSTANT_DECLARATION)
        {
            is_const = true;
        }

        auto variable_type = std::any_cast<token_type>(node->_operand1->_value);

        auto new_variable = new variable
        (
            variable_name,
            variable::variable_type_from_token_type(variable_type),
            variable::default_value(variable::variable_type_from_token_type(variable_type)),
            is_const
        );

        table->add_variable(new_variable);

        _all_variables.add_variable(new_variable);
        return;
    }
    else if (node->_type == node_type::USING_VARIABLE)
    {
        auto variable_name = std::any_cast<string>(node->_value);

        if (!table->has_variable_or_has_in_parent(variable_name))
        {
            cout << "ERROR: The name '" << variable_name << "' is not declared in the current scope!" << endl;
            throw std::logic_error("");
        }
    }


    designate_variables_recursive(node->_operand1, table);
    designate_variables_recursive(node->_operand2, table);
    designate_variables_recursive(node->_operand3, table);
    designate_variables_recursive(node->_operand4, table);
}

void compiler::ast::check_const()
{
    for (auto& [parent_stmt, stmt] : _stmts)
    {
        check_const_recursive(stmt->_operand1, stmt);
    }
}

void compiler::ast::check_const_recursive(compiler::node* current_node, compiler::node* current_stmt)
{
    if (current_node == nullptr)
        return;

    if (current_node->_type == node_type::STATEMENT)
        return;

    if (current_node->_type == node_type::SET)
    {
        node* op1 = current_node->_operand1;
        node* op2 = current_node->_operand2;

        if (op1->_type == node_type::USING_VARIABLE)
        {
            auto variable_name = std::any_cast<string>(op1->_value);
            auto* variable = current_stmt->_vars->get_variable_by_name(variable_name);

            if (variable->is_const())
            {
                cout << "ERROR: Assignment to a constant '" << variable_name << "'!" << endl;
                throw std::logic_error("");
            }
        }
    }

    if (current_node->_type == node_type::EXPRESSION && current_node->_operand1 != nullptr &&
        current_node->_operand1->_type == node_type::CONSTANT_DECLARATION)
    {
        cout << "ERROR: The constant '" << std::any_cast<string>(current_node->_operand1->_value) <<
                "' must be initialized when defining!" << endl;

        throw std::logic_error("");
    }



    check_const_recursive(current_node->_operand1, current_stmt);
    check_const_recursive(current_node->_operand2, current_stmt);
    check_const_recursive(current_node->_operand3, current_stmt);
    check_const_recursive(current_node->_operand4, current_stmt);
}

void compiler::ast::check_array()
{
    for (auto& [parent_stmt, stmt] : _stmts)
    {
        check_array_recursive(stmt->_operand1);
    }
}

void compiler::ast::check_array_recursive(compiler::node* current_node)
{
    if (current_node == nullptr)
        return;

    if (current_node->_type == node_type::STATEMENT)
        return;


    if (current_node->_type == node_type::SET)
    {
        node* op1 = current_node->_operand1;
        node* op2 = current_node->_operand2;

        if (op1->_type == node_type::VARIABLE_DECLARATION)
        {
            auto op1_type = (int)any_cast<token_type>(op1->_operand1->_value);

            if (op1_type > (int)token_type::VOID)
            {
                bool is_initializer_list = op2->_type == node_type::INITIALIZER_LIST;
                bool is_operator_new_array = op2->_type == node_type::NEW &&
                                             any_cast<string>(op2->_operand1->_operand1->_value) == "Array";

                if (!is_initializer_list && !is_operator_new_array)
                {
                    cout << "Invalid assignment to '" << any_cast<string>(op1->_value) <<
                         "'! You can only assign a value of the form [...] or new Array(const_number) to an array!" << endl;
                    throw std::logic_error("");
                }
            }
        }

        if (op1->_type == node_type::USING_VARIABLE)
        {
            auto variable_name = any_cast<string>(op1->_value);
            auto variable = _all_variables.get_variable_by_name(variable_name);
            auto variable_type = variable->type();

            if (variable_type > variable_type::DOUBLE)
            {
                cout << "Explicit array assignment is prohibited!" << endl;
                throw std::logic_error("");
            }
        }
    }



    if (current_node->_type == node_type::EXPRESSION && current_node->_operand1 != nullptr &&
        current_node->_operand1->_type == node_type::VARIABLE_DECLARATION)
    {
        bool is_array = (int)any_cast<token_type>(current_node->_operand1->_operand1->_value) > (int)token_type::VOID;

        if (is_array)
        {
            cout << "ERROR: The array '" << any_cast<string>(current_node->_operand1->_value) <<
                 "' must be initialized when defining!" << endl;
            throw std::logic_error("");
        }
    }


    check_array_recursive(current_node->_operand1);
    check_array_recursive(current_node->_operand2);
    check_array_recursive(current_node->_operand3);
    check_array_recursive(current_node->_operand4);
}
