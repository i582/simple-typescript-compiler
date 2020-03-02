#include "ast.h"

compiler::ast::ast()
{
    this->_count_blocks = 1;
}

void compiler::ast::print(compiler::node* sub, size_t level)
{
    if (sub != nullptr)
    {
        for (size_t i = 0; i < level; i++) cout << "  ";


        switch (sub->type)
        {
            case node_type::VARIABLE_DECLARATION:
            {
                cout << "new var ";
                cout << "" << std::any_cast<string>(sub->value);
                break;
            }
            case node_type::USING_VARIABLE:
            {
                cout << "use var ";
                auto variable_block_id = sub->statement_id();
                auto variable_name = any_cast<string>(sub->value);

                cout << "" << variable_name;
                cout << " (block_id: "  << variable_block_id << ")";
                break;
            }
            case node_type::VARIABLE_TYPE:
            {
                cout << "var type ";
                cout << "" << (int)std::any_cast<token_type>(sub->value);
                break;
            }
            case node_type::CONSTANT_DECLARATION:
            {
                cout << "new const ";
                cout << "" << std::any_cast<string>(sub->value);
                break;
            }
            case node_type::USING_CONSTANT:
            {
                cout << "use const ";
                cout << "" << std::any_cast<string>(sub->value);
                break;
            }
            case node_type::NUMBER_CONST:
            {
                cout << "number const ";
                cout << "" << std::any_cast<long double>(sub->value);
                break;
            }
            case node_type::BOOLEAN_CONST:
            {
                cout << "boolean const ";
                cout << "" << std::any_cast<bool>(sub->value);
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
            case node_type::EXPONENTIATION:
            {
                cout << "exponentiation (**)";
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

                cout << "" << std::any_cast<string>(sub->value);
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
                cout << std::any_cast<string>(sub->value);
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
                cout << "prog ";
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
                cout << "" << std::any_cast<string>(sub->value);
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
                cout << "" << (int)std::any_cast<token_type>(sub->value);
                break;
            }
            case node_type::RETURN:
            {
                cout << "return ";
                break;
            }
            case node_type::FUNCTION_IMPLEMENTATION_ARGS:
            {
                cout << "function impl args ";
                break;
            }
            case node_type::FUNCTION_ARGS:
            {
                cout << "function args ";
                break;
            }
            case node_type::STRING_CONST:
            {
                cout << "string const ";
                cout << "" << std::any_cast<string>(sub->value);
                break;
            }
        }

        if (sub->statement_id() != 4294967295)
        {
            cout << "\t\tstmt-id " << sub->statement_id();
        }
        cout << endl;

        print(sub->operand1, level + 1);
        print(sub->operand2, level + 1);
        print(sub->operand3, level + 1);
        print(sub->operand4, level + 1);
    }
}

void compiler::ast::designate_blocks()
{
    designate_blocks_recursive(_tree->operand1, nullptr);
    designate_blocks_recursive(_tree->operand2, nullptr);
    designate_blocks_recursive(_tree->operand3, nullptr);
    designate_blocks_recursive(_tree->operand4, nullptr);
}

void compiler::ast::designate_blocks_recursive(node* current_node, node* current_stmt)
{
    if (current_node == nullptr)
        return;


    if (current_node->type == node_type::STATEMENT)
    {
        _stmts.emplace_back(current_stmt, current_node);
        current_stmt = current_node;
    }

    designate_blocks_recursive(current_node->operand1, current_stmt);
    designate_blocks_recursive(current_node->operand2, current_stmt);
    designate_blocks_recursive(current_node->operand3, current_stmt);
    designate_blocks_recursive(current_node->operand4, current_stmt);
}

void compiler::ast::mark_block()
{
    mark_block_recursive(_tree->operand1);
    mark_block_recursive(_tree->operand2);
    mark_block_recursive(_tree->operand3);
    mark_block_recursive(_tree->operand4);
}

void compiler::ast::mark_block_recursive(node* current_node)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::STATEMENT)
    {
//        if (current_node->operand1->type == node_type::IF ||
//            current_node->operand1->type == node_type::IF_ELSE ||
//            current_node->operand1->type == node_type::WHILE ||
//            current_node->operand1->type == node_type::DO_WHILE ||
//            current_node->operand1->type == node_type::FOR ||
//            current_node->operand1->type == node_type::FUNCTION_IMPLEMENTATION)
//        {
            current_node->statement_id(_count_blocks);
            ++_count_blocks;
//        }
    }
    else if (current_node->type == node_type::IF ||
             current_node->type == node_type::IF_ELSE ||
             current_node->type == node_type::WHILE ||
             current_node->type == node_type::WHILE ||
             current_node->type == node_type::DO_WHILE)
    {


        current_node->operand2->statement_id(_count_blocks);
        ++_count_blocks;
    }
    else if (current_node->type == node_type::FOR)
    {
        current_node->operand4->statement_id(_count_blocks);
        ++_count_blocks;
    }
    else if (current_node->type == node_type::FUNCTION_IMPLEMENTATION)
    {
        current_node->operand3->statement_id(_count_blocks);
        ++_count_blocks;
    }



    mark_block_recursive(current_node->operand1);
    mark_block_recursive(current_node->operand2);
    mark_block_recursive(current_node->operand3);
    mark_block_recursive(current_node->operand4);
}

