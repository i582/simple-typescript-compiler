#include "Ast.h"

stc::Ast::Ast()
{
    this->m_countScopes = 1;
}

stc::Ast::~Ast()
{
    m_variableTables.clear();
}

void stc::Ast::print(stc::Node* currentNode, size_t level) const
{
    if (currentNode != nullptr)
    {
        for (size_t i = 0; i < level; i++) cout << "  ";

        cout << "+-";

        switch (currentNode->type)
        {
            case NodeType::VARIABLE_DECLARATION:
            {
                cout << "Variable Declaration '";
                cout  << std::any_cast<string>(currentNode->value) << "'";

                auto scopeId = currentNode->scopeId();
                cout << " (declared in scope: " << scopeId << ")";
                break;
            }
            case NodeType::USING_VARIABLE:
            {
                cout << "Using Variable '";
                auto scopeId = currentNode->scopeId();
                auto variableName = any_cast<string>(currentNode->value);

                cout << variableName << "' ";
                cout << " (declared in scope: " << scopeId << ")";
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
                cout << "non terminal name ";

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
                cout << "function call ";
                cout << std::any_cast<string>(currentNode->value);
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
                cout << "" << std::any_cast<string>(currentNode->value);
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
                cout << "" << (int)std::any_cast<TokenType>(currentNode->value);
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
            case NodeType::CLASS_IMPLEMENTATION:
            {
                cout << "Class Definition '";
                cout << std::any_cast<string>(currentNode->value) << "'";
                break;
            }
            case NodeType::CLASS_IMPLEMENTATION_FIELD:
            {
                cout << "Class Definition Field '";
                cout << std::any_cast<string>(currentNode->value) << "'";
                break;
            }
            case NodeType::CLASS_IMPLEMENTATION_FUNCTION:
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
                cout << Class::modifierToString(std::any_cast<ClassVisibilityModifier>(currentNode->value)) << "'";
                break;
            }
            case NodeType::DECLARATION_TYPE:
            {
                cout << "Declaration Type '";
                std::any_cast<Type>(currentNode->value).print();
                cout << "'";
                break;
            }
            case NodeType::FUNCTION_IMPLEMENTATION_NEW:
            {
                cout << "Function Implementation '";
                cout << std::any_cast<string>(currentNode->value) << "'";
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
                cout << std::any_cast<string>(currentNode->value) << "'";
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
                cout << std::any_cast<string>(currentNode->value) << "'";
                break;
            }
            case NodeType::INTERFACE_FUNCTION_DEFINITION:
            {
                cout << "Interface Function Definition '";
                cout << std::any_cast<string>(currentNode->value) << "'";
                break;
            }
        }

        if (currentNode->scopeId() != -1u)
        {
            cout << " (scope-id: " << currentNode->scopeId() << ")";
        }


        cout << "" << endl;

        print(currentNode->operand1, level + 1);
        print(currentNode->operand2, level + 1);
        print(currentNode->operand3, level + 1);
        print(currentNode->operand4, level + 1);
    }
}

void stc::Ast::identifyScopes()
{
    identifyScopesRecursive(m_root->operand1, nullptr);
    identifyScopesRecursive(m_root->operand2, nullptr);
    identifyScopesRecursive(m_root->operand3, nullptr);
    identifyScopesRecursive(m_root->operand4, nullptr);
}

void stc::Ast::identifyScopesRecursive(Node* currentNode, Node* currentScopeNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::STATEMENT)
    {
        m_allScopeNode.emplace_back(currentScopeNode, currentNode);
        currentScopeNode = currentNode;
    }

    identifyScopesRecursive(currentNode->operand1, currentScopeNode);
    identifyScopesRecursive(currentNode->operand2, currentScopeNode);
    identifyScopesRecursive(currentNode->operand3, currentScopeNode);
    identifyScopesRecursive(currentNode->operand4, currentScopeNode);
}

