#include "Ast.h"

stc::Ast::Ast()
{
    this->m_count_blocks = 1;
}

void stc::Ast::print(stc::Node* sub, size_t level) const
{
    if (sub != nullptr)
    {
        for (size_t i = 0; i < level; i++) cout << "  ";


        switch (sub->type)
        {
            case NodeType::VARIABLE_DECLARATION:
            {
                cout << "new var ";
                cout << "" << std::any_cast<string>(sub->value);

                auto variable_block_id = sub->statement_id();
                cout << " (current block id: "  << variable_block_id << ")";
                break;
            }
            case NodeType::USING_VARIABLE:
            {
                cout << "use var ";
                auto variable_block_id = sub->statement_id();
                auto variable_name = any_cast<string>(sub->value);

                cout << "" << variable_name;
                cout << " (defined in block with id: "  << variable_block_id << ")";
                break;
            }
            case NodeType::VARIABLE_TYPE:
            {
                cout << "var type ";
                cout << "" << (int)std::any_cast<TokenType>(sub->value);
                break;
            }
            case NodeType::CONSTANT_DECLARATION:
            {
                cout << "new const ";
                cout << "" << std::any_cast<string>(sub->value);
                break;
            }
            case NodeType::USING_CONSTANT:
            {
                cout << "use const ";
                cout << "" << std::any_cast<string>(sub->value);
                break;
            }
            case NodeType::NUMBER_CONST:
            {
                cout << "number const ";
                cout << "" << std::any_cast<number>(sub->value);
                break;
            }
            case NodeType::BOOLEAN_CONST:
            {
                cout << "boolean const ";
                cout << "" << std::any_cast<int>(sub->value);
                break;
            }
            case NodeType::ADD:
            {
                cout << "add ";
                break;
            }
            case NodeType::SUB:
            {
                cout << "sub ";
                break;
            }
            case NodeType::MUL:
            {
                cout << "mul ";
                break;
            }
            case NodeType::DIV:
            {
                cout << "div ";
                break;
            }
            case NodeType::EXPONENTIATION:
            {
                cout << "exponentiation (**)";
                break;
            }
            case NodeType::LESS:
            {
                cout << "less ";
                break;
            }
            case NodeType::GREATER:
            {
                cout << "greater ";
                break;
            }
            case NodeType::EQUAL:
            {
                cout << "equal ";
                break;
            }
            case NodeType::NOT_EQUAL:
            {
                cout << "not equal ";
                break;
            }
            case NodeType::LESS_EQUAL:
            {
                cout << "less equal ";
                break;
            }
            case NodeType::GREATER_EQUAL:
            {
                cout << "greater equal ";
                break;
            }
            case NodeType::FOR:
            {
                cout << "for ";
                break;
            }
            case NodeType::WHILE:
            {
                cout << "while ";
                break;
            }
            case NodeType::BREAK:
            {
                cout << "break ";
                break;
            }
            case NodeType::CONTINUE:
            {
                cout << "continue ";
                break;
            }
            case NodeType::IF:
            {
                cout << "if ";
                break;
            }
            case NodeType::IF_ELSE:
            {
                cout << "if else ";
                break;
            }
            case NodeType::IDENTIFIER:
            {
                cout << "non terminal name ";

                cout << "" << std::any_cast<string>(sub->value);
                break;
            }
            case NodeType::BEFORE_INC:
            {
                cout << "before inc ";
                break;
            }
            case NodeType::BEFORE_DEC:
            {
                cout << "before dec ";
                break;
            }
            case NodeType::AFTER_INC:
            {
                cout << "after inc ";
                break;
            }
            case NodeType::AFTER_DEC:
            {
                cout << "after dec ";
                break;
            }
            case NodeType::UNARY_PLUS:
            {
                cout << "unary + ";
                break;
            }
            case NodeType::UNARY_MINUS:
            {
                cout << "unary - ";
                break;
            }
            case NodeType::UNARY_EXCLAMATION:
            {
                cout << "unary ! ";
                break;
            }
            case NodeType::LOGICAL_AND:
            {
                cout << "AND ";
                break;
            }
            case NodeType::LOGICAL_OR:
            {
                cout << "OR ";
                break;
            }
            case NodeType::SET:
            {
                cout << "set ";
                break;
            }
            case NodeType::INDEX_CAPTURE:
            {
                cout << "index capture ";
                break;
            }
            case NodeType::FUNCTION_CALL:
            {
                cout << "function call ";
                cout << std::any_cast<string>(sub->value);
                break;
            }
            case NodeType::FUNCTION_ARG:
            {
                cout << "function arg ";
                break;
            }
            case NodeType::EXPRESSION:
            {
                cout << "expr ";
                break;
            }
            case NodeType::CONST_EXPRESSION:
            {
                cout << "const expr ";
                break;
            }
            case NodeType::STATEMENT:
            {
                cout << "stmt ";
                break;
            }
            case NodeType::SEQ_STATEMENT:
            {
                cout << "seq ";
                break;
            }
            case NodeType::STATEMENT_LIST:
            {
                cout << "seq ";
                break;
            }
            case NodeType::PROGRAM:
            {
                cout << "prog ";
                break;
            }
            case NodeType::DO_WHILE:
            {
                cout << "do (while) ";
                break;
            }
            case NodeType::INITIALIZER:
            {
                cout << "initializer ";
                break;
            }
            case NodeType::INITIALIZER_LIST:
            {
                cout << "initializer list ";
                break;
            }
            case NodeType::NEW:
            {
                cout << "new ";
                break;
            }
            case NodeType::FUNCTION_IMPLEMENTATION:
            {
                cout << "function impl ";
                cout << "" << std::any_cast<string>(sub->value);
                break;
            }
            case NodeType::FUNCTION_IMPLEMENTATION_ARG:
            {
                cout << "function impl arg ";
                break;
            }
            case NodeType::FUNCTION_IMPLEMENTATION_RETURN_TYPE:
            {
                cout << "function impl return type ";
                cout << "" << (int)std::any_cast<TokenType>(sub->value);
                break;
            }
            case NodeType::RETURN:
            {
                cout << "return ";
                break;
            }
            case NodeType::FUNCTION_IMPLEMENTATION_ARGS:
            {
                cout << "function impl args ";
                break;
            }
            case NodeType::FUNCTION_ARGS:
            {
                cout << "function args ";
                break;
            }
            case NodeType::STRING_CONST:
            {
                cout << "string const ";
                cout << "" << std::any_cast<string>(sub->value);
                break;
            }
            case NodeType::CLASS:
            {
                cout << "Class Definition '";
                cout << std::any_cast<string>(sub->value) << "'";
                break;
            }
            case NodeType::CLASS_FIELD:
            {
                cout << "Class Definition Field '";
                cout << std::any_cast<string>(sub->value) << "'";
                break;
            }
            case NodeType::CLASS_FUNCTION:
            {
                cout << "Class Definition Function";
                break;
            }
            case NodeType::CLASS_THIS:
            {
                cout << "Class Definition This";
                break;
            }
            case NodeType::CLASS_FIELD_VISIBILITY:
            {
                cout << "Class Field Visibility '";
                cout << Class::modifierToString(std::any_cast<ClassVisibilityModifier>(sub->value)) << "'";
                break;
            }
            case NodeType::DECLARATION_TYPE:
            {
                cout << "Declaration Type '";
                std::any_cast<Type>(sub->value).print();
                cout << "'";
                break;
            }
            case NodeType::FUNCTION_IMPLEMENTATION_NEW:
            {
                cout << "Function Implementation '";
                cout << std::any_cast<string>(sub->value) << "'";
                break;
            }
            case NodeType::FUNCTION_IMPLEMENTATION_NEW_ARGS:
            {
                cout << "Function Implementation Args ";
                break;
            }
            case NodeType::FUNCTION_IMPLEMENTATION_NEW_ARG:
            {
                cout << "Function Implementation Arg '";
                cout << std::any_cast<string>(sub->value) << "'";
                break;
            }
            case NodeType::CLASS_ACCESS_TO_FIELD:
            {
                cout << "Class Access To Field";
                break;
            }
            case NodeType::INTERFACE_IMPLEMENTATION:
            {
                cout << "Interface Implementation '";
                cout << std::any_cast<string>(sub->value) << "'";
                break;
            }
            case NodeType::INTERFACE_FUNCTION_DEFINITION:
            {
                cout << "Interface Function Definition '";
                cout << std::any_cast<string>(sub->value) << "'";
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

void stc::Ast::designate_blocks()
{
    designate_blocks_recursive(m_root->operand1, nullptr);
    designate_blocks_recursive(m_root->operand2, nullptr);
    designate_blocks_recursive(m_root->operand3, nullptr);
    designate_blocks_recursive(m_root->operand4, nullptr);
}

void stc::Ast::designate_blocks_recursive(Node* current_node, Node* current_stmt)
{
    if (current_node == nullptr)
        return;


    if (current_node->type == NodeType::STATEMENT)
    {
        m_allStatements.emplace_back(current_stmt, current_node);
        current_stmt = current_node;
    }

    designate_blocks_recursive(current_node->operand1, current_stmt);
    designate_blocks_recursive(current_node->operand2, current_stmt);
    designate_blocks_recursive(current_node->operand3, current_stmt);
    designate_blocks_recursive(current_node->operand4, current_stmt);
}

void stc::Ast::mark_block()
{
    mark_block_recursive(m_root->operand1);
    mark_block_recursive(m_root->operand2);
    mark_block_recursive(m_root->operand3);
    mark_block_recursive(m_root->operand4);
}

void stc::Ast::mark_block_recursive(Node* current_node)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == NodeType::STATEMENT)
    {
        current_node->statement_id(m_count_blocks);
        ++m_count_blocks;
    }
    else if (current_node->type == NodeType::IF ||
             current_node->type == NodeType::IF_ELSE ||
             current_node->type == NodeType::WHILE ||
             current_node->type == NodeType::WHILE ||
             current_node->type == NodeType::DO_WHILE)
    {


        current_node->operand2->statement_id(m_count_blocks);
        ++m_count_blocks;
    }
    else if (current_node->type == NodeType::FOR)
    {
        current_node->operand4->statement_id(m_count_blocks);
        ++m_count_blocks;
    }
    else if (current_node->type == NodeType::FUNCTION_IMPLEMENTATION)
    {
        current_node->operand3->statement_id(m_count_blocks);
        ++m_count_blocks;
    }



    mark_block_recursive(current_node->operand1);
    mark_block_recursive(current_node->operand2);
    mark_block_recursive(current_node->operand3);
    mark_block_recursive(current_node->operand4);
}

void stc::Ast::mark_break_continue_operators()
{
    for (auto& [parent_stmt, stmt] : m_allStatements)
    {
        if (stmt->operand1 != nullptr &&
            (stmt->operand1->type == NodeType::FOR ||
             stmt->operand1->type == NodeType::WHILE ||
             stmt->operand1->type == NodeType::DO_WHILE))
        {
            mark_break_continue_operators_recursive(stmt->operand1->operand1, stmt->statement_id());
            mark_break_continue_operators_recursive(stmt->operand1->operand2, stmt->statement_id());
            mark_break_continue_operators_recursive(stmt->operand1->operand3, stmt->statement_id());
            mark_break_continue_operators_recursive(stmt->operand1->operand4, stmt->statement_id());
        }
    }
}

void stc::Ast::mark_break_continue_operators_recursive(stc::Node* current_node, size_t current_block)
{
    if (current_node == nullptr)
        return;


    // if there is another cycle in the cycle, then you do not need to enter it
    if (current_node->type == NodeType::FOR ||
        current_node->type == NodeType::WHILE ||
        current_node->type == NodeType::DO_WHILE)
    {
        return;
    }



    if (current_node->type == NodeType::BREAK ||
        current_node->type == NodeType::CONTINUE)
    {
        current_node->statement_id(current_block);
    }


    mark_break_continue_operators_recursive(current_node->operand1, current_block);
    mark_break_continue_operators_recursive(current_node->operand2, current_block);
    mark_break_continue_operators_recursive(current_node->operand3, current_block);
    mark_break_continue_operators_recursive(current_node->operand4, current_block);
}

void stc::Ast::mark_return_operator()
{
    for (auto& [parent_stmt, stmt] : m_allStatements)
    {
        if (stmt->operand1 != nullptr &&
            stmt->operand1->type == NodeType::FUNCTION_IMPLEMENTATION)
        {
            auto function_name = any_cast<string>(stmt->operand1->value);
            mark_return_operator_recursive(stmt->operand1->operand3, stmt->statement_id(), function_name);
        }
    }
}

void stc::Ast::mark_return_operator_recursive(stc::Node* current_node, size_t current_block, const string& function_name)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == NodeType::FUNCTION_IMPLEMENTATION)
        return;


    if (current_node->type == NodeType::RETURN)
    {
        current_node->statement_id(current_block);

        size_t size_of_arguments = m_functions.get_function(function_name)->arguments_size();

        current_node->value = size_of_arguments;
    }


    mark_return_operator_recursive(current_node->operand1, current_block, function_name);
    mark_return_operator_recursive(current_node->operand2, current_block, function_name);
    mark_return_operator_recursive(current_node->operand3, current_block, function_name);
    mark_return_operator_recursive(current_node->operand4, current_block, function_name);
}


