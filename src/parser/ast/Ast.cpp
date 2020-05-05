#include "Ast.h"
#include "../../ICM/icm.h"

stc::Ast::Ast(const path& filePath)
{
    this->m_countScopes = 1;
    this->m_filePath = filePath;
}

void stc::Ast::print(stc::Node* currentNode, size_t level)
{
    if (currentNode == nullptr)
        return;

    for (size_t i = 0; i < level; ++i)
        cout << "  ";

    cout << "+-";

    switch (currentNode->type)
    {
        case NodeType::VARIABLE_DECLARATION:
        {
            cout << "new var '";
            cout << "" << std::any_cast<string>(currentNode->value) << "' ";

            auto scopeId = currentNode->scopeId();
            cout << "(scope id: " << scopeId << ")";
            break;
        }
        case NodeType::USING_VARIABLE:
        {
            cout << "use var '";
            auto scopeId = currentNode->scopeId();
            auto variableName = any_cast<string>(currentNode->value);

            cout << "" << variableName << "' ";
            cout << "(declared in scope: "  << scopeId << ")";
            break;
        }
        case NodeType::VARIABLE_TYPE:
        {
            cout << "var type ";
            cout << "" << (int)std::any_cast<TokenType>(currentNode->value);
            break;
        }
        case NodeType::CONSTANT_DECLARATION:
        {
            cout << "new const ";
            cout << "" << std::any_cast<string>(currentNode->value);
            break;
        }
        case NodeType::USING_CONSTANT:
        {
            cout << "use const ";
            cout << "" << std::any_cast<string>(currentNode->value);
            break;
        }
        case NodeType::NUMBER_CONST:
        {
            cout << "number const ";
            cout << "" << std::any_cast<number>(currentNode->value);
            break;
        }
        case NodeType::BOOLEAN_CONST:
        {
            cout << "boolean const ";
            cout << "" << std::any_cast<int>(currentNode->value);
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
            cout << "identifier ";

            cout << "" << std::any_cast<string>(currentNode->value);
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
            cout << "function call '";
            cout << std::any_cast<string>(currentNode->value) << "' ";
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
            cout << "function impl '";
            cout << "" << std::any_cast<string>(currentNode->value) << "' ";
            break;
        }
        case NodeType::FUNCTION_IMPLEMENTATION_ARG:
        {
            cout << "function impl arg ";
            break;
        }
        case NodeType::FUNCTION_IMPLEMENTATION_RETURN_TYPE:
        {
            cout << "function impl return type '";
            cout << "" << (int)std::any_cast<TokenType>(currentNode->value) << "' ";
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
            cout << "" << std::any_cast<string>(currentNode->value);
            break;
        }
        case NodeType::IMPORT:
        {
            cout << "Import ";
            break;
        }
        case NodeType::EXPORT:
        {
            cout << "Export ";
            break;
        }
        case NodeType::IMPORT_LIST:
        {
            cout << "Import List";
            break;
        }
        case NodeType::IMPORT_LIST_ELEMENT:
        {
            cout << "Import List Element '";
            cout << std::any_cast<string>(currentNode->value) << "'";
            break;
        }
        case NodeType::IMPORT_FILE:
        {
            cout << "Import File Path '";
            cout << std::any_cast<string>(currentNode->value) << "'";
            break;
        }
        case NodeType::EXPORT_LIST:
        {
            cout << "Export List";
            break;
        }
        case NodeType::EXPORT_LIST_ELEMENT:
        {
            cout << "Export List Element '";
            cout << std::any_cast<string>(currentNode->value) << "'";
            break;
        }
    }

    if (currentNode->scopeId() != 4294967295)
    {
        cout << " (scope id: " << currentNode->scopeId() << ")";
    }


    cout << endl;

    print(currentNode->operand1, level + 1);
    print(currentNode->operand2, level + 1);
    print(currentNode->operand3, level + 1);
    print(currentNode->operand4, level + 1);
}

void stc::Ast::identifyBlocks()
{
    identifyBlocksRecursive(m_root, nullptr);
}

void stc::Ast::identifyBlocksRecursive(Node* currentNode, Node* currentScopeNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::STATEMENT)
    {
        m_allScopeNodes.emplace_back(currentScopeNode, currentNode);
        currentScopeNode = currentNode;
    }

    identifyBlocksRecursive(currentNode->operand1, currentScopeNode);
    identifyBlocksRecursive(currentNode->operand2, currentScopeNode);
    identifyBlocksRecursive(currentNode->operand3, currentScopeNode);
    identifyBlocksRecursive(currentNode->operand4, currentScopeNode);
}

void stc::Ast::markAllScopes()
{
    markAllScopesRecursive(m_root);
}

void stc::Ast::markAllScopesRecursive(Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::STATEMENT)
    {
        currentNode->scopeId(m_countScopes);
        ++m_countScopes;
    }
    else if (currentNode->type == NodeType::IF ||
             currentNode->type == NodeType::IF_ELSE ||
             currentNode->type == NodeType::WHILE ||
             currentNode->type == NodeType::WHILE ||
             currentNode->type == NodeType::DO_WHILE)
    {
        currentNode->operand2->scopeId(m_countScopes);
        ++m_countScopes;
    }
    else if (currentNode->type == NodeType::FOR)
    {
        currentNode->operand4->scopeId(m_countScopes);
        ++m_countScopes;
    }
    else if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION)
    {
        currentNode->operand3->scopeId(m_countScopes);
        ++m_countScopes;
    }


    markAllScopesRecursive(currentNode->operand1);
    markAllScopesRecursive(currentNode->operand2);
    markAllScopesRecursive(currentNode->operand3);
    markAllScopesRecursive(currentNode->operand4);
}