void stc::Ast::markAllScopes()
{
    markAllScopesRecursive(m_root->operand1);
    markAllScopesRecursive(m_root->operand2);
    markAllScopesRecursive(m_root->operand3);
    markAllScopesRecursive(m_root->operand4);
}

void stc::Ast::markAllScopesRecursive(Node* currentNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::STATEMENT)
    {
        currentNode->setScopeId(m_countScopes);
        ++m_countScopes;
    }
    else if (currentNode->type == NodeType::IF ||
             currentNode->type == NodeType::IF_ELSE ||
             currentNode->type == NodeType::WHILE ||
             currentNode->type == NodeType::WHILE ||
             currentNode->type == NodeType::DO_WHILE)
    {
        currentNode->operand2->setScopeId(m_countScopes);
        ++m_countScopes;
    }
    else if (currentNode->type == NodeType::FOR)
    {
        currentNode->operand4->setScopeId(m_countScopes);
        ++m_countScopes;
    }
    else if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION)
    {
        currentNode->operand3->setScopeId(m_countScopes);
        ++m_countScopes;
    }
    else if (currentNode->type == NodeType::CLASS_IMPLEMENTATION)
    {
        currentNode->operand1->setScopeId(m_countScopes);
        ++m_countScopes;
    }
    else if (currentNode->type == NodeType::CLASS_IMPLEMENTATION_FUNCTION)
    {
        currentNode->operand1->setScopeId(m_countScopes);
        ++m_countScopes;
    }

    markAllScopesRecursive(currentNode->operand1);
    markAllScopesRecursive(currentNode->operand2);
    markAllScopesRecursive(currentNode->operand3);
    markAllScopesRecursive(currentNode->operand4);
}

void stc::Ast::markBreakContinueOperators()
{
    for (auto& [parent_stmt, stmt] : m_allScopeNode)
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
        current_node->setScopeId(current_block);
    }


    mark_break_continue_operators_recursive(current_node->operand1, current_block);
    mark_break_continue_operators_recursive(current_node->operand2, current_block);
    mark_break_continue_operators_recursive(current_node->operand3, current_block);
    mark_break_continue_operators_recursive(current_node->operand4, current_block);
}