void stc::Ast::designate_variables()
{
    m_variable_tables.reserve(m_allStatements.size());

    for (auto& [parent_stmt, stmt] : m_allStatements)
    {
        auto stmt_id = stmt->statement_id();
        auto new_variable_table = new VariableTable(stmt_id);


        m_variable_tables.push_back(new_variable_table);


        if (parent_stmt != nullptr)
        {
            new_variable_table->set_parent(parent_stmt->variables);
        }


        stmt->variables = new_variable_table;

        designate_variables_recursive(stmt->operand1, new_variable_table);
    }
}

void stc::Ast::designate_global_variables()
{
    designate_global_variables_recursive(m_root, m_global_variables);
}

void stc::Ast::designate_variables_recursive(stc::Node* node, stc::VariableTable* table)
{
    if (node == nullptr)
        return;


    if (node->type == NodeType::STATEMENT)
        return;



    if (node->type == NodeType::VARIABLE_DECLARATION || node->type == NodeType::CONSTANT_DECLARATION ||
        node->type == NodeType::FUNCTION_IMPLEMENTATION_ARG)
    {
        auto variable_name = std::any_cast<string>(node->value);


        if (table->has_variable(variable_name))
        {
            cout << "ERROR: The variable '" << variable_name << "' has already been declared!" << endl;
            throw std::logic_error("");
        }


        auto is_const = node->type == NodeType::CONSTANT_DECLARATION;


        auto variable_type = Variable::variable_type_from_token_type(
                std::any_cast<TokenType>(node->operand1->value)
        );

        auto block_id = table->block_id();

        auto new_variable = new Variable
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
        m_all_variables.add_variable(new_variable);

        return;
    }
    else if (node->type == NodeType::USING_VARIABLE)
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

void stc::Ast::designate_global_variables_recursive(stc::Node* current_node, vector<Variable*>& variables)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == NodeType::FUNCTION_IMPLEMENTATION)
        return;

    if (current_node->type == NodeType::VARIABLE_DECLARATION ||
        current_node->type == NodeType::CONSTANT_DECLARATION)
    {
        auto variable_name = any_cast<string>(current_node->value);
        auto block_id = current_node->statement_id();
        auto variable = m_all_variables.get_variable(variable_name, block_id);

        variable->is_global_variable(true);

        variables.push_back(variable);
        return;
    }

    designate_global_variables_recursive(current_node->operand1, variables);
    designate_global_variables_recursive(current_node->operand2, variables);
    designate_global_variables_recursive(current_node->operand3, variables);
    designate_global_variables_recursive(current_node->operand4, variables);
}