void compiler::ast::mark_break_continue_operators()
{
    for (auto& [parent_stmt, stmt] : _stmts)
    {
        if (stmt->operand1 != nullptr &&
            (stmt->operand1->type == node_type::FOR ||
             stmt->operand1->type == node_type::WHILE ||
             stmt->operand1->type == node_type::DO_WHILE))
        {
            mark_break_continue_operators_recursive(stmt->operand1->operand1, stmt->statement_id());
            mark_break_continue_operators_recursive(stmt->operand1->operand2, stmt->statement_id());
            mark_break_continue_operators_recursive(stmt->operand1->operand3, stmt->statement_id());
            mark_break_continue_operators_recursive(stmt->operand1->operand4, stmt->statement_id());
        }
    }
}

void compiler::ast::mark_break_continue_operators_recursive(compiler::node* current_node, size_t current_block)
{
    if (current_node == nullptr)
        return;


    // if there is another cycle in the cycle, then you do not need to enter it
    if (current_node->type == node_type::FOR ||
        current_node->type == node_type::WHILE ||
        current_node->type == node_type::DO_WHILE)
    {
        return;
    }



    if (current_node->type == node_type::BREAK ||
        current_node->type == node_type::CONTINUE)
    {
        current_node->statement_id(current_block);
    }


    mark_break_continue_operators_recursive(current_node->operand1, current_block);
    mark_break_continue_operators_recursive(current_node->operand2, current_block);
    mark_break_continue_operators_recursive(current_node->operand3, current_block);
    mark_break_continue_operators_recursive(current_node->operand4, current_block);
}

void compiler::ast::mark_return_operator()
{
    for (auto& [parent_stmt, stmt] : _stmts)
    {
        if (stmt->operand1 != nullptr &&
            stmt->operand1->type == node_type::FUNCTION_IMPLEMENTATION)
        {
            mark_return_operator_recursive(stmt->operand1->operand3, stmt->statement_id());
        }
    }
}

void compiler::ast::mark_return_operator_recursive(compiler::node* current_node, size_t current_block)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::FUNCTION_IMPLEMENTATION)
        return;


    if (current_node->type == node_type::RETURN)
    {
        current_node->statement_id(current_block);
    }


    mark_return_operator_recursive(current_node->operand1, current_block);
    mark_return_operator_recursive(current_node->operand2, current_block);
    mark_return_operator_recursive(current_node->operand3, current_block);
    mark_return_operator_recursive(current_node->operand4, current_block);
}

void compiler::ast::designate_variables()
{
    _variables_tables.reserve(_stmts.size());

    for (auto& [parent_stmt, stmt] : _stmts)
    {
        size_t stmt_id = stmt->statement_id();
        auto new_variable_table = new variable_table(stmt_id);
        _variables_tables.push_back(new_variable_table);


        if (parent_stmt != nullptr)
        {
            new_variable_table->set_parent(parent_stmt->vars);
        }


        stmt->vars = new_variable_table;

        designate_variables_recursive(stmt->operand1, new_variable_table);
    }
}