void stc::Ast::markBreakContinueOperators()
{
    for (auto& [parent_stmt, stmt] : m_allScopeNodes)
    {
        if (stmt->operand1 != nullptr &&
            (stmt->operand1->type == NodeType::FOR ||
             stmt->operand1->type == NodeType::WHILE ||
             stmt->operand1->type == NodeType::DO_WHILE))
        {
            mark_break_continue_operators_recursive(stmt->operand1->operand1, stmt->scopeId());
            mark_break_continue_operators_recursive(stmt->operand1->operand2, stmt->scopeId());
            mark_break_continue_operators_recursive(stmt->operand1->operand3, stmt->scopeId());
            mark_break_continue_operators_recursive(stmt->operand1->operand4, stmt->scopeId());
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
        current_node->scopeId(current_block);
    }


    mark_break_continue_operators_recursive(current_node->operand1, current_block);
    mark_break_continue_operators_recursive(current_node->operand2, current_block);
    mark_break_continue_operators_recursive(current_node->operand3, current_block);
    mark_break_continue_operators_recursive(current_node->operand4, current_block);
}

void stc::Ast::markReturnOperator()
{
    for (auto& [parent_stmt, stmt] : m_allScopeNodes)
    {
        if (stmt->operand1 != nullptr &&
            stmt->operand1->type == NodeType::FUNCTION_IMPLEMENTATION)
        {
            auto function_name = any_cast<string>(stmt->operand1->value);
            vector<VariableType> types;
            vector<Variable*> variables;
            designate_function_arguments_recursive(stmt->operand1, types, variables);

            mark_return_operator_recursive(stmt->operand1->operand3, stmt->scopeId(), function_name, types);
        }
    }
}

void stc::Ast::mark_return_operator_recursive(stc::Node* current_node, size_t current_block,
        const string& function_name, const vector<VariableType>& arguments)
{
    if (current_node == nullptr)
        return;

    if (current_node->type == NodeType::FUNCTION_IMPLEMENTATION)
        return;


    if (current_node->type == NodeType::RETURN)
    {
        current_node->scopeId(current_block);


        size_t size_of_arguments = m_functions.get(function_name, arguments)->argumentsSize();

        current_node->value = size_of_arguments;
    }


    mark_return_operator_recursive(current_node->operand1, current_block, function_name, arguments);
    mark_return_operator_recursive(current_node->operand2, current_block, function_name, arguments);
    mark_return_operator_recursive(current_node->operand3, current_block, function_name, arguments);
    mark_return_operator_recursive(current_node->operand4, current_block, function_name, arguments);
}


void stc::Ast::identifyVariables()
{
    m_variableTables.reserve(m_allScopeNodes.size());

    for (auto& [parentScopeNode, thisScopeNode] : m_allScopeNodes)
    {
        auto scopeId = thisScopeNode->scopeId();
        auto newVariableTable = new VariableTable(scopeId);


        m_variableTables.push_back(newVariableTable);


        if (parentScopeNode != nullptr)
        {
            newVariableTable->setParent(parentScopeNode->variables);
        }


        thisScopeNode->variables = newVariableTable;

        identifyVariablesRecursive(thisScopeNode->operand1, newVariableTable);
    }
}

void stc::Ast::identifyGlobalVariables()
{
    identifyGlobalVariablesRecursive(m_root, m_globalVariables);
}

void stc::Ast::identifyVariablesRecursive(stc::Node* currentNode, stc::VariableTable* table)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::STATEMENT)
        return;

    auto forDeduceVariableType = currentNode;
    if (currentNode->type == NodeType::SET)
    {
        forDeduceVariableType = currentNode->operand2;
        identifyVariablesRecursive(currentNode->operand2, table);
        currentNode = currentNode->operand1;
    }

    if (currentNode->type == NodeType::VARIABLE_DECLARATION || currentNode->type == NodeType::CONSTANT_DECLARATION ||
        currentNode->type == NodeType::FUNCTION_IMPLEMENTATION_ARG)
    {
        auto variableName = std::any_cast<string>(currentNode->value);


        if (table->contains(variableName))
        {
            error("The variable '" + variableName + "' has already been declared!");
        }


        auto isConst = currentNode->type == NodeType::CONSTANT_DECLARATION;


        auto variableType = VariableType::VOID;

        if (currentNode->operand1 == nullptr)
        {
            giveExpressionTypeRecursive(forDeduceVariableType, variableType);
        }
        else
        {
            variableType = Variable::variableTypeFromTokenType(
                    std::any_cast<TokenType>(currentNode->operand1->value)
            );
        }





        auto scopeId = table->scopeId();

        auto newVariable = new Variable
        (
                variableName,
                variableType,
                scopeId,
                isConst
        );

        /*
         * Устанавливаем узлу, описывающему переменную, идентификатор блока, в которой она объявлена
         * для дальнейшего анализа
         */
        currentNode->scopeId(scopeId);


        /*if (new_variable->is_array())
        {
            new_variable->is_global_variable(true);
        }*/


        table->add(newVariable);
        m_allVariables.add(newVariable);

        return;
    }
    else if (currentNode->type == NodeType::USING_VARIABLE)
    {
        auto variableName = std::any_cast<string>(currentNode->value);


        if (!table->containsGlobally(variableName) && !m_importVariables.contains(variableName))
        {
            error("The name '" + variableName + "' is not declared!");
        }


        auto [scopeId, variable] = !table->containsGlobally(variableName) ?
                                   m_importVariables.getVariableAndScopeIdWhereItDeclared(variableName)
                                                                          : table->getVariableAndScopeIdWhereItDeclared(variableName);

        /*
         * Устанавливаем текущему узлу, который описывает использование переменной, идентификатор блока равный
         * идентификатору блока в котором переменная была впервые объявлена, таким образом, для каждого использования
         * переменных будет описан идентифкатор блока, в которой она впервые объявлена
         */
        currentNode->scopeId(scopeId);
    }


    identifyVariablesRecursive(currentNode->operand1, table);
    identifyVariablesRecursive(currentNode->operand2, table);
    identifyVariablesRecursive(currentNode->operand3, table);
    identifyVariablesRecursive(currentNode->operand4, table);
}

