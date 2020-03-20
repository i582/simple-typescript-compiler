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

                auto variable_block_id = sub->statement_id();
                cout << " (current block id: "  << variable_block_id << ")";
                break;
            }
            case node_type::USING_VARIABLE:
            {
                cout << "use var ";
                auto variable_block_id = sub->statement_id();
                auto variable_name = any_cast<string>(sub->value);

                cout << "" << variable_name;
                cout << " (defined in block with id: "  << variable_block_id << ")";
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
                cout << "" << std::any_cast<number>(sub->value);
                break;
            }
            case node_type::BOOLEAN_CONST:
            {
                cout << "boolean const ";
                cout << "" << std::any_cast<int>(sub->value);
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
            cout << " (stmt-id: " << sub->statement_id() << ")";
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
        current_node->statement_id(_count_blocks);
        ++_count_blocks;
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
            auto function_name = any_cast<string>(stmt->operand1->value);
            mark_return_operator_recursive(stmt->operand1->operand3, stmt->statement_id(), function_name);
        }
    }
}

void compiler::ast::mark_return_operator_recursive(compiler::node* current_node, size_t current_block, const string& function_name)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::FUNCTION_IMPLEMENTATION)
        return;


    if (current_node->type == node_type::RETURN)
    {
        current_node->statement_id(current_block);

        size_t size_of_arguments = _functions.get_function(function_name)->arguments_size();

        current_node->value = size_of_arguments;
    }


    mark_return_operator_recursive(current_node->operand1, current_block, function_name);
    mark_return_operator_recursive(current_node->operand2, current_block, function_name);
    mark_return_operator_recursive(current_node->operand3, current_block, function_name);
    mark_return_operator_recursive(current_node->operand4, current_block, function_name);
}

void compiler::ast::mark_everything_block_where_it_using_recursive(node* current_node, size_t& current_stmt_id)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::FUNCTION_IMPLEMENTATION)
    {
        current_stmt_id = current_node->operand3->statement_id();
    }


    current_node->in_function_id(current_stmt_id);

    mark_everything_block_where_it_using_recursive(current_node->operand1, current_stmt_id);
    mark_everything_block_where_it_using_recursive(current_node->operand2, current_stmt_id);
    mark_everything_block_where_it_using_recursive(current_node->operand3, current_stmt_id);
    mark_everything_block_where_it_using_recursive(current_node->operand4, current_stmt_id);
}

void compiler::ast::mark_everything_block_where_it_using()
{
    size_t block_id = 0;
    mark_everything_block_where_it_using_recursive(_tree, block_id);
}

void compiler::ast::designate_variables()
{
    _variable_tables.reserve(_stmts.size());

    for (auto& [parent_stmt, stmt] : _stmts)
    {
        auto stmt_id = stmt->statement_id();
        auto new_variable_table = new variable_table(stmt_id);


        _variable_tables.push_back(new_variable_table);


        if (parent_stmt != nullptr)
        {
            new_variable_table->set_parent(parent_stmt->vars);
        }


        stmt->vars = new_variable_table;

        designate_variables_recursive(stmt->operand1, new_variable_table);
    }
}

void compiler::ast::designate_global_variables()
{
    designate_global_variables_recursive(_tree, _global_variables);
}