void compiler::ast::designate_variables_recursive(compiler::node* node, compiler::variable_table* table)
{
    if (node == nullptr)
        return;


    if (node->type == node_type::STATEMENT ||
        node->type == node_type::FUNCTION_IMPLEMENTATION)
        return;



    if (node->type == node_type::VARIABLE_DECLARATION || node->type == node_type::CONSTANT_DECLARATION)
    {
        auto variable_name = std::any_cast<string>(node->value);


        if (table->has_variable(variable_name))
        {
            cout << "ERROR: The variable '" << variable_name << "' has already been declared!" << endl;

            throw std::logic_error("");
        }

        bool is_const = false;

        if (node->type == node_type::CONSTANT_DECLARATION)
        {
            is_const = true;
        }

        auto variable_type = std::any_cast<token_type>(node->operand1->value);

        auto variable_value = variable::default_value(variable::variable_type_from_token_type(variable_type));

        auto new_variable = new variable
        (
            variable_name,
            variable::variable_type_from_token_type(variable_type),
            variable_value,
            is_const
        );

        new_variable->block_id(table->block_id());

        table->add_variable(new_variable);
        _all_variables.add_variable(new_variable);

        return;
    }
    else if (node->type == node_type::USING_VARIABLE)
    {
        auto variable_name = std::any_cast<string>(node->value);


        if (!table->has_variable_or_has_in_parent(variable_name))
        {
            cout << "ERROR: The name '" << variable_name << "' is not declared in the current scope!" << endl;
            throw std::logic_error("");
        }


        auto [block_id, variable] = table->get_variable(variable_name);

        node->statement_id(block_id);
        variable->block_id(block_id);
    }


    designate_variables_recursive(node->operand1, table);
    designate_variables_recursive(node->operand2, table);
    designate_variables_recursive(node->operand3, table);
    designate_variables_recursive(node->operand4, table);
}

void compiler::ast::check_const()
{
    for (auto& [parent_stmt, stmt] : _stmts)
    {
        check_const_recursive(stmt->operand1, stmt);
    }
}

void compiler::ast::check_const_recursive(compiler::node* current_node, compiler::node* current_stmt)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::STATEMENT)
        return;

    if (current_node->type == node_type::SET)
    {
        node* op1 = current_node->operand1;
        node* op2 = current_node->operand2;

        if (op1->type == node_type::USING_VARIABLE)
        {
            auto variable_name = std::any_cast<string>(op1->value);
            auto* variable = current_stmt->vars->get_variable_by_name(variable_name);

            if (variable->is_const())
            {
                cout << "ERROR: Assignment to a constant '" << variable_name << "'!" << endl;
                throw std::logic_error("");
            }
        }
    }

    if (current_node->type == node_type::EXPRESSION && current_node->operand1 != nullptr &&
        current_node->operand1->type == node_type::CONSTANT_DECLARATION)
    {
        cout << "ERROR: The constant '" << std::any_cast<string>(current_node->operand1->value) <<
             "' must be initialized when defining!" << endl;

        throw std::logic_error("");
    }



    check_const_recursive(current_node->operand1, current_stmt);
    check_const_recursive(current_node->operand2, current_stmt);
    check_const_recursive(current_node->operand3, current_stmt);
    check_const_recursive(current_node->operand4, current_stmt);
}

void compiler::ast::check_array()
{
    for (auto& [parent_stmt, stmt] : _stmts)
    {
        check_array_recursive(stmt->operand1);
    }
}