void stc::Ast::markReturnOperators()
{
    for (auto& [parent_stmt, stmt] : m_allScopeNode)
    {
        if (stmt->operand1 != nullptr &&
            stmt->operand1->type == NodeType::FUNCTION_IMPLEMENTATION)
        {
            auto function_name = any_cast<string>(stmt->operand1->value);
            mark_return_operator_recursive(stmt->operand1->operand3, stmt->scopeId(), function_name);
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
        current_node->setScopeId(current_block);

        //size_t size_of_arguments = m_functions.get_function(function_name)->argumentsSizeInByte();

        //current_node->value = size_of_arguments;
    }


    mark_return_operator_recursive(current_node->operand1, current_block, function_name);
    mark_return_operator_recursive(current_node->operand2, current_block, function_name);
    mark_return_operator_recursive(current_node->operand3, current_block, function_name);
    mark_return_operator_recursive(current_node->operand4, current_block, function_name);
}


void stc::Ast::identifyVariables()
{
    m_variableTables.reserve(m_allScopeNode.size());

    for (auto& [parentScope, currentScope] : m_allScopeNode)
    {
        auto scopeId = currentScope->scopeId();
        auto newVariableTable = new VariableTable(scopeId);


        m_variableTables.push_back(newVariableTable);


        if (parentScope != nullptr)
        {
            newVariableTable->setParentTable(parentScope->variables);
        }


        currentScope->variables = newVariableTable;

        identifyVariablesRecursive(currentScope->operand1, newVariableTable);
    }
}

void stc::Ast::identifyGlobalVariables()
{
    for (const auto& variable : m_allVariables.raw())
    {
        if (variable.isGlobal())
        {
            m_globalVariables.add(variable);
        }
    }
}

void stc::Ast::identifyVariablesRecursive(stc::Node* currentNode, stc::VariableTable* variableTable)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::STATEMENT)
        return;



    if (currentNode->type == NodeType::VARIABLE_DECLARATION || currentNode->type == NodeType::CONSTANT_DECLARATION ||
        currentNode->type == NodeType::FUNCTION_IMPLEMENTATION_ARG || currentNode->type == NodeType::FUNCTION_IMPLEMENTATION_NEW_ARG ||
        currentNode->type == NodeType::CLASS_IMPLEMENTATION_FIELD)
    {
        auto variableName = any_cast<string>(currentNode->value);

        if (variableTable->contains(variableName))
        {
            cout << "ERROR: The variable '" << variableName << "' has already been declared!" << endl;
            throw std::logic_error("");
        }

        auto isConst = currentNode->type == NodeType::CONSTANT_DECLARATION;
        auto variableType = any_cast<Type>(currentNode->operand1->value);
        auto scopeId = variableTable->scopeId();


        auto newVariable = Variable
        (
            variableName,
            variableType,
            scopeId,
            isConst
        );

        currentNode->setScopeId(scopeId);


        variableTable->add(newVariable);
        m_allVariables.add(newVariable);

        return;
    }
    else if (currentNode->type == NodeType::USING_VARIABLE)
    {
        auto variableName = std::any_cast<string>(currentNode->value);


        if (!variableTable->containsGlobally(variableName))
        {
            cout << "ERROR: The name '" << variableName << "' is not declared!" << endl;
            throw std::logic_error("");
        }


        auto [scopeId, variable] = variableTable->getVariableAndScopeIdWhereItDeclared(variableName);

        /*
         * Устанавливаем текущему узлу, который описывает использование переменной, идентификатор блока равный
         * идентификатору блока в котором переменная была впервые объявлена, таким образом, для каждого использования
         * переменных будет описан идентифкатор блока, в которой она впервые объявлена
         */
        currentNode->setScopeId(scopeId);
    }


    identifyVariablesRecursive(currentNode->operand1, variableTable);
    identifyVariablesRecursive(currentNode->operand2, variableTable);
    identifyVariablesRecursive(currentNode->operand3, variableTable);
    identifyVariablesRecursive(currentNode->operand4, variableTable);
}




void stc::Ast::identifyFunctions()
{
    identifyFunctionsRecursive(m_allScopeNode[0].second->operand1);
}

void stc::Ast::identifyFunctionsRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION_NEW)
    {
        auto functionName = any_cast<string>(currentNode->value);
        auto returnType = any_cast<Type>(currentNode->operand1->value);


        vector<Type> argumentTypes;
        vector<Variable> arguments;
        identifyFunctionArgumentsRecursive(currentNode->operand2, argumentTypes, arguments);


        size_t localVariableSize = 0;
        identifyFunctionLocalVariablesRecursive(currentNode->operand3, localVariableSize);

        auto newFunction = Function(functionName, returnType, argumentTypes, localVariableSize);

        m_functions.add(newFunction);
    }

    identifyFunctionsRecursive(currentNode->operand1);
    identifyFunctionsRecursive(currentNode->operand2);
}

void stc::Ast::identifyFunctionArgumentsRecursive(stc::Node* currentNode, vector<Type>& argumentTypes,
                                                  vector<Variable>& arguments)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION_NEW_ARG)
    {
        auto argumentName = any_cast<string>(currentNode->value);
        auto scopeId = currentNode->scopeId();
        auto variable = m_allVariables.getByNameAndScopeId(argumentName, scopeId);

        auto type = variable.type();
        argumentTypes.push_back(type);

        variable.setIsArgument(true);
        arguments.push_back(variable);
    }

    identifyFunctionArgumentsRecursive(currentNode->operand1, argumentTypes, arguments);
    identifyFunctionArgumentsRecursive(currentNode->operand2, argumentTypes, arguments);
    identifyFunctionArgumentsRecursive(currentNode->operand3, argumentTypes, arguments);
    identifyFunctionArgumentsRecursive(currentNode->operand4, argumentTypes, arguments);
}