void compiler::ast::designate_variables_recursive(compiler::node* node, compiler::variable_table* table)
{
    if (node == nullptr)
        return;


    if (node->type == node_type::STATEMENT)
        return;



    if (node->type == node_type::VARIABLE_DECLARATION || node->type == node_type::CONSTANT_DECLARATION ||
        node->type == node_type::FUNCTION_IMPLEMENTATION_ARG)
    {
        auto variable_name = std::any_cast<string>(node->value);


        if (table->has_variable(variable_name))
        {
            cout << "ERROR: The variable '" << variable_name << "' has already been declared!" << endl;
            throw std::logic_error("");
        }


        auto is_const = node->type == node_type::CONSTANT_DECLARATION;


        auto variable_type = variable::variable_type_from_token_type(
                std::any_cast<token_type>(node->operand1->value)
        );

        auto block_id = table->block_id();

        auto new_variable = new variable
        (
            variable_name,
            variable_type,
            block_id,
            is_const
        );

        /*
         * Устанавливаем узлу, описывающему переменную, идентификатор блока, в которой она объявлена
         * для дальнейшего анализа
         */
        node->statement_id(block_id);


        /*if (new_variable->is_array())
        {
            new_variable->is_global_variable(true);
        }*/


        table->add_variable(new_variable);
        _all_variables.add_variable(new_variable);

        return;
    }
    else if (node->type == node_type::USING_VARIABLE)
    {
        auto variable_name = std::any_cast<string>(node->value);


        if (!table->has_variable_globally(variable_name))
        {
            cout << "ERROR: The name '" << variable_name << "' is not declared!" << endl;
            throw std::logic_error("");
        }


        auto [block_id, variable] = table->get_variable_and_block_id_where_it_defined(variable_name);

        /*
         * Устанавливаем текущему узлу, который описывает использование переменной, идентификатор блока равный
         * идентификатору блока в котором переменная была впервые объявлена, таким образом, для каждого использования
         * переменных будет описан идентифкатор блока, в которой она впервые объявлена
         */
        node->statement_id(block_id);
    }


    designate_variables_recursive(node->operand1, table);
    designate_variables_recursive(node->operand2, table);
    designate_variables_recursive(node->operand3, table);
    designate_variables_recursive(node->operand4, table);
}

void compiler::ast::designate_global_variables_recursive(compiler::node* current_node, vector<variable*>& variables)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::FUNCTION_IMPLEMENTATION)
        return;

    if (current_node->type == node_type::VARIABLE_DECLARATION ||
        current_node->type == node_type::CONSTANT_DECLARATION)
    {
        auto variable_name = any_cast<string>(current_node->value);
        auto block_id = current_node->statement_id();
        auto variable = _all_variables.get_variable(variable_name, block_id);

        variable->is_global_variable(true);

        variables.push_back(variable);
        return;
    }

    designate_global_variables_recursive(current_node->operand1, variables);
    designate_global_variables_recursive(current_node->operand2, variables);
    designate_global_variables_recursive(current_node->operand3, variables);
    designate_global_variables_recursive(current_node->operand4, variables);
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

void compiler::ast::designate_functions_recursive(compiler::node* current_node)
{
    if (current_node == nullptr)
        return;


    if (current_node->type == node_type::FUNCTION_IMPLEMENTATION)
    {
        auto function_name = any_cast<string>(current_node->value);
        auto type = variable::variable_type_from_token_type(any_cast<token_type>(current_node->operand1->value));


        vector<variable_type> argument_types;
        vector<variable*> arguments;
        designate_function_arguments_recursive(current_node->operand2, argument_types, arguments);


        size_t local_variable_size = 0;
        vector<variable*> variables;
        designate_function_local_variables_recursive(current_node->operand3, local_variable_size, variables);

        auto new_function = new function(function_name, type, argument_types, local_variable_size, variables, arguments);

        _functions.add_function(new_function);
    }

    designate_functions_recursive(current_node->operand1);
    designate_functions_recursive(current_node->operand2);
}

void compiler::ast::designate_function_arguments_recursive(compiler::node* node, vector<variable_type>& argument_types,
                                                                            vector<variable*>& arguments)
{
    if (node == nullptr)
        return;


    if (node->type == node_type::FUNCTION_IMPLEMENTATION_ARG)
    {
        auto argument_name = any_cast<string>(node->value);
        auto block_id = node->statement_id();
        auto variable = _all_variables.get_variable(argument_name, block_id);


        auto type = variable->type();
        argument_types.push_back(type);



        variable->is_argument_variable(true);

        arguments.push_back(variable);
    }

    designate_function_arguments_recursive(node->operand1, argument_types, arguments);
    designate_function_arguments_recursive(node->operand2, argument_types, arguments);
}