void compiler::ast::check_array_recursive(compiler::node* current_node)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::STATEMENT)
        return;


    if (current_node->type == node_type::SET)
    {
        node* op1 = current_node->operand1;
        node* op2 = current_node->operand2;

        if (op1->type == node_type::VARIABLE_DECLARATION)
        {
            auto op1_type = (int)any_cast<token_type>(op1->operand1->value);

            if (op1_type > (int)token_type::VOID)
            {
                bool is_initializer_list = op2->type == node_type::INITIALIZER;
                bool is_operator_new_array = op2->type == node_type::NEW &&
                                             any_cast<string>(op2->operand1->value) == "Array";

                if (!is_initializer_list && !is_operator_new_array)
                {
                    cout << "Invalid assignment to '" << any_cast<string>(op1->value) <<
                         "'! You can only assign a value of the form [...] or new Array(const_number) to an array!" << endl;
                   throw std::logic_error("");
                }
            }
        }

        if (op1->type == node_type::USING_VARIABLE)
        {
            auto variable_name = any_cast<string>(op1->value);
            auto variable = _all_variables.get_variable_by_name(variable_name);
            auto variable_type = variable->type();

            if (variable_type >= variable_type::NUMBER_ARRAY)
            {
                cout << "Explicit array assignment is prohibited!" << endl;
                throw std::logic_error("");
            }
        }
    }



    if (current_node->type == node_type::EXPRESSION && current_node->operand1 != nullptr &&
        current_node->operand1->type == node_type::VARIABLE_DECLARATION)
    {
        bool is_array = (int)any_cast<token_type>(current_node->operand1->operand1->value) > (int)token_type::VOID;

        if (is_array)
        {
            cout << "ERROR: The array '" << any_cast<string>(current_node->operand1->value) <<
                 "' must be initialized when defining!" << endl;
            throw std::logic_error("");
        }
    }


    check_array_recursive(current_node->operand1);
    check_array_recursive(current_node->operand2);
    check_array_recursive(current_node->operand3);
    check_array_recursive(current_node->operand4);
}

void compiler::ast::designate_functions()
{
    designate_functions_recursive(_stmts[0].second->operand1);
}

void compiler::ast::designate_functions_recursive(compiler::node* node_)
{
    if (node_ == nullptr)
        return;


    if (node_->type == node_type::FUNCTION_IMPLEMENTATION)
    {
        auto function_name = any_cast<string>(node_->value);
        auto type = (int)any_cast<token_type>(node_->operand1->value);


        vector<variable_type> arguments;

        designate_function_arguments_recursive(node_->operand2, &arguments);

        auto temp_func = new func(function_name, static_cast<return_type>(type), arguments);

        _functions.add_function(temp_func);
    }

    designate_functions_recursive(node_->operand1);
    designate_functions_recursive(node_->operand2);
}

void compiler::ast::designate_function_arguments_recursive(compiler::node* node, vector<variable_type>* arguments)
{
    if (node == nullptr)
        return;


    if (node->type == node_type::FUNCTION_IMPLEMENTATION_ARG)
    {
        auto type = (argument_type)any_cast<token_type>(node->operand1->value);
        arguments->push_back(type);
    }

    designate_function_arguments_recursive(node->operand1, arguments);
    designate_function_arguments_recursive(node->operand2, arguments);
}

void compiler::ast::check_functions_call()
{
    check_functions_call_recursive(_tree);
}

void compiler::ast::check_functions_call_recursive(compiler::node* node)
{
    if (node == nullptr)
        return;


    if (node->type == node_type::FUNCTION_CALL)
    {
        auto function_name = any_cast<string>(node->value);
        vector<variable_type> types;

        designate_function_call_arguments_recursive(node, &types);

        if (!_global_functions.has_function(new func(function_name, variable_type::ANY, types)))
        {
            _functions.get_function(function_name, types);
        }
    }

    check_functions_call_recursive(node->operand1);
    check_functions_call_recursive(node->operand2);
    check_functions_call_recursive(node->operand3);
    check_functions_call_recursive(node->operand4);
}

void compiler::ast::designate_function_call_arguments_recursive(compiler::node* node,
                                                                std::vector<compiler::variable_type>* arguments)
{
    if (node == nullptr)
        return;


    if (node->type == node_type::FUNCTION_ARGS)
    {
        variable_type type;

        if (node->operand1->type == node_type::NUMBER_CONST)
        {
            type = variable_type::NUMBER;
        }
        else if (node->operand1->type == node_type::BOOLEAN_CONST)
        {
            type = variable_type::BOOLEAN;
        }
        else if (node->operand1->type == node_type::STRING_CONST)
        {
            type = variable_type::STRING;
        }
        else
        {
            auto variable_name = any_cast<string>(node->operand1->value);
            variable* var = _all_variables.get_variable_by_name(variable_name);

            type = var->type();
        }


        arguments->push_back(type);
    }

    designate_function_call_arguments_recursive(node->operand1, arguments);
    designate_function_call_arguments_recursive(node->operand2, arguments);
}