void stc::Ast::identifyFunctionLocalVariablesRecursive(stc::Node* currentNode, size_t& size)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::VARIABLE_DECLARATION ||
        currentNode->type == NodeType::CONSTANT_DECLARATION)
    {
        auto variableName = any_cast<string>(currentNode->value);
        auto scopeId = currentNode->scopeId();
        auto variable = m_allVariables.getByNameAndScopeId(variableName, scopeId);

        auto type = any_cast<Type>(currentNode->operand1->value);
        auto variableSize = type.countByte();

        size += variableSize;
        return;
    }


    identifyFunctionLocalVariablesRecursive(currentNode->operand1, size);
    identifyFunctionLocalVariablesRecursive(currentNode->operand2, size);
    identifyFunctionLocalVariablesRecursive(currentNode->operand3, size);
    identifyFunctionLocalVariablesRecursive(currentNode->operand4, size);
}




/*

v
void stc::Ast::check_const()
{
    for (auto& [parent_stmt, stmt] : m_allScopeNode)
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
    for (auto& [parent_stmt, stmt] : m_allScopeNode)
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
            auto variable = m_allVariables.getByName(variable_name);
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
            m_functions.get(function_name, types);
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
            func = m_functions.get(function_name, types);
        }
        else
        {
            func = m_global_functions.get_function(function_name, types);
        }

        type = func->returnType();
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
            func = m_functions.get(function_name, types);
        }
        else
        {
            func = m_global_functions.get_function(function_name, types);
        }

        type = func->returnType();
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

        auto array_type = m_allVariables.getByName(array_name)->type();

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

        auto variable = m_allVariables.getByNameAndScopeId(variable_name, variable_block_id);

        return variable->type();
    }
    else if (current_node->type == NodeType::INDEX_CAPTURE)
    {
        auto variable_name = any_cast<string>(current_node->operand1->value);
        auto variable_block_id = current_node->operand1->statement_id();

        auto variable = m_allVariables.getByNameAndScopeId(variable_name, variable_block_id);

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
            auto variable = m_allVariables.getByNameAndScopeId(array_name, block_id);

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
        auto variable = m_allVariables.getByNameAndScopeId(array_name, block_id);



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
*/

stc::Node* stc::Ast::get_stmt_by_id(size_t stmt_id)
{
    for (const auto& stmt : m_allScopeNode)
    {
        if (stmt.second->scopeId() == stmt_id)
        {
            return stmt.second;
        }
    }

    return nullptr;
}

void stc::Ast::printAllVariables()
{
    cout << "\n";
    cout << "Variable table\n";
    m_allVariables.print();
    cout << "\n";
}

void stc::Ast::printAllFunctions()
{
    cout << "\n";
    cout << "Functions table\n";
    m_functions.print();
    cout << "\n";
}

void stc::Ast::printAllClasses()
{
    cout << "\n";
    cout << "Classes table\n";
    m_classes.print();
    cout << "\n";
}

void stc::Ast::printAllInterfaces()
{
    cout << "\n";
    cout << "Interfaces table\n";
    m_interfaces.print();
    cout << "\n";
}


void stc::Ast::print() const noexcept
{
    print(m_root, 0);
}

void stc::Ast::identifyClasses()
{
    identifyClassesRecursive(m_allScopeNode[0].second);
}

void stc::Ast::identifyClassesRecursive(Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::CLASS_IMPLEMENTATION)
    {
        auto className = any_cast<string>(currentNode->value);
        auto scopeId = currentNode->operand1->scopeId();
        auto newClass = Class(className);

        VariableTable variables;
        identifyClassFieldsRecursive(currentNode, scopeId, variables);
        newClass.fields(variables);

        FunctionTable functions;
        identifyClassFunctionsRecursive(currentNode, scopeId, functions);
        newClass.functions(functions);

        m_classes.add(newClass);
        return;
    }

    identifyClassesRecursive(currentNode->operand1);
    identifyClassesRecursive(currentNode->operand2);
}