void stc::Ast::checkConstant()
{
    for (auto& [parent_stmt, stmt] : m_allScopeNodes)
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
            auto* variable = current_stmt->variables->getByName(variable_name);

            if (variable->isConst())
            {
                error("Assignment to a constant '" + variable_name + "'!");
            }
        }
    }

    if (current_node->type == NodeType::EXPRESSION && current_node->operand1 != nullptr &&
        current_node->operand1->type == NodeType::CONSTANT_DECLARATION)
    {
        error("The constant '" + std::any_cast<string>(current_node->operand1->value) +
                                      "' must be initialized when defining!");
    }



    check_const_recursive(current_node->operand1, current_stmt);
    check_const_recursive(current_node->operand2, current_stmt);
    check_const_recursive(current_node->operand3, current_stmt);
    check_const_recursive(current_node->operand4, current_stmt);
}

void stc::Ast::checkArray()
{
    for (auto& [parent_stmt, stmt] : m_allScopeNodes)
    {
        check_array_recursive(stmt->operand1);
    }
}

void stc::Ast::check_array_recursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::STATEMENT)
        return;


    if (currentNode->type == NodeType::SET)
    {
        Node* op1 = currentNode->operand1;
        Node* op2 = currentNode->operand2;

        if (op1->type == NodeType::VARIABLE_DECLARATION)
        {

            auto op1_type = (int)VariableType::VOID;
            if (currentNode->operand1->operand1 == nullptr)
            {
                auto type = VariableType::VOID;
                giveExpressionTypeRecursive(currentNode->operand2, type);
                op1_type = (int)type;
            }
            else
            {
                op1_type = (int)std::any_cast<TokenType>(op1->operand1->value);
            }


            if (op1_type > (int)TokenType::VOID)
            {
                bool is_initializer_list = op2->type == NodeType::INITIALIZER;
                bool is_operator_new_array = op2->type == NodeType::NEW &&
                                             any_cast<string>(op2->operand1->value) == "Array";

                if (!is_initializer_list && !is_operator_new_array)
                {
                    error("Invalid assignment to '" + any_cast<string>(op1->value) +
                    "'! You can only assign a value of the form [...] or new Array(const_number) to an array!");
                }
            }
        }

        if (op1->type == NodeType::USING_VARIABLE)
        {
            auto variable_name = any_cast<string>(op1->value);
            auto variable = m_allVariables.getByName(variable_name);
            auto variable_type = variable->type();

            if (variable_type >= VariableType::NUMBER_ARRAY)
            {
                error("Explicit array assignment is prohibited!");
            }
        }
    }



    if (currentNode->type == NodeType::EXPRESSION && currentNode->operand1 != nullptr &&
        currentNode->operand1->type == NodeType::VARIABLE_DECLARATION)
    {
        bool is_array = (int)any_cast<TokenType>(currentNode->operand1->operand1->value) > (int)TokenType::VOID;

        if (is_array)
        {
            error("ERROR: The array '" + any_cast<string>(currentNode->operand1->value) +
                  "' must be initialized when defining!");
        }
    }


    check_array_recursive(currentNode->operand1);
    check_array_recursive(currentNode->operand2);
    check_array_recursive(currentNode->operand3);
    check_array_recursive(currentNode->operand4);
}

void stc::Ast::identifyFunctions()
{
    designate_functions_recursive(m_allScopeNodes[0].second->operand1);
}

void stc::Ast::designate_functions_recursive(stc::Node* current_node)
{
    if (current_node == nullptr)
        return;


    if (current_node->type == NodeType::FUNCTION_IMPLEMENTATION)
    {
        auto function_name = any_cast<string>(current_node->value);
        auto type = Variable::variableTypeFromTokenType(any_cast<TokenType>(current_node->operand1->value));


        vector<VariableType> argument_types;
        vector<Variable*> arguments;
        designate_function_arguments_recursive(current_node->operand2, argument_types, arguments);


        size_t local_variable_size = 0;
        vector<Variable*> variables;
        designateFunctionLocalVariablesRecursive(current_node->operand3, local_variable_size, variables);

        auto new_function = new Function(function_name, type, argument_types, current_node, local_variable_size, arguments, variables);

        m_functions.add(new_function);
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
        auto block_id = node->scopeId();
        auto variable = m_allVariables.getByNameAndScopeId(argument_name, block_id);


        auto type = variable->type();
        argument_types.push_back(type);


        variable->isArgument(true);

        arguments.push_back(variable);
    }

    designate_function_arguments_recursive(node->operand1, argument_types, arguments);
    designate_function_arguments_recursive(node->operand2, argument_types, arguments);
}