void compiler::ast::designate_function_local_variables_recursive(compiler::node* current_node, size_t& size,
                                                                                    vector<variable*>& variables)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == node_type::VARIABLE_DECLARATION ||
            current_node->type == node_type::CONSTANT_DECLARATION)
    {
        auto variable_name = any_cast<string>(current_node->value);
        auto block_id = current_node->statement_id();
        auto variable = _all_variables.get_variable(variable_name, block_id);

        auto type = variable::variable_type_from_token_type(any_cast<token_type>(current_node->operand1->value));
        auto variable_size = variable::byte_on_type(type);

        if (!variable::is_array_type(type))
        {
            size += variable_size;
        }



        variables.push_back(variable);

        return;
    }


    designate_function_local_variables_recursive(current_node->operand1, size, variables);
    designate_function_local_variables_recursive(current_node->operand2, size, variables);
    designate_function_local_variables_recursive(current_node->operand3, size, variables);
    designate_function_local_variables_recursive(current_node->operand4, size, variables);
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

        if (!_global_functions.has_function(function_name))
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
            give_expression_type_recursive(node->operand1, type);
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

        function* func = nullptr;

        if (!_global_functions.has_function(new function(function_name, variable_type::UNDEFINED, types)))
        {
            func = _functions.get_function(function_name, types);
        }
        else
        {
            func = _global_functions.get_function(function_name, types);
        }

        type = func->return_type();
        return;
    }
    else if (current_node->type == node_type::NEW)
    {
        current_node = current_node->operand1;

        auto function_name = any_cast<string>(current_node->value);
        vector<variable_type> types;

        designate_function_call_arguments_recursive(current_node, &types);

        function* func = nullptr;

        if (!_global_functions.has_function(new function(function_name, variable_type::ANY, types)))
        {
            func = _functions.get_function(function_name, types);
        }
        else
        {
            func = _global_functions.get_function(function_name, types);
        }

        type = func->return_type();
        return;
    }
    else if (current_node->type == node_type::INITIALIZER)
    {
        type = variable_type::ANY;
        return;
    }
    else if (current_node->type == node_type::INDEX_CAPTURE)
    {
        auto array_name = any_cast<string>(current_node->operand1->value);
        auto block_id = current_node->operand1->statement_id();

        auto array_type = _all_variables.get_variable_by_name(array_name)->type();

        type = variable::type_of_array_type(array_type);
        return;
    }
    else if (node::is_comparison_operator(current_node->type))
    {
        type = variable_type::BOOLEAN;
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
        auto variable_block_id = current_node->statement_id();

        auto variable = _all_variables.get_variable(variable_name, variable_block_id);

        return variable->type();
    }
    else if (current_node->type == node_type::INDEX_CAPTURE)
    {
        auto variable_name = any_cast<string>(current_node->operand1->value);
        auto variable_block_id = current_node->operand1->statement_id();

        auto variable = _all_variables.get_variable(variable_name, variable_block_id);

        return variable::type_of_array_type(variable->type());
    }
    else if (current_node->type == node_type::VARIABLE_DECLARATION ||
             current_node->type == node_type::CONSTANT_DECLARATION)
    {
        return variable::variable_type_from_token_type(any_cast<token_type>(current_node->operand1->value));
    }

    return variable_type::UNDEFINED;
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
                lvalue->type != node_type::CONSTANT_DECLARATION &&
                lvalue->type != node_type::INDEX_CAPTURE)
            {
                error("Invalid assignment!");
            }


            variable_type lvalue_type = variable_type_of_node(lvalue);



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