void stc::Ast::identifyClassFieldsRecursive(stc::Node* currentNode, size_t scopeId, VariableTable& table)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::CLASS_IMPLEMENTATION_FIELD)
    {
        auto fieldName = any_cast<string>(currentNode->value);
        auto fieldType = any_cast<Type>(currentNode->operand1->value);

        auto newField = Variable(fieldName, fieldType, scopeId);

        table.add(newField);
        return;
    }

    identifyClassFieldsRecursive(currentNode->operand1, scopeId, table);
    identifyClassFieldsRecursive(currentNode->operand2, scopeId, table);
    identifyClassFieldsRecursive(currentNode->operand3, scopeId, table);
    identifyClassFieldsRecursive(currentNode->operand4, scopeId, table);
}

void stc::Ast::identifyClassFunctionsRecursive(stc::Node* currentNode, size_t scopeId, stc::FunctionTable& table)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION_NEW)
    {
        auto functionName = any_cast<string>(currentNode->value);
        auto functionReturnType = any_cast<Type>(currentNode->operand1->value);


        vector<Type> argumentTypes;
        vector<Variable> arguments;
        identifyFunctionArgumentsRecursive(currentNode->operand2, argumentTypes, arguments);


        size_t localVariableSize = 0;
        identifyFunctionLocalVariablesRecursive(currentNode->operand3, localVariableSize);


        auto newFunction = Function(functionName, functionReturnType, argumentTypes, localVariableSize);


        table.add(newFunction);
        return;
    }

    identifyClassFunctionsRecursive(currentNode->operand1, scopeId, table);
    identifyClassFunctionsRecursive(currentNode->operand2, scopeId, table);
    identifyClassFunctionsRecursive(currentNode->operand3, scopeId, table);
    identifyClassFunctionsRecursive(currentNode->operand4, scopeId, table);
}

void stc::Ast::identifyInterfaces()
{
    identifyInterfacesRecursive(m_allScopeNode[0].second);
}

void stc::Ast::identifyInterfacesRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::INTERFACE_IMPLEMENTATION)
    {
        auto interfaceName = any_cast<string>(currentNode->value);
        auto scopeId = currentNode->operand1->scopeId();
        auto newInterface = Interface(interfaceName);


        FunctionTable functions;
        identifyInterfaceFunctionsRecursive(currentNode, scopeId, functions);
        newInterface.functions(functions);

        m_interfaces.add(newInterface);

        return;
    }

    identifyInterfacesRecursive(currentNode->operand1);
    identifyInterfacesRecursive(currentNode->operand2);
    identifyInterfacesRecursive(currentNode->operand3);
    identifyInterfacesRecursive(currentNode->operand4);
}

void stc::Ast::identifyInterfaceFunctionsRecursive(stc::Node* currentNode, size_t scopeId, stc::FunctionTable& table)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::INTERFACE_FUNCTION_DEFINITION)
    {
        auto functionName = any_cast<string>(currentNode->value);
        auto functionReturnType = any_cast<Type>(currentNode->operand1->value);


        vector<Type> argumentTypes;
        vector<Variable> arguments;
        identifyFunctionArgumentsRecursive(currentNode->operand2, argumentTypes, arguments);


        auto newFunction = Function(functionName, functionReturnType, argumentTypes, 0);


        table.add(newFunction);
        return;
    }

    identifyInterfaceFunctionsRecursive(currentNode->operand1, scopeId, table);
    identifyInterfaceFunctionsRecursive(currentNode->operand2, scopeId, table);
    identifyInterfaceFunctionsRecursive(currentNode->operand3, scopeId, table);
    identifyInterfaceFunctionsRecursive(currentNode->operand4, scopeId, table);
}