void stc::Ast::designateFunctionLocalVariablesRecursive(stc::Node* currentNode, size_t& size,
                                                        vector<Variable*>& variables)
{
    if (currentNode == nullptr)
        return;

    auto forDeduceVariableType = currentNode;
    if (currentNode->type == NodeType::SET)
    {
        forDeduceVariableType = currentNode->operand2;
        currentNode = currentNode->operand1;
    }


    if (currentNode->type == NodeType::VARIABLE_DECLARATION ||
        currentNode->type == NodeType::CONSTANT_DECLARATION)
    {
        auto variable_name = any_cast<string>(currentNode->value);
        auto block_id = currentNode->scopeId();
        auto variable = m_allVariables.getByNameAndScopeId(variable_name, block_id);


        auto type = VariableType::VOID;
        if (currentNode->operand1 == nullptr)
        {
            giveExpressionTypeRecursive(forDeduceVariableType, type);
        }
        else
        {
            type = Variable::variableTypeFromTokenType(
                    std::any_cast<TokenType>(currentNode->operand1->value)
            );
        }



        auto variable_size = Variable::typeSizeInByte(type);

        if (!Variable::isArrayType(type))
        {
            size += variable_size;
        }



        variables.push_back(variable);

        return;
    }


    designateFunctionLocalVariablesRecursive(currentNode->operand1, size, variables);
    designateFunctionLocalVariablesRecursive(currentNode->operand2, size, variables);
    designateFunctionLocalVariablesRecursive(currentNode->operand3, size, variables);
    designateFunctionLocalVariablesRecursive(currentNode->operand4, size, variables);
}



void stc::Ast::checkFunctionsCall()
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
        designateFunctionCallArgumentsRecursive(node->operand1, &types);




        if (!m_globalFunctions.contains(function_name))
        {
            m_functions.get(function_name, types);
        }
    }

    check_functions_call_recursive(node->operand1);
    check_functions_call_recursive(node->operand2);
    check_functions_call_recursive(node->operand3);
    check_functions_call_recursive(node->operand4);
}

void stc::Ast::designateFunctionCallArgumentsRecursive(stc::Node* currentNode,
                                                       std::vector<stc::VariableType>* arguments)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::FUNCTION_CALL)
        return;


    if (currentNode->type == NodeType::FUNCTION_ARGS)
    {
        VariableType type;

        if (currentNode->operand1->type == NodeType::NUMBER_CONST)
        {
            type = VariableType::NUMBER;
        }
        else if (currentNode->operand1->type == NodeType::BOOLEAN_CONST)
        {
            type = VariableType::BOOLEAN;
        }
        else if (currentNode->operand1->type == NodeType::STRING_CONST)
        {
            type = VariableType::STRING;
        }
        else
        {
            giveExpressionTypeRecursive(currentNode->operand1, type);
        }


        arguments->push_back(type);
    }

    designateFunctionCallArgumentsRecursive(currentNode->operand1, arguments);
    designateFunctionCallArgumentsRecursive(currentNode->operand2, arguments);
}

void stc::Ast::giveExpressionTypeRecursive(stc::Node* currentNode, VariableType& type)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::ADD ||
        currentNode->type == NodeType::SUB ||
        currentNode->type == NodeType::MUL ||
        currentNode->type == NodeType::DIV)
    {
        auto op1 = currentNode->operand1;
        auto op2 = currentNode->operand2;

        VariableType op1_type = VariableType::UNDEFINED;
        VariableType op2_type = VariableType::UNDEFINED;

        giveExpressionTypeRecursive(op1, op1_type);
        giveExpressionTypeRecursive(op2, op2_type);

        auto is_reducible = Variable::isTypesReducible(op1_type, op2_type);

        if (!is_reducible)
        {
            string op1_type_str = Variable::variableTypeToString(op1_type);
            string op2_type_str = Variable::variableTypeToString(op2_type);

            string action = Node::nodeTypeToString(currentNode->type);

            error("Operator " + action + " cannot be applied to types '" + op1_type_str + "' and '" + op2_type_str + "'.");
        }

        type = op1_type;
    }
    else if (currentNode->type == NodeType::UNARY_MINUS ||
             currentNode->type == NodeType::UNARY_PLUS)
    {
        auto op1 = currentNode->operand1;

        VariableType op1_type = VariableType::UNDEFINED;
        giveExpressionTypeRecursive(op1, op1_type);

        type = VariableType::BOOLEAN;
    }
    else if (currentNode->type == NodeType::USING_VARIABLE ||
             currentNode->type == NodeType::NUMBER_CONST ||
             currentNode->type == NodeType::BOOLEAN_CONST ||
             currentNode->type == NodeType::STRING_CONST)
    {
        type = variableTypeOfNode(currentNode);
    }
    else if (currentNode->type == NodeType::FUNCTION_CALL)
    {
        auto function_name = any_cast<string>(currentNode->value);

        vector<VariableType> types;
        designateFunctionCallArgumentsRecursive(currentNode->operand1, &types);

        Function* func = nullptr;

        if (!m_globalFunctions.contains(new Function(function_name, VariableType::UNDEFINED, types, nullptr)))
        {
            func = m_functions.get(function_name, types);
        }
        else
        {
            func = m_globalFunctions.get(function_name, types);
        }

        type = func->returnType();
        return;
    }
    else if (currentNode->type == NodeType::NEW)
    {
        currentNode = currentNode->operand1;

        auto function_name = any_cast<string>(currentNode->value);
        vector<VariableType> types;

        designateFunctionCallArgumentsRecursive(currentNode, &types);

        Function* func = nullptr;

        if (!m_globalFunctions.contains(new Function(function_name, VariableType::ANY, types, nullptr)))
        {
            func = m_functions.get(function_name, types);
        }
        else
        {
            func = m_globalFunctions.get(function_name, types);
        }

        type = func->returnType();
        return;
    }
    else if (currentNode->type == NodeType::INITIALIZER)
    {
        type = VariableType::ANY;
        return;
    }
    else if (currentNode->type == NodeType::INDEX_CAPTURE)
    {
        auto array_name = any_cast<string>(currentNode->operand1->value);
        auto block_id = currentNode->operand1->scopeId();

        auto array_type = m_allVariables.getByName(array_name)->type();

        type = Variable::typeOfArrayType(array_type);
        return;
    }
    else if (Node::isComparisonOperator(currentNode->type))
    {
        type = VariableType::BOOLEAN;
        return;
    }


    giveExpressionTypeRecursive(currentNode->operand1, type);
    giveExpressionTypeRecursive(currentNode->operand2, type);
    giveExpressionTypeRecursive(currentNode->operand3, type);
    giveExpressionTypeRecursive(currentNode->operand4, type);
}