void compiler::ast::give_expression_type_recursive(compiler::node* current_node, variable_type& type)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::ADD ||
        current_node->type == node_type::SUB ||
        current_node->type == node_type::MUL ||
        current_node->type == node_type::DIV)
    {
        auto op1 = current_node->operand1;
        auto op2 = current_node->operand2;

        variable_type op1_type = variable_type::UNDEFINED;
        variable_type op2_type = variable_type::UNDEFINED;

        give_expression_type_recursive(op1, op1_type);
        give_expression_type_recursive(op2, op2_type);

        auto is_reducible = variable::is_types_reducible(op1_type, op2_type);

        if (!is_reducible)
        {
            string op1_type_str = variable::variable_type_to_string(op1_type);
            string op2_type_str = variable::variable_type_to_string(op2_type);

            string action = node::node_type_to_string(current_node->type);

            error("Operator " + action + " cannot be applied to types '" + op1_type_str + "' and '" + op2_type_str + "'.");
        }

        type = op1_type;
    }
    else if (current_node->type == node_type::UNARY_EXCLAMATION)
    {
        auto op1 = current_node->operand1;

        variable_type op1_type = variable_type::UNDEFINED;
        give_expression_type_recursive(op1, op1_type);

        type = variable_type::BOOLEAN;
    }
    else if (current_node->type == node_type::UNARY_MINUS ||
             current_node->type == node_type::UNARY_PLUS)
    {
        auto op1 = current_node->operand1;

        variable_type op1_type = variable_type::UNDEFINED;
        give_expression_type_recursive(op1, op1_type);

        type = variable_type::BOOLEAN;
    }
    else if (current_node->type == node_type::EXPONENTIATION)
    {
        auto op1 = current_node->operand1;

        variable_type op1_type = variable_type::UNDEFINED;
        give_expression_type_recursive(op1, op1_type);

        type = op1_type;
    }
    else if (current_node->type == node_type::USING_VARIABLE ||
             current_node->type == node_type::NUMBER_CONST ||
             current_node->type == node_type::BOOLEAN_CONST ||
             current_node->type == node_type::STRING_CONST)
    {
        type = variable_type_of_node(current_node);
    }
    else if (current_node->type == node_type::FUNCTION_CALL)
    {
        auto function_name = any_cast<string>(current_node->value);
        vector<variable_type> types;

        designate_function_call_arguments_recursive(current_node, &types);

        func* function = nullptr;

        if (!_global_functions.has_function(new func(function_name, variable_type::UNDEFINED, types)))
        {
            function = _functions.get_function(function_name, types);
        }
        else
        {
            function = _global_functions.get_function(function_name, types);
        }

        type = function->return_type();
        return;
    }
    else if (current_node->type == node_type::NEW)
    {
        current_node = current_node->operand1;

        auto function_name = any_cast<string>(current_node->value);
        vector<variable_type> types;

        designate_function_call_arguments_recursive(current_node, &types);

        func* function = nullptr;

        if (!_global_functions.has_function(new func(function_name, variable_type::ANY, types)))
        {
            function = _functions.get_function(function_name, types);
        }
        else
        {
            function = _global_functions.get_function(function_name, types);
        }

        type = function->return_type();
        return;
    }
    else if (current_node->type == node_type::INITIALIZER)
    {
        type = variable_type::ANY;
        return;
    }


    give_expression_type_recursive(current_node->operand1, type);
    give_expression_type_recursive(current_node->operand2, type);
    give_expression_type_recursive(current_node->operand3, type);
    give_expression_type_recursive(current_node->operand4, type);
}

void compiler::ast::error(const string& message)
{
    cout << "Semantic error! " << message << endl;
    throw std::logic_error(message);
}


compiler::variable_type compiler::ast::variable_type_of_node(compiler::node* current_node)
{
    if (current_node->type == node_type::NUMBER_CONST)
    {
        return variable_type::NUMBER;
    }
    else if (current_node->type == node_type::BOOLEAN_CONST)
    {
        return variable_type::BOOLEAN;
    }
    else if (current_node->type == node_type::STRING_CONST)
    {
        return variable_type::STRING;
    }
    else if (current_node->type == node_type::USING_VARIABLE)
    {
        auto variable_name = any_cast<string>(current_node->value);
        variable* var = _all_variables.get_variable_by_name(variable_name);

        return var->type();
    }

    return variable_type::VOID;
}