void compiler::ast::print_functions_table()
{
    cout << "\n";
    cout << "Functions table\n";
    _functions.print();
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
            auto array_type = variable::variable_type_from_token_type(any_cast<token_type>(array_type_node->value));
            auto block_id = array_node->statement_id();

            auto array_name = any_cast<string>(array_node->value);
            auto variable = _all_variables.get_variable(array_name, block_id);

            auto initializer_node = node->operand2;

            if (variable::is_array_type(array_type))
            {
                if (initializer_node->type == node_type::INITIALIZER)
                {

                    vector<variable_value> array_values;
                    auto array_value_type = variable::type_of_array_type(array_type);
                    designate_array_initialize_list_recursive(initializer_node, array_values, array_value_type);


                    _arrays.emplace_back(array_name, array_values.size(), array_values, variable);
                }
                else if (initializer_node->type == node_type::NEW)
                {
                    auto calling_function_node = initializer_node->operand1;
                    auto calling_function_name = any_cast<string>(calling_function_node->value);


                    if (calling_function_name == "Array")
                    {
                        auto temp_array_size = (size_t)any_cast<number>(calling_function_node->operand1->operand1->value);

                        _arrays.push_back(array(array_name, temp_array_size, {}, variable));
                    }
                    else
                    {
                        error("To initialize an array using the new operator, you must use the Array function!");
                    }
                }
            }
        }

    }
    else if (node->type == node_type::FUNCTION_IMPLEMENTATION_ARG)
    {
        auto block_id = node->statement_id();
        auto array_name = any_cast<string>(node->value);
        auto variable = _all_variables.get_variable(array_name, block_id);



        auto var_node = node;
        auto var_type_node = var_node->operand1;
        auto var_type = (variable_type) any_cast<token_type>(var_type_node->value);

        auto var_name = any_cast<string>(var_node->value);

        if (variable::is_array_type(var_type))
        {
            _arrays.push_back(array(var_name, 0, {}, variable));
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

void compiler::ast::designate_array_initialize_list_recursive(node* node, vector<variable_value>& list, variable_type array_type)
{
    if (node == nullptr)
        return;

    if (node->type == node_type::INITIALIZER_LIST)
    {
        variable_type value_type = variable_type::UNDEFINED;
        give_expression_type_recursive(node->operand2, value_type);


        auto value_node = node->operand2;

        auto raw_value_node = value_node;
        if (value_node->type == node_type::UNARY_MINUS ||
            value_node->type == node_type::UNARY_PLUS ||
            value_node->type == node_type::UNARY_EXCLAMATION)
        {
            value_node = value_node->operand1;
        }


        if (!variable::is_types_reducible(value_type, array_type))
        {
            string lvalue_type_str = variable::variable_type_to_string(value_type);
            string expression_type_str = variable::variable_type_to_string(array_type);

            error("Type '" + lvalue_type_str + "' is not assignable to type '" + expression_type_str + "'!");
        }

        variable_value value;

        switch (value_type)
        {
            case variable_type::NUMBER:
            {
                auto temp_value = any_cast<number>(value_node->value);

                if (raw_value_node->type == node_type::UNARY_MINUS)
                {
                    temp_value *= -1;
                }

                value = temp_value;
                break;
            }
            case variable_type::BOOLEAN:
            {
                value = (bool)any_cast<int>(value_node->value);

                auto temp_value = (bool)any_cast<int>(value_node->value);

                if (raw_value_node->type == node_type::UNARY_EXCLAMATION)
                {
                    temp_value = !temp_value;
                }

                value = temp_value;
                break;
            }
            case variable_type::STRING:
            {
                value = any_cast<string>(value_node->value);
                break;
            }
            case variable_type::UNDEFINED:
            case variable_type::VOID:
            case variable_type::ANY:
            case variable_type::NUMBER_ARRAY:
            case variable_type::BOOLEAN_ARRAY:
            case variable_type::STRING_ARRAY:
            case variable_type::VOID_ARRAY:
                error("Error! Some not expected!");
        }

        list.push_back(value);
    }



    designate_array_initialize_list_recursive(node->operand1, list, array_type);
    designate_array_initialize_list_recursive(node->operand2, list, array_type);
    designate_array_initialize_list_recursive(node->operand3, list, array_type);
}

compiler::node* compiler::ast::get_stmt_by_id(size_t stmt_id)
{
    for (const auto& stmt : _stmts)
    {
        if (stmt.second->statement_id() == stmt_id)
        {
            return stmt.second;
        }
    }

    return nullptr;
}