void stc::Ast::error(const string& message)
{
    throw std::logic_error("Semantic error! " + message);
}


stc::VariableType stc::Ast::variableTypeOfNode(stc::Node* currentNode)
{
    if (currentNode->type == NodeType::NUMBER_CONST)
    {
        return VariableType::NUMBER;
    }
    else if (currentNode->type == NodeType::BOOLEAN_CONST)
    {
        return VariableType::BOOLEAN;
    }
    else if (currentNode->type == NodeType::STRING_CONST)
    {
        return VariableType::STRING;
    }
    else if (currentNode->type == NodeType::USING_VARIABLE)
    {
        auto variable_name = any_cast<string>(currentNode->value);
        auto variable_block_id = currentNode->scopeId();

        auto variable = m_allVariables.getByNameAndScopeId(variable_name, variable_block_id);

        return variable->type();
    }
    else if (currentNode->type == NodeType::INDEX_CAPTURE)
    {
        auto variable_name = any_cast<string>(currentNode->operand1->value);
        auto variable_block_id = currentNode->operand1->scopeId();

        auto variable = m_allVariables.getByNameAndScopeId(variable_name, variable_block_id);

        return Variable::typeOfArrayType(variable->type());
    }


    return VariableType::UNDEFINED;
}

void stc::Ast::checkExpression()
{
    check_expression_recursive(m_root);
}

void stc::Ast::check_expression_recursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::EXPRESSION)
    {
        if (currentNode->operand1 != nullptr && currentNode->operand1->type == NodeType::SET)
        {
            auto lvalue = currentNode->operand1->operand1;
            if (lvalue->type != NodeType::USING_VARIABLE &&
                lvalue->type != NodeType::VARIABLE_DECLARATION &&
                lvalue->type != NodeType::CONSTANT_DECLARATION &&
                lvalue->type != NodeType::INDEX_CAPTURE)
            {
                error("Invalid assignment!");
            }


            VariableType lvalue_type = variableTypeOfNode(lvalue);

            auto variableType = VariableType::VOID;

            auto setNode = currentNode->operand1;

            if (setNode->operand1->type == NodeType::VARIABLE_DECLARATION ||
                setNode->operand1->type == NodeType::CONSTANT_DECLARATION)
            {
                if (setNode->operand1->operand1 == nullptr)
                {
                    giveExpressionTypeRecursive(setNode->operand2, variableType);
                }
                else
                {
                    variableType = Variable::variableTypeFromTokenType(
                            std::any_cast<TokenType>(setNode->operand1->operand1->value)
                    );
                }

                lvalue_type = variableType;
            }


            auto start_node = currentNode->operand1->operand2;
            VariableType expression_type;
            giveExpressionTypeRecursive(start_node, expression_type);

            if (!Variable::isTypesReducible(lvalue_type, expression_type))
            {
                string lvalue_type_str = Variable::variableTypeToString(lvalue_type);
                string expression_type_str = Variable::variableTypeToString(expression_type);

                error("Cannot assign a variable of type '" + lvalue_type_str + "' to '" + expression_type_str + "'!");
            }
        }


    }


    check_expression_recursive(currentNode->operand1);
    check_expression_recursive(currentNode->operand2);
    check_expression_recursive(currentNode->operand3);
    check_expression_recursive(currentNode->operand4);
}

void stc::Ast::printVariableTable()
{
    cout << "-- Started print variable table\n";
    cout << "{" << endl;
    m_allVariables.print();
    if (m_allVariables.raw().empty())
    {
        cout << "   empty" << endl;
    }
    cout << "}" << endl;
    cout << "\n";
}

void stc::Ast::printFunctionsTable()
{
    cout << "-- Started print function table\n";
    cout << "{" << endl;
    m_functions.print();
    if (m_functions.raw().empty())
    {
        cout << "   empty" << endl;
    }
    cout << "}" << endl;
    cout << "\n";
}