void compiler::ast::check_expression()
{
    check_expression_recursive(_tree);
}

void compiler::ast::check_expression_recursive(compiler::node* node)
{
    if (node == nullptr)
        return;


    if (node->type == node_type::EXPRESSION)
    {
        if (node->operand1 != nullptr && node->operand1->type == node_type::SET)
        {
            auto lvalue = node->operand1->operand1;
            if (lvalue->type != node_type::USING_VARIABLE &&
                lvalue->type != node_type::VARIABLE_DECLARATION &&
                lvalue->type != node_type::CONSTANT_DECLARATION)
            {
                error("Invalid assignment!");
            }

            variable_type lvalue_type = variable_type::UNDEFINED;

            if (lvalue->type == node_type::USING_VARIABLE ||
                lvalue->type == node_type::USING_CONSTANT)
            {
                auto variable_name = any_cast<string>(lvalue->value);
                variable* var = _all_variables.get_variable_by_name(variable_name);

                lvalue_type = var->type();
            }
            else if (lvalue->type == node_type::VARIABLE_DECLARATION ||
                     lvalue->type == node_type::CONSTANT_DECLARATION)
            {
                lvalue_type = (variable_type)any_cast<token_type>(lvalue->operand1->value);
            }


            auto start_node = node->operand1->operand2;
            variable_type expression_type;
            give_expression_type_recursive(start_node, expression_type);

            if (!variable::is_types_reducible(lvalue_type, expression_type))
            {
                string lvalue_type_str = variable::variable_type_to_string(lvalue_type);
                string expression_type_str = variable::variable_type_to_string(expression_type);

                error("Cannot assign a variable of type '" + lvalue_type_str + "' to '" + expression_type_str + "'!");
            }
        }


    }


    check_expression_recursive(node->operand1);
    check_expression_recursive(node->operand2);
    check_expression_recursive(node->operand3);
    check_expression_recursive(node->operand4);
}

void compiler::ast::print_variable_table()
{
    cout << "\n";
    cout << "Variable table\n";
    _all_variables.print();
    cout << "\n";
}

void compiler::ast::designate_arrays()
{
    designate_arrays_recursive(_tree);
}

void compiler::ast::designate_arrays_recursive(compiler::node* node)
{
    if (node == nullptr)
        return;


    if (node->type == node_type::SET &&
        node->operand1 != nullptr &&
        node->operand2 != nullptr)
    {
        if (node->operand1->type == node_type::VARIABLE_DECLARATION)
        {
            auto array_node = node->operand1;
            auto array_type_node = array_node->operand1;
            auto array_type = (variable_type) any_cast<token_type>(array_type_node->value);

            auto initializer_node = node->operand2;

            if (variable::is_array_type(array_type))
            {
                if (initializer_node->type == node_type::INITIALIZER)
                {
                    auto array_name = any_cast<string>(array_node->value);
                    size_t temp_array_size;
                    temp_array_size = 0;

                    calculate_array_initialize_list(initializer_node, &temp_array_size);

                    _arrays.emplace_back(array_name, temp_array_size);
                }
                else if (initializer_node->type == node_type::NEW)
                {
                    auto calling_function_node = initializer_node->operand1;
                    auto calling_function_name = any_cast<string>(calling_function_node->value);
                    if (calling_function_name == "Array")
                    {
                        auto array_name = any_cast<string>(array_node->value);
                        auto temp_array_size = (size_t)any_cast<number>(calling_function_node->operand1->operand1->value);

                        _arrays.emplace_back(array_name, temp_array_size);
                    }
                }
            }
        }

    }


    designate_arrays_recursive(node->operand1);
    designate_arrays_recursive(node->operand2);
    designate_arrays_recursive(node->operand3);
    designate_arrays_recursive(node->operand4);
}

void compiler::ast::calculate_array_initialize_list(compiler::node* node, size_t* count)
{
    if (node == nullptr)
        return;

    if (node->type == node_type::INITIALIZER_LIST)
    {
        ++(*count);
    }

    calculate_array_initialize_list(node->operand1, count);
    calculate_array_initialize_list(node->operand2, count);
    calculate_array_initialize_list(node->operand3, count);
}