void stc::Ast::check_const()
{
    for (auto& [parent_stmt, stmt] : m_allStatements)
    {
        check_const_recursive(stmt->operand1, stmt);
    }
}

void stc::Ast::check_const_recursive(stc::Node* current_node, stc::Node* current_stmt)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == NodeType::STATEMENT)
        return;

    if (current_node->type == NodeType::SET)
    {
        Node* op1 = current_node->operand1;
        Node* op2 = current_node->operand2;

        if (op1->type == NodeType::USING_VARIABLE)
        {
            auto variable_name = std::any_cast<string>(op1->value);
            auto* variable = current_stmt->variables->get_variable_by_name(variable_name);

            if (variable->is_const())
            {
                cout << "ERROR: Assignment to a constant '" << variable_name << "'!" << endl;
                throw std::logic_error("");
            }
        }
    }

    if (current_node->type == NodeType::EXPRESSION && current_node->operand1 != nullptr &&
        current_node->operand1->type == NodeType::CONSTANT_DECLARATION)
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

void stc::Ast::check_array()
{
    for (auto& [parent_stmt, stmt] : m_allStatements)
    {
        check_array_recursive(stmt->operand1);
    }
}

void stc::Ast::check_array_recursive(stc::Node* current_node)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == NodeType::STATEMENT)
        return;


    if (current_node->type == NodeType::SET)
    {
        Node* op1 = current_node->operand1;
        Node* op2 = current_node->operand2;

        if (op1->type == NodeType::VARIABLE_DECLARATION)
        {
            auto op1_type = (int)any_cast<TokenType>(op1->operand1->value);

            if (op1_type > (int)TokenType::VOID)
            {
                bool is_initializer_list = op2->type == NodeType::INITIALIZER;
                bool is_operator_new_array = op2->type == NodeType::NEW &&
                                             any_cast<string>(op2->operand1->value) == "Array";

                if (!is_initializer_list && !is_operator_new_array)
                {
                    cout << "Invalid assignment to '" << any_cast<string>(op1->value) <<
                         "'! You can only assign a value of the form [...] or new Array(const_number) to an array!" << endl;
                   throw std::logic_error("");
                }
            }
        }

        if (op1->type == NodeType::USING_VARIABLE)
        {
            auto variable_name = any_cast<string>(op1->value);
            auto variable = m_all_variables.get_variable_by_name(variable_name);
            auto variable_type = variable->type();

            if (variable_type >= VariableType::NUMBER_ARRAY)
            {
                cout << "Explicit array assignment is prohibited!" << endl;
                throw std::logic_error("");
            }
        }
    }



    if (current_node->type == NodeType::EXPRESSION && current_node->operand1 != nullptr &&
        current_node->operand1->type == NodeType::VARIABLE_DECLARATION)
    {
        bool is_array = (int)any_cast<TokenType>(current_node->operand1->operand1->value) > (int)TokenType::VOID;

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

void stc::Ast::designate_functions()
{
    designate_functions_recursive(m_allStatements[0].second->operand1);
}

void stc::Ast::designate_functions_recursive(stc::Node* current_node)
{
    if (current_node == nullptr)
        return;


    if (current_node->type == NodeType::FUNCTION_IMPLEMENTATION)
    {
        auto function_name = any_cast<string>(current_node->value);
        auto type = Variable::variable_type_from_token_type(any_cast<TokenType>(current_node->operand1->value));


        vector<VariableType> argument_types;
        vector<Variable*> arguments;
        designate_function_arguments_recursive(current_node->operand2, argument_types, arguments);


        size_t local_variable_size = 0;
        vector<Variable*> variables;
        designate_function_local_variables_recursive(current_node->operand3, local_variable_size, variables);

        auto new_function = new Function(function_name, type, argument_types, local_variable_size, variables, arguments);

        m_functions.add_function(new_function);
    }

    designate_functions_recursive(current_node->operand1);
    designate_functions_recursive(current_node->operand2);
}

void stc::Ast::designate_function_arguments_recursive(stc::Node* node, vector<VariableType>& argument_types,
                                                      vector<Variable*>& arguments)
{
    if (node == nullptr)
        return;


    if (node->type == NodeType::FUNCTION_IMPLEMENTATION_ARG)
    {
        auto argument_name = any_cast<string>(node->value);
        auto block_id = node->statement_id();
        auto variable = m_all_variables.get_variable(argument_name, block_id);


        auto type = variable->type();
        argument_types.push_back(type);



        variable->is_argument_variable(true);

        arguments.push_back(variable);
    }

    designate_function_arguments_recursive(node->operand1, argument_types, arguments);
    designate_function_arguments_recursive(node->operand2, argument_types, arguments);
}

void stc::Ast::designate_function_local_variables_recursive(stc::Node* current_node, size_t& size,
                                                            vector<Variable*>& variables)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == NodeType::VARIABLE_DECLARATION ||
        current_node->type == NodeType::CONSTANT_DECLARATION)
    {
        auto variable_name = any_cast<string>(current_node->value);
        auto block_id = current_node->statement_id();
        auto variable = m_all_variables.get_variable(variable_name, block_id);

        auto type = Variable::variable_type_from_token_type(any_cast<TokenType>(current_node->operand1->value));
        auto variable_size = Variable::byte_on_type(type);

        if (!Variable::is_array_type(type))
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



void stc::Ast::check_functions_call()
{
    check_functions_call_recursive(m_root);
}

void stc::Ast::check_functions_call_recursive(stc::Node* node)
{
    if (node == nullptr)
        return;


    if (node->type == NodeType::FUNCTION_CALL)
    {
        auto function_name = any_cast<string>(node->value);
        vector<VariableType> types;

        designate_function_call_arguments_recursive(node, &types);

        if (!m_global_functions.has_function(function_name))
        {
            m_functions.get_function(function_name, types);
        }
    }

    check_functions_call_recursive(node->operand1);
    check_functions_call_recursive(node->operand2);
    check_functions_call_recursive(node->operand3);
    check_functions_call_recursive(node->operand4);
}

void stc::Ast::designate_function_call_arguments_recursive(stc::Node* node,
                                                           std::vector<stc::VariableType>* arguments)
{
    if (node == nullptr)
        return;


    if (node->type == NodeType::FUNCTION_ARGS)
    {
        VariableType type;

        if (node->operand1->type == NodeType::NUMBER_CONST)
        {
            type = VariableType::NUMBER;
        }
        else if (node->operand1->type == NodeType::BOOLEAN_CONST)
        {
            type = VariableType::BOOLEAN;
        }
        else if (node->operand1->type == NodeType::STRING_CONST)
        {
            type = VariableType::STRING;
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

void stc::Ast::give_expression_type_recursive(stc::Node* current_node, VariableType& type)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == NodeType::ADD ||
        current_node->type == NodeType::SUB ||
        current_node->type == NodeType::MUL ||
        current_node->type == NodeType::DIV)
    {
        auto op1 = current_node->operand1;
        auto op2 = current_node->operand2;

        VariableType op1_type = VariableType::UNDEFINED;
        VariableType op2_type = VariableType::UNDEFINED;

        give_expression_type_recursive(op1, op1_type);
        give_expression_type_recursive(op2, op2_type);

        auto is_reducible = Variable::is_types_reducible(op1_type, op2_type);

        if (!is_reducible)
        {
            string op1_type_str = Variable::variable_type_to_string(op1_type);
            string op2_type_str = Variable::variable_type_to_string(op2_type);

            string action = Node::node_type_to_string(current_node->type);



            error("Operator " + action + " cannot be applied to types '" + op1_type_str + "' and '" + op2_type_str + "'.");
        }

        type = op1_type;
    }
    else if (current_node->type == NodeType::UNARY_MINUS ||
             current_node->type == NodeType::UNARY_PLUS)
    {
        auto op1 = current_node->operand1;

        VariableType op1_type = VariableType::UNDEFINED;
        give_expression_type_recursive(op1, op1_type);

        type = VariableType::BOOLEAN;
    }
    else if (current_node->type == NodeType::EXPONENTIATION)
    {
        auto op1 = current_node->operand1;

        VariableType op1_type = VariableType::UNDEFINED;
        give_expression_type_recursive(op1, op1_type);

        type = op1_type;
    }
    else if (current_node->type == NodeType::USING_VARIABLE ||
             current_node->type == NodeType::NUMBER_CONST ||
             current_node->type == NodeType::BOOLEAN_CONST ||
             current_node->type == NodeType::STRING_CONST)
    {
        type = variable_type_of_node(current_node);
    }
    else if (current_node->type == NodeType::FUNCTION_CALL)
    {
        auto function_name = any_cast<string>(current_node->value);
        vector<VariableType> types;

        designate_function_call_arguments_recursive(current_node, &types);

        Function* func = nullptr;

        if (!m_global_functions.has_function(new Function(function_name, VariableType::UNDEFINED, types)))
        {
            func = m_functions.get_function(function_name, types);
        }
        else
        {
            func = m_global_functions.get_function(function_name, types);
        }

        type = func->return_type();
        return;
    }
    else if (current_node->type == NodeType::NEW)
    {
        current_node = current_node->operand1;

        auto function_name = any_cast<string>(current_node->value);
        vector<VariableType> types;

        designate_function_call_arguments_recursive(current_node, &types);

        Function* func = nullptr;

        if (!m_global_functions.has_function(new Function(function_name, VariableType::ANY, types)))
        {
            func = m_functions.get_function(function_name, types);
        }
        else
        {
            func = m_global_functions.get_function(function_name, types);
        }

        type = func->return_type();
        return;
    }
    else if (current_node->type == NodeType::INITIALIZER)
    {
        type = VariableType::ANY;
        return;
    }
    else if (current_node->type == NodeType::INDEX_CAPTURE)
    {
        auto array_name = any_cast<string>(current_node->operand1->value);
        auto block_id = current_node->operand1->statement_id();

        auto array_type = m_all_variables.get_variable_by_name(array_name)->type();

        type = Variable::type_of_array_type(array_type);
        return;
    }
    else if (Node::is_comparison_operator(current_node->type))
    {
        type = VariableType::BOOLEAN;
        return;
    }


    give_expression_type_recursive(current_node->operand1, type);
    give_expression_type_recursive(current_node->operand2, type);
    give_expression_type_recursive(current_node->operand3, type);
    give_expression_type_recursive(current_node->operand4, type);
}

void stc::Ast::error(const string& message)
{
    cout << "Semantic error! " << message << endl;
    throw std::logic_error(message);
}


stc::VariableType stc::Ast::variable_type_of_node(stc::Node* current_node)
{
    if (current_node->type == NodeType::NUMBER_CONST)
    {
        return VariableType::NUMBER;
    }
    else if (current_node->type == NodeType::BOOLEAN_CONST)
    {
        return VariableType::BOOLEAN;
    }
    else if (current_node->type == NodeType::STRING_CONST)
    {
        return VariableType::STRING;
    }
    else if (current_node->type == NodeType::USING_VARIABLE)
    {
        auto variable_name = any_cast<string>(current_node->value);
        auto variable_block_id = current_node->statement_id();

        auto variable = m_all_variables.get_variable(variable_name, variable_block_id);

        return variable->type();
    }
    else if (current_node->type == NodeType::INDEX_CAPTURE)
    {
        auto variable_name = any_cast<string>(current_node->operand1->value);
        auto variable_block_id = current_node->operand1->statement_id();

        auto variable = m_all_variables.get_variable(variable_name, variable_block_id);

        return Variable::type_of_array_type(variable->type());
    }
    else if (current_node->type == NodeType::VARIABLE_DECLARATION ||
             current_node->type == NodeType::CONSTANT_DECLARATION)
    {
        return Variable::variable_type_from_token_type(any_cast<TokenType>(current_node->operand1->value));
    }

    return VariableType::UNDEFINED;
}

void stc::Ast::check_expression()
{
    check_expression_recursive(m_root);
}

void stc::Ast::check_expression_recursive(stc::Node* node)
{
    if (node == nullptr)
        return;


    if (node->type == NodeType::EXPRESSION)
    {
        if (node->operand1 != nullptr && node->operand1->type == NodeType::SET)
        {
            auto lvalue = node->operand1->operand1;
            if (lvalue->type != NodeType::USING_VARIABLE &&
                lvalue->type != NodeType::VARIABLE_DECLARATION &&
                lvalue->type != NodeType::CONSTANT_DECLARATION &&
                lvalue->type != NodeType::INDEX_CAPTURE)
            {
                error("Invalid assignment!");
            }


            VariableType lvalue_type = variable_type_of_node(lvalue);



            auto start_node = node->operand1->operand2;
            VariableType expression_type;
            give_expression_type_recursive(start_node, expression_type);

            if (!Variable::is_types_reducible(lvalue_type, expression_type))
            {
                string lvalue_type_str = Variable::variable_type_to_string(lvalue_type);
                string expression_type_str = Variable::variable_type_to_string(expression_type);

                error("Cannot assign a variable of type '" + lvalue_type_str + "' to '" + expression_type_str + "'!");
            }
        }


    }


    check_expression_recursive(node->operand1);
    check_expression_recursive(node->operand2);
    check_expression_recursive(node->operand3);
    check_expression_recursive(node->operand4);
}

void stc::Ast::print_variable_table()
{
    cout << "\n";
    cout << "Variable table\n";
    m_all_variables.print();
    cout << "\n";
}

void stc::Ast::print_functions_table()
{
    cout << "\n";
    cout << "Functions table\n";
    m_functions.print();
    cout << "\n";
}

void stc::Ast::designate_arrays()
{
    designate_arrays_recursive(m_root);
}

void stc::Ast::designate_arrays_recursive(stc::Node* node)
{
    if (node == nullptr)
        return;


    if (node->type == NodeType::SET &&
        node->operand1 != nullptr &&
        node->operand2 != nullptr)
    {
        if (node->operand1->type == NodeType::VARIABLE_DECLARATION)
        {
            auto array_node = node->operand1;
            auto array_type_node = array_node->operand1;
            auto array_type = Variable::variable_type_from_token_type(any_cast<TokenType>(array_type_node->value));
            auto block_id = array_node->statement_id();

            auto array_name = any_cast<string>(array_node->value);
            auto variable = m_all_variables.get_variable(array_name, block_id);

            auto initializer_node = node->operand2;

            if (Variable::is_array_type(array_type))
            {
                if (initializer_node->type == NodeType::INITIALIZER)
                {

                    vector<VariableValue> array_values;
                    auto array_value_type = Variable::type_of_array_type(array_type);
                    designate_array_initialize_list_recursive(initializer_node, array_values, array_value_type);


                    m_arrays.emplace_back(array_name, array_values.size(), array_values, variable);
                }
                else if (initializer_node->type == NodeType::NEW)
                {
                    auto calling_function_node = initializer_node->operand1;
                    auto calling_function_name = any_cast<string>(calling_function_node->value);


                    if (calling_function_name == "Array")
                    {
                        auto temp_array_size = (size_t)any_cast<number>(calling_function_node->operand1->operand1->value);

                        m_arrays.push_back(Array(array_name, temp_array_size, {}, variable));
                    }
                    else
                    {
                        error("To initialize an array using the new operator, you must use the Array function!");
                    }
                }
            }
        }

    }
    else if (node->type == NodeType::FUNCTION_IMPLEMENTATION_ARG)
    {
        auto block_id = node->statement_id();
        auto array_name = any_cast<string>(node->value);
        auto variable = m_all_variables.get_variable(array_name, block_id);



        auto var_node = node;
        auto var_type_node = var_node->operand1;
        auto var_type = (VariableType) any_cast<TokenType>(var_type_node->value);

        auto var_name = any_cast<string>(var_node->value);

        if (Variable::is_array_type(var_type))
        {
            m_arrays.push_back(Array(var_name, 0, {}, variable));
        }
    }


    designate_arrays_recursive(node->operand1);
    designate_arrays_recursive(node->operand2);
    designate_arrays_recursive(node->operand3);
    designate_arrays_recursive(node->operand4);
}

void stc::Ast::calculate_array_initialize_list(stc::Node* node, size_t* count)
{
    if (node == nullptr)
        return;

    if (node->type == NodeType::INITIALIZER_LIST)
    {
        ++(*count);
    }

    calculate_array_initialize_list(node->operand1, count);
    calculate_array_initialize_list(node->operand2, count);
    calculate_array_initialize_list(node->operand3, count);
}

void stc::Ast::designate_array_initialize_list_recursive(Node* node, vector<VariableValue>& list, VariableType array_type)
{
    if (node == nullptr)
        return;

    if (node->type == NodeType::INITIALIZER_LIST)
    {
        VariableType value_type = VariableType::UNDEFINED;
        give_expression_type_recursive(node->operand2, value_type);


        auto value_node = node->operand2;

        auto raw_value_node = value_node;
        if (value_node->type == NodeType::UNARY_MINUS ||
            value_node->type == NodeType::UNARY_PLUS ||
            value_node->type == NodeType::UNARY_EXCLAMATION)
        {
            value_node = value_node->operand1;
        }


        if (!Variable::is_types_reducible(value_type, array_type))
        {
            string lvalue_type_str = Variable::variable_type_to_string(value_type);
            string expression_type_str = Variable::variable_type_to_string(array_type);

            error("Type '" + lvalue_type_str + "' is not assignable to type '" + expression_type_str + "'!");
        }

        VariableValue value;

        switch (value_type)
        {
            case VariableType::NUMBER:
            {
                auto temp_value = any_cast<number>(value_node->value);

                if (raw_value_node->type == NodeType::UNARY_MINUS)
                {
                    temp_value *= -1;
                }

                value = temp_value;
                break;
            }
            case VariableType::BOOLEAN:
            {
                value = (bool)any_cast<int>(value_node->value);

                auto temp_value = (bool)any_cast<int>(value_node->value);

                if (raw_value_node->type == NodeType::UNARY_EXCLAMATION)
                {
                    temp_value = !temp_value;
                }

                value = temp_value;
                break;
            }
            case VariableType::STRING:
            {
                value = any_cast<string>(value_node->value);
                break;
            }
            case VariableType::UNDEFINED:
            case VariableType::VOID:
            case VariableType::ANY:
            case VariableType::NUMBER_ARRAY:
            case VariableType::BOOLEAN_ARRAY:
            case VariableType::STRING_ARRAY:
            case VariableType::VOID_ARRAY:
                error("Error! Some not expected!");
        }

        list.push_back(value);
    }



    designate_array_initialize_list_recursive(node->operand1, list, array_type);
    designate_array_initialize_list_recursive(node->operand2, list, array_type);
    designate_array_initialize_list_recursive(node->operand3, list, array_type);
}

stc::Node* stc::Ast::get_stmt_by_id(size_t stmt_id)
{
    for (const auto& stmt : m_allStatements)
    {
        if (stmt.second->statement_id() == stmt_id)
        {
            return stmt.second;
        }
    }

    return nullptr;
}

void stc::Ast::print() const noexcept
{
    print(m_root, 0);
}