void stc::Ast::printImportVariableTable()
{
    cout << "-- Started print import variable table\n";
    cout << "{" << endl;
    m_importVariables.print();
    if (m_importVariables.raw().empty())
    {
        cout << "   empty" << endl;
    }
    cout << "}" << endl;
    cout << "\n";
}

void stc::Ast::printImportFunctionsTable()
{
    cout << "-- Started print import functions table\n";
    cout << "{" << endl;
    m_importFunctions.print();
    if (m_importFunctions.raw().empty())
    {
        cout << "   empty" << endl;
    }
    cout << "}" << endl;
    cout << "\n";
}

void stc::Ast::identifyArrays()
{
    designate_arrays_recursive(m_root);
}

void stc::Ast::designate_arrays_recursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::SET &&
        currentNode->operand1 != nullptr &&
        currentNode->operand2 != nullptr)
    {
        if (currentNode->operand1->type == NodeType::VARIABLE_DECLARATION)
        {
            auto arrayNode = currentNode->operand1;
            auto arrayTypeNode = arrayNode->operand1;

            auto arrayType = VariableType::VOID;
            if (currentNode->operand1->operand1 == nullptr)
            {
                giveExpressionTypeRecursive(currentNode->operand2, arrayType);
            }
            else
            {
                arrayType = Variable::variableTypeFromTokenType(
                        std::any_cast<TokenType>(arrayTypeNode->value)
                );
            }

            auto scopeId = arrayNode->scopeId();

            auto arrayName = any_cast<string>(arrayNode->value);
            auto variable = m_allVariables.getByNameAndScopeId(arrayName, scopeId);

            auto initializerNode = currentNode->operand2;

            if (Variable::isArrayType(arrayType))
            {
                if (initializerNode->type == NodeType::INITIALIZER)
                {

                    vector<VariableValue> arrayValues;
                    auto arrayValueType = Variable::typeOfArrayType(arrayType);
                    designateArrayInitializeListRecursive(initializerNode, arrayValues, arrayValueType);


                    m_arrays.emplace_back(arrayName, arrayValues.size(), arrayValues, variable);
                }
                else if (initializerNode->type == NodeType::NEW)
                {
                    auto calling_function_node = initializerNode->operand1;
                    auto calling_function_name = any_cast<string>(calling_function_node->value);


                    if (calling_function_name == "Array")
                    {
                        auto temp_array_size = (size_t)any_cast<number>(calling_function_node->operand1->operand1->value);

                        m_arrays.push_back(Array(arrayName, temp_array_size, {}, variable));
                    }
                    else
                    {
                        error("To initialize an array using the new operator, you must use the Array function!");
                    }
                }
            }
        }

    }
    else if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION_ARG)
    {
        auto block_id = currentNode->scopeId();
        auto array_name = any_cast<string>(currentNode->value);
        auto variable = m_allVariables.getByNameAndScopeId(array_name, block_id);



        auto var_node = currentNode;
        auto var_type_node = var_node->operand1;
        auto var_type = (VariableType) any_cast<TokenType>(var_type_node->value);

        auto var_name = any_cast<string>(var_node->value);

        if (Variable::isArrayType(var_type))
        {
            m_arrays.push_back(Array(var_name, 0, {}, variable));
        }
    }


    designate_arrays_recursive(currentNode->operand1);
    designate_arrays_recursive(currentNode->operand2);
    designate_arrays_recursive(currentNode->operand3);
    designate_arrays_recursive(currentNode->operand4);
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

void stc::Ast::designateArrayInitializeListRecursive(Node* node, vector<VariableValue>& list, VariableType array_type)
{
    if (node == nullptr)
        return;

    if (node->type == NodeType::INITIALIZER_LIST)
    {
        VariableType value_type = VariableType::UNDEFINED;
        giveExpressionTypeRecursive(node->operand2, value_type);


        auto value_node = node->operand2;

        auto raw_value_node = value_node;
        if (value_node->type == NodeType::UNARY_MINUS ||
            value_node->type == NodeType::UNARY_PLUS ||
            value_node->type == NodeType::UNARY_EXCLAMATION)
        {
            value_node = value_node->operand1;
        }


        if (!Variable::isTypesReducible(value_type, array_type))
        {
            string lvalue_type_str = Variable::variableTypeToString(value_type);
            string expression_type_str = Variable::variableTypeToString(array_type);

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
                error("Some not expected!");
        }

        list.push_back(value);
    }


    designateArrayInitializeListRecursive(node->operand1, list, array_type);
    designateArrayInitializeListRecursive(node->operand2, list, array_type);
    designateArrayInitializeListRecursive(node->operand3, list, array_type);
}

void stc::Ast::print() const noexcept
{
    cout << "-- Started print AST" << endl;

    print(m_root, 0);

    cout << "\n\n";
}

void stc::Ast::checkImports()
{
    checkImportsRecursive(m_root);
}

void stc::Ast::checkImportsRecursive(Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::IMPORT)
    {
        auto importFilePath = any_cast<string>(currentNode->operand2->value);

        importFilePath.pop_back();
        importFilePath.erase(importFilePath.begin());

        auto path = m_filePath.remove_filename();
        path = path / importFilePath;
        path = path.lexically_normal();
        path.replace_extension(".ts");


        if (!fs::exists(path))
        {
            error("Cannot open file: \"" + importFilePath + "\", full path: " + path.string());
        }
    }

    checkImportsRecursive(currentNode->operand1);
    checkImportsRecursive(currentNode->operand2);
    checkImportsRecursive(currentNode->operand3);
    checkImportsRecursive(currentNode->operand4);
}

void stc::Ast::handleImports()
{
    handleImportsRecursive(m_root);
}

void stc::Ast::handleImportsRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::IMPORT)
    {
        vector<string> importNames;
        identifyAllImportName(currentNode, importNames);

        if (importNames.empty())
            return;


        auto importFilePath = any_cast<string>(currentNode->operand2->value);

        importFilePath.pop_back();
        importFilePath.erase(importFilePath.begin());

        auto path = m_filePath.remove_filename();
        path = path / importFilePath;
        path = path.lexically_normal();
        path.replace_extension(".ts");


        auto icm = new ICM(path.string(), "");

        icm->compile(false, false, false, true);

        auto ast = icm->ast();
        const auto& astExportTables = ast->exportTable();

        vector<string> extendedImportNames;
        for (const auto& importName : importNames)
        {
            if (!astExportTables.contains(importName))
            {
                error("Module '\"" + importFilePath + "\"' declares '" + (importName + "' locally, but it is not exported."));
            }

            auto exportElement = astExportTables.get(importName);
            auto typeOfExportElement = ExportTable::typeOfValue(exportElement);

            if (typeOfExportElement == ExportValueType::FUNCTION)
            {
                auto newFunction = new Function("", ReturnType::VOID, {}, nullptr);
                *newFunction = *ast->m_functions.get(importName);


                auto functionNode = newFunction->implementationNode();
                vector<string> callFunctionNamesInFunction;
                identifyAllCallFunctionsNameInFunction(functionNode, callFunctionNamesInFunction);

                extendedImportNames.push_back(importName);

                for (const auto& functionName : callFunctionNamesInFunction)
                {
                    if (std::find(extendedImportNames.begin(), extendedImportNames.end(), functionName)
                        == extendedImportNames.end())
                    {
                        extendedImportNames.push_back(functionName);
                    }
                }
            }
            else if (typeOfExportElement == ExportValueType::VARIABLE)
            {
                extendedImportNames.push_back(importName);
            }
        }

        for (const auto& importName : extendedImportNames)
        {
            auto exportElement = astExportTables.get(importName);
            auto typeOfExportElement = ExportTable::typeOfValue(exportElement);

            if (typeOfExportElement == ExportValueType::VARIABLE)
            {
                auto newVariable = new Variable("", VariableType::VOID, -1);
                *newVariable = *ast->m_allVariables.getByName(importName);

                m_importVariables.add(newVariable);
            }
            else if (typeOfExportElement == ExportValueType::FUNCTION)
            {
                auto newFunction = new Function("", ReturnType::VOID, {}, nullptr);
                *newFunction = *ast->m_functions.get(importName);

                m_importFunctions.add(newFunction);
            }
        }

        addImportFunctionsInTree();

        delete icm;
    }

    handleImportsRecursive(currentNode->operand1);
    handleImportsRecursive(currentNode->operand2);
    handleImportsRecursive(currentNode->operand3);
    handleImportsRecursive(currentNode->operand4);
}

void stc::Ast::identifyAllImportName(stc::Node* currentNode, std::vector<std::string>& importNames)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::IMPORT_LIST_ELEMENT)
    {
        auto importElementName = any_cast<string>(currentNode->value);
        importNames.push_back(importElementName);
    }

    identifyAllImportName(currentNode->operand1, importNames);
    identifyAllImportName(currentNode->operand2, importNames);
    identifyAllImportName(currentNode->operand3, importNames);
    identifyAllImportName(currentNode->operand4, importNames);
}

void stc::Ast::checkExports()
{
    checkExportsRecursive(m_root);
}

void stc::Ast::checkExportsRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::EXPORT)
    {
        vector<string> exportNames;
        identifyAllExportName(currentNode, exportNames);

        for (const auto& exportName : exportNames)
        {
            auto isFunction = m_functions.contains(exportName);
            auto isVariable = m_allVariables.contains(exportName);


            if (!isFunction && !isVariable)
            {
                error("Cannot find name \'" + exportName + "\"");
            }
        }
    }

    checkExportsRecursive(currentNode->operand1);
    checkExportsRecursive(currentNode->operand2);
    checkExportsRecursive(currentNode->operand3);
    checkExportsRecursive(currentNode->operand4);
}

void stc::Ast::identifyAllExportName(stc::Node* currentNode, std::vector<std::string>& exportNames)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::EXPORT_LIST_ELEMENT)
    {
        auto exportElementName = any_cast<string>(currentNode->value);
        exportNames.push_back(exportElementName);
    }

    identifyAllExportName(currentNode->operand1, exportNames);
    identifyAllExportName(currentNode->operand2, exportNames);
    identifyAllExportName(currentNode->operand3, exportNames);
    identifyAllExportName(currentNode->operand4, exportNames);
}

void stc::Ast::handleExports()
{
    handleExportsRecursive(m_root);
}

void stc::Ast::handleExportsRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::EXPORT)
    {
        vector<string> exportNames;
        identifyAllExportName(currentNode, exportNames);

        vector<string> extendedExportNames;
        for (const auto& exportName : exportNames)
        {
            auto isFunction = m_functions.contains(exportName);

            if (isFunction)
            {
                auto function = m_functions.get(exportName);
                auto functionNode = function->implementationNode();

                vector<string> callFunctionNamesInFunction;
                identifyAllCallFunctionsNameInFunction(functionNode, callFunctionNamesInFunction);

                extendedExportNames.push_back(exportName);

                for (const auto& functionName : callFunctionNamesInFunction)
                {
                    if (std::find(extendedExportNames.begin(), extendedExportNames.end(), functionName)
                                                                            == extendedExportNames.end())
                    {
                        extendedExportNames.push_back(functionName);
                    }
                }
            }
            else
            {
                extendedExportNames.push_back(exportName);
            }
        }



        for (const auto& exportName : extendedExportNames)
        {
            auto isFunction = m_functions.contains(exportName);
            auto isVariable = m_allVariables.contains(exportName);

            if (isFunction)
            {
                auto function = m_functions.get(exportName);
                m_exportTable.add(exportName, function);
            }
            else if (isVariable)
            {
                auto variable = m_allVariables.getByName(exportName);
                m_exportTable.add(exportName, variable);
            }
        }
    }

    handleExportsRecursive(currentNode->operand1);
    handleExportsRecursive(currentNode->operand2);
    handleExportsRecursive(currentNode->operand3);
    handleExportsRecursive(currentNode->operand4);
}

const stc::ExportTable& stc::Ast::exportTable() const
{
    return m_exportTable;
}

void stc::Ast::addImportVariables()
{
    for (const auto& variable : m_importVariables.raw())
    {
        m_allVariables.add(variable);
        m_globalVariables.add(variable);
    }
}

void stc::Ast::addImportFunctionsInTree()
{
    auto statementListNode = (Node*)nullptr;

    for (const auto& function : m_importFunctions.raw())
    {
        auto functionNode = function->implementationNode();


        auto functionNewNode = copySubTree(functionNode);
        auto statementNode = new Node(NodeType::STATEMENT, 0, functionNewNode);
        statementListNode = new Node(NodeType::STATEMENT_LIST, 0, statementListNode, statementNode);
    }

    auto nodeForInsert = m_root->operand1->operand1;

    statementListNode = new Node(NodeType::STATEMENT_LIST, 0, statementListNode, nodeForInsert);

    auto statementNode = new Node(NodeType::STATEMENT, 0, statementListNode);

    m_root->operand1 = statementNode;


    m_importFunctions.clear();
}

stc::Node* stc::Ast::copySubTree(stc::Node* currentNode)
{
    return copySubTreeRecursive(currentNode);
}

stc::Node* stc::Ast::copySubTreeRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return nullptr;

    auto operand1 = copySubTreeRecursive(currentNode->operand1);
    auto operand2 = copySubTreeRecursive(currentNode->operand2);
    auto operand3 = copySubTreeRecursive(currentNode->operand3);
    auto operand4 = copySubTreeRecursive(currentNode->operand4);



    auto returnNode = new Node(NodeType::IDENTIFIER);

    *returnNode = *currentNode;

    returnNode->operand1 = operand1;
    returnNode->operand2 = operand2;
    returnNode->operand3 = operand3;
    returnNode->operand4 = operand4;

    return returnNode;
}

void stc::Ast::identifyAllCallFunctionsNameInFunction(stc::Node* currentNode, std::vector<std::string>& functions)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::FUNCTION_CALL)
    {
        auto functionCallName = any_cast<string>(currentNode->value);
        functions.push_back(functionCallName);
        return;
    }

    identifyAllCallFunctionsNameInFunction(currentNode->operand1, functions);
    identifyAllCallFunctionsNameInFunction(currentNode->operand2, functions);
    identifyAllCallFunctionsNameInFunction(currentNode->operand3, functions);
    identifyAllCallFunctionsNameInFunction(currentNode->operand4, functions);
}

void stc::Ast::identifyGlobalVariablesRecursive(Node* currentNode, VariableTable& globalVariablesTable)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION)
        return;

    if (currentNode->type == NodeType::VARIABLE_DECLARATION ||
        currentNode->type == NodeType::CONSTANT_DECLARATION)
    {
        auto variableName = any_cast<string>(currentNode->value);
        auto scopeId = currentNode->scopeId();
        auto variable = m_allVariables.getByNameAndScopeId(variableName, scopeId);

        variable->isGlobal(true);

        globalVariablesTable.add(variable);
        return;
    }

    identifyGlobalVariablesRecursive(currentNode->operand1, globalVariablesTable);
    identifyGlobalVariablesRecursive(currentNode->operand2, globalVariablesTable);
    identifyGlobalVariablesRecursive(currentNode->operand3, globalVariablesTable);
    identifyGlobalVariablesRecursive(currentNode->operand4, globalVariablesTable);
}

void stc::Ast::deduceVariableType()
{
    deduceVariableTypeRecursive(m_root);
}

void stc::Ast::deduceVariableTypeRecursive(Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::SET &&
        (currentNode->operand1->type == NodeType::VARIABLE_DECLARATION ||
         currentNode->operand1->type == NodeType::CONSTANT_DECLARATION) &&
            currentNode->operand1->operand1 == nullptr)
    {
        VariableType type;
        giveExpressionTypeRecursive(currentNode->operand2, type);

        auto typeNode = new Node(NodeType::VARIABLE_TYPE, TokenType(type));
        currentNode->operand1->operand1 = typeNode;
    }

    deduceVariableTypeRecursive(currentNode->operand1);
    deduceVariableTypeRecursive(currentNode->operand2);
    deduceVariableTypeRecursive(currentNode->operand3);
    deduceVariableTypeRecursive(currentNode->operand4);
}



