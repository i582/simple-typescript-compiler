#include "Ast.h"
#include "../../ICM/icm.h"

stc::Ast::Ast(const path& filePath, bool debugMode)
{
    this->m_countScopes = 1;
    this->m_filePath = filePath;
    this->m_debugMode = debugMode;
}

void stc::Ast::print(stc::Node* currentNode, size_t level)
{
    if (currentNode == nullptr)
        return;

    for (size_t i = 0; i < level; ++i)
        Log::write("  ");



    Log::write("+-");

    switch (currentNode->type)
    {
        case NodeType::VARIABLE_DECLARATION:
        {
            Log::write("new var '");
            Log::write("" + std::any_cast<string>(currentNode->value) + "' ");

            auto scopeId = currentNode->scopeId();
            Log::write("(scope id: " + to_string(scopeId) + ")");
            break;
        }
        case NodeType::USING_VARIABLE:
        {
            Log::write("use var '");
            auto scopeId = currentNode->scopeId();
            auto variableName = any_cast<string>(currentNode->value);

            Log::write("" + variableName + "' ");
            Log::write("(declared in scope: "  + to_string(scopeId) + ")");
            break;
        }
        case NodeType::VARIABLE_TYPE:
        {
            Log::write("var type ");
            Log::write("'" + Variable::variableTypeToString((VariableType)std::any_cast<TokenType>(currentNode->value)) + "'");
            break;
        }
        case NodeType::CONSTANT_DECLARATION:
        {
            Log::write("new const ");
            Log::write(std::any_cast<string>(currentNode->value));
            break;
        }
        case NodeType::USING_CONSTANT:
        {
            Log::write("use const ");
            Log::write(std::any_cast<string>(currentNode->value));
            break;
        }
        case NodeType::NUMBER_CONST:
        {
            Log::write("number const ");
            Log::write(to_string(std::any_cast<number>(currentNode->value)));
            break;
        }
        case NodeType::BOOLEAN_CONST:
        {
            Log::write("boolean const ");
            Log::write(to_string(std::any_cast<int>(currentNode->value)));
            break;
        }
        case NodeType::ADD:
        {
            Log::write("add ");
            break;
        }
        case NodeType::SUB:
        {
            Log::write("sub ");
            break;
        }
        case NodeType::MUL:
        {
            Log::write("mul ");
            break;
        }
        case NodeType::DIV:
        {
            Log::write("div ");
            break;
        }
        case NodeType::LESS:
        {
            Log::write("less ");
            break;
        }
        case NodeType::GREATER:
        {
            Log::write("greater ");
            break;
        }
        case NodeType::EQUAL:
        {
            Log::write("equal ");
            break;
        }
        case NodeType::NOT_EQUAL:
        {
            Log::write("not equal ");
            break;
        }
        case NodeType::LESS_EQUAL:
        {
            Log::write("less equal ");
            break;
        }
        case NodeType::GREATER_EQUAL:
        {
            Log::write("greater equal ");
            break;
        }
        case NodeType::FOR:
        {
            Log::write("for ");
            break;
        }
        case NodeType::WHILE:
        {
            Log::write("while ");
            break;
        }
        case NodeType::BREAK:
        {
            Log::write("break ");
            break;
        }
        case NodeType::CONTINUE:
        {
            Log::write("continue ");
            break;
        }
        case NodeType::IF:
        {
            Log::write("if ");
            break;
        }
        case NodeType::IF_ELSE:
        {
            Log::write("if else ");
            break;
        }
        case NodeType::IDENTIFIER:
        {
            Log::write("identifier ");

            Log::write(std::any_cast<string>(currentNode->value));
            break;
        }
        case NodeType::BEFORE_INC:
        {
            Log::write("before inc ");
            break;
        }
        case NodeType::BEFORE_DEC:
        {
            Log::write("before dec ");
            break;
        }
        case NodeType::AFTER_INC:
        {
            Log::write("after inc ");
            break;
        }
        case NodeType::AFTER_DEC:
        {
            Log::write("after dec ");
            break;
        }
        case NodeType::UNARY_PLUS:
        {
            Log::write("unary + ");
            break;
        }
        case NodeType::UNARY_MINUS:
        {
            Log::write("unary - ");
            break;
        }
        case NodeType::UNARY_EXCLAMATION:
        {
            Log::write("unary ! ");
            break;
        }
        case NodeType::LOGICAL_AND:
        {
            Log::write("AND ");
            break;
        }
        case NodeType::LOGICAL_OR:
        {
            Log::write("OR ");
            break;
        }
        case NodeType::SET:
        {
            Log::write("set ");
            break;
        }
        case NodeType::INDEX_CAPTURE:
        {
            Log::write("index capture ");
            break;
        }
        case NodeType::FUNCTION_CALL:
        {
            Log::write("function call '");
            Log::write(std::any_cast<string>(currentNode->value) + "' ");
            break;
        }
        case NodeType::FUNCTION_ARG:
        {
            Log::write("function arg ");
            break;
        }
        case NodeType::EXPRESSION:
        {
            Log::write("expr ");
            break;
        }
        case NodeType::CONST_EXPRESSION:
        {
            Log::write("const expr ");
            break;
        }
        case NodeType::STATEMENT:
        {
            Log::write("stmt ");
            break;
        }
        case NodeType::SEQ_STATEMENT:
        {
            Log::write("seq ");
            break;
        }
        case NodeType::STATEMENT_LIST:
        {
            Log::write("seq ");
            break;
        }
        case NodeType::PROGRAM:
        {
            Log::write("prog ");
            break;
        }
        case NodeType::DO_WHILE:
        {
            Log::write("do (while) ");
            break;
        }
        case NodeType::INITIALIZER:
        {
            Log::write("initializer ");
            break;
        }
        case NodeType::INITIALIZER_LIST:
        {
            Log::write("initializer list ");
            break;
        }
        case NodeType::NEW:
        {
            Log::write("new ");
            break;
        }
        case NodeType::FUNCTION_IMPLEMENTATION:
        {
            Log::write("function impl '");
            Log::write("" + std::any_cast<string>(currentNode->value) + "' ");
            break;
        }
        case NodeType::FUNCTION_IMPLEMENTATION_ARG:
        {
            Log::write("function impl arg ");
            break;
        }
        case NodeType::FUNCTION_IMPLEMENTATION_RETURN_TYPE:
        {
            Log::write("function impl return type ");
            Log::write("'" + Variable::variableTypeToString((VariableType)std::any_cast<TokenType>(currentNode->value)) + "'");
            break;
        }
        case NodeType::RETURN:
        {
            Log::write("return ");
            break;
        }
        case NodeType::FUNCTION_IMPLEMENTATION_ARGS:
        {
            Log::write("function impl args ");
            break;
        }
        case NodeType::FUNCTION_ARGS:
        {
            Log::write("function args ");
            break;
        }
        case NodeType::STRING_CONST:
        {
            Log::write("string const ");
            Log::write(std::any_cast<string>(currentNode->value));
            break;
        }
        case NodeType::IMPORT:
        {
            Log::write("Import ");
            break;
        }
        case NodeType::EXPORT:
        {
            Log::write("Export ");
            break;
        }
        case NodeType::IMPORT_LIST:
        {
            Log::write("Import List");
            break;
        }
        case NodeType::IMPORT_LIST_ELEMENT:
        {
            Log::write("Import List Element '");
            Log::write(std::any_cast<string>(currentNode->value) + "'");
            break;
        }
        case NodeType::IMPORT_FILE:
        {
            Log::write("Import File Path '");
            Log::write(std::any_cast<string>(currentNode->value) + "'");
            break;
        }
        case NodeType::EXPORT_LIST:
        {
            Log::write("Export List");
            break;
        }
        case NodeType::EXPORT_LIST_ELEMENT:
        {
            Log::write("Export List Element '");
            Log::write(std::any_cast<string>(currentNode->value) + "'");
            break;
        }
    }

    if (currentNode->scopeId() != 4294967295)
    {
        Log::write(" (scope id: " + to_string(currentNode->scopeId()) + ")");
    }

    Log::write("\n");


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
    for (auto& [parentScopeNode, thisScopeNode] : m_allScopeNodes)
    {
        if (thisScopeNode->operand1 != nullptr &&
            (thisScopeNode->operand1->type == NodeType::FOR ||
             thisScopeNode->operand1->type == NodeType::WHILE ||
             thisScopeNode->operand1->type == NodeType::DO_WHILE))
        {
            markBreakContinueOperatorsRecursive(thisScopeNode->operand1, thisScopeNode->scopeId());
        }
    }
}

void stc::Ast::markBreakContinueOperatorsRecursive(stc::Node* currentNode, size_t currentScopeId)
{
    if (currentNode == nullptr)
        return;

    // if there is another cycle in the cycle, then you do not need to enter it
    if (currentNode->type == NodeType::FOR ||
        currentNode->type == NodeType::WHILE ||
        currentNode->type == NodeType::DO_WHILE)
    {
        return;
    }

    if (currentNode->type == NodeType::BREAK ||
        currentNode->type == NodeType::CONTINUE)
    {
        currentNode->scopeId(currentScopeId);
    }


    markBreakContinueOperatorsRecursive(currentNode->operand1, currentScopeId);
    markBreakContinueOperatorsRecursive(currentNode->operand2, currentScopeId);
    markBreakContinueOperatorsRecursive(currentNode->operand3, currentScopeId);
    markBreakContinueOperatorsRecursive(currentNode->operand4, currentScopeId);
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
            identifyFunctionArgumentsRecursive(stmt->operand1, types, variables);

            markReturnOperatorRecursive(stmt->operand1->operand3, stmt->scopeId(), function_name, types);
        }
    }
}

void stc::Ast::markReturnOperatorRecursive(stc::Node* currentNode, size_t currentScopeId,
                                           const string& currentFunctionName, const vector<VariableType>& arguments)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION)
        return;


    if (currentNode->type == NodeType::RETURN)
    {
        currentNode->scopeId(currentScopeId);

        size_t sizeOfArguments = m_functions.get(currentFunctionName, arguments)->argumentsSize();

        currentNode->value = sizeOfArguments;
    }


    markReturnOperatorRecursive(currentNode->operand1, currentScopeId, currentFunctionName, arguments);
    markReturnOperatorRecursive(currentNode->operand2, currentScopeId, currentFunctionName, arguments);
    markReturnOperatorRecursive(currentNode->operand3, currentScopeId, currentFunctionName, arguments);
    markReturnOperatorRecursive(currentNode->operand4, currentScopeId, currentFunctionName, arguments);
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
    for (auto& [_, thisScopeNode] : m_allScopeNodes)
    {
        checkConstantsRecursive(thisScopeNode->operand1, thisScopeNode);
    }
}

void stc::Ast::checkConstantsRecursive(stc::Node* currentNode, stc::Node* currentScopeNode)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::STATEMENT)
        return;

    if (currentNode->type == NodeType::SET)
    {
        auto op1 = currentNode->operand1;
        auto op2 = currentNode->operand2;

        if (op1->type == NodeType::USING_VARIABLE)
        {
            auto variable_name = std::any_cast<string>(op1->value);
            auto variable = currentScopeNode->variables->getByName(variable_name);

            if (variable->isConst())
            {
                error("Assignment to a constant '" + variable_name + "'!");
            }
        }
    }

    if (currentNode->type == NodeType::EXPRESSION && currentNode->operand1 != nullptr &&
        currentNode->operand1->type == NodeType::CONSTANT_DECLARATION)
    {
        error("The constant '" + std::any_cast<string>(currentNode->operand1->value) +
              "' must be initialized when defining!");
    }


    checkConstantsRecursive(currentNode->operand1, currentScopeNode);
    checkConstantsRecursive(currentNode->operand2, currentScopeNode);
    checkConstantsRecursive(currentNode->operand3, currentScopeNode);
    checkConstantsRecursive(currentNode->operand4, currentScopeNode);
}

void stc::Ast::checkArray()
{
    for (auto& [_, thisScopeNode] : m_allScopeNodes)
    {
        check_array_recursive(thisScopeNode->operand1);
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
    identifyFunctionsRecursive(m_allScopeNodes[0].second->operand1);
}

void stc::Ast::identifyFunctionsRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION)
    {
        auto functionName = any_cast<string>(currentNode->value);
        auto type = Variable::variableTypeFromTokenType(any_cast<TokenType>(currentNode->operand1->value));


        vector<VariableType> argumentTypes;
        vector<Variable*> arguments;
        identifyFunctionArgumentsRecursive(currentNode->operand2, argumentTypes, arguments);


        size_t localVariableSize = 0;
        vector<Variable*> variables;
        identifyFunctionLocalVariablesRecursive(currentNode->operand3, localVariableSize, variables);

        auto newFunction = new Function(functionName, type, argumentTypes, currentNode, localVariableSize, arguments, variables);

        m_functions.add(newFunction);
    }

    identifyFunctionsRecursive(currentNode->operand1);
    identifyFunctionsRecursive(currentNode->operand2);
}

void stc::Ast::identifyFunctionArgumentsRecursive(stc::Node* currentNode, vector<VariableType>& argumentTypes,
                                                  vector<Variable*>& arguments)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::FUNCTION_IMPLEMENTATION_ARG)
    {
        auto argumentName = any_cast<string>(currentNode->value);
        auto scopeId = currentNode->scopeId();
        auto variable = m_allVariables.getByNameAndScopeId(argumentName, scopeId);


        auto type = variable->type();
        argumentTypes.push_back(type);


        variable->isArgument(true);

        arguments.push_back(variable);
    }

    identifyFunctionArgumentsRecursive(currentNode->operand1, argumentTypes, arguments);
    identifyFunctionArgumentsRecursive(currentNode->operand2, argumentTypes, arguments);
}

void stc::Ast::identifyFunctionLocalVariablesRecursive(stc::Node* currentNode, size_t& size,
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
        auto variableName = any_cast<string>(currentNode->value);
        auto scopeId = currentNode->scopeId();
        auto variable = m_allVariables.getByNameAndScopeId(variableName, scopeId);


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

        auto variableSize = Variable::typeSizeInByte(type);

        if (!Variable::isArrayType(type))
        {
            size += variableSize;
        }

        variables.push_back(variable);
        return;
    }


    identifyFunctionLocalVariablesRecursive(currentNode->operand1, size, variables);
    identifyFunctionLocalVariablesRecursive(currentNode->operand2, size, variables);
    identifyFunctionLocalVariablesRecursive(currentNode->operand3, size, variables);
    identifyFunctionLocalVariablesRecursive(currentNode->operand4, size, variables);
}



void stc::Ast::checkFunctionsCall()
{
    checkFunctionsCallRecursive(m_root);
}

void stc::Ast::checkFunctionsCallRecursive(stc::Node* currentNode)
{
    if (currentNode == nullptr)
        return;


    if (currentNode->type == NodeType::FUNCTION_CALL)
    {
        auto functionName = any_cast<string>(currentNode->value);

        vector<VariableType> types;
        identifyFunctionCallArgumentsRecursive(currentNode->operand1, types);


        if (!m_globalFunctions.contains(functionName))
        {
            m_functions.get(functionName, types);
        }
    }

    checkFunctionsCallRecursive(currentNode->operand1);
    checkFunctionsCallRecursive(currentNode->operand2);
    checkFunctionsCallRecursive(currentNode->operand3);
    checkFunctionsCallRecursive(currentNode->operand4);
}

void stc::Ast::identifyFunctionCallArgumentsRecursive(stc::Node* currentNode,
                                                      std::vector<stc::VariableType>& arguments)
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


        arguments.push_back(type);
    }

    identifyFunctionCallArgumentsRecursive(currentNode->operand1, arguments);
    identifyFunctionCallArgumentsRecursive(currentNode->operand2, arguments);
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
        auto functionName = any_cast<string>(currentNode->value);

        vector<VariableType> types;
        identifyFunctionCallArgumentsRecursive(currentNode->operand1, types);

        Function* function = nullptr;

        if (!m_globalFunctions.contains(new Function(functionName, VariableType::UNDEFINED, types)))
        {
            function = m_functions.get(functionName, types);
        }
        else
        {
            function = m_globalFunctions.get(functionName, types);
        }

        type = function->returnType();
        return;
    }
    else if (currentNode->type == NodeType::NEW)
    {
        currentNode = currentNode->operand1;

        auto functionName = any_cast<string>(currentNode->value);
        vector<VariableType> types;

        identifyFunctionCallArgumentsRecursive(currentNode, types);

        Function* function = nullptr;

        if (!m_globalFunctions.contains(new Function(functionName, VariableType::ANY, types, nullptr)))
        {
            function = m_functions.get(functionName, types);
        }
        else
        {
            function = m_globalFunctions.get(functionName, types);
        }

        type = function->returnType();
        return;
    }
    else if (currentNode->type == NodeType::INITIALIZER)
    {
        type = VariableType::ANY;
        return;
    }
    else if (currentNode->type == NodeType::INDEX_CAPTURE)
    {
        auto arrayName = any_cast<string>(currentNode->operand1->value);
        auto scopeId = currentNode->operand1->scopeId();
        auto arrayType = m_allVariables.getByName(arrayName)->type();

        type = Variable::typeOfArrayType(arrayType);
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
        auto variableName = any_cast<string>(currentNode->value);
        auto variableScopeId = currentNode->scopeId();

        auto variable = m_allVariables.getByNameAndScopeId(variableName, variableScopeId);

        return variable->type();
    }
    else if (currentNode->type == NodeType::INDEX_CAPTURE)
    {
        auto variableName = any_cast<string>(currentNode->operand1->value);
        auto variableScopeId = currentNode->operand1->scopeId();

        auto variable = m_allVariables.getByNameAndScopeId(variableName, variableScopeId);

        return Variable::typeOfArrayType(variable->type());
    }


    return VariableType::UNDEFINED;
}

void stc::Ast::checkExpression()
{
    checkExpressionRecursive(m_root);
}

void stc::Ast::checkExpressionRecursive(stc::Node* currentNode)
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


    checkExpressionRecursive(currentNode->operand1);
    checkExpressionRecursive(currentNode->operand2);
    checkExpressionRecursive(currentNode->operand3);
    checkExpressionRecursive(currentNode->operand4);
}

void stc::Ast::printVariableTable()
{
    Log::write("-- Started print variable table\n");
    Log::write("{\n");
    m_allVariables.print();
    if (m_allVariables.raw().empty())
    {
        Log::write("   empty\n");
    }
    Log::write("}");
    Log::write("\n");
}

void stc::Ast::printFunctionsTable()
{
    Log::write("-- Started print function table\n");
    Log::write("{\n");
    m_functions.print();
    if (m_functions.raw().empty())
    {
        Log::write("   empty\n");
    }
    Log::write("}");
    Log::write("\n");
}

void stc::Ast::printImportVariableTable()
{
    Log::write("-- Started print import variable table\n");
    Log::write("{\n");
    m_importVariables.print();
    if (m_importVariables.raw().empty())
    {
        Log::write("   empty\n");
    }
    Log::write("}");
    Log::write("\n");
}

void stc::Ast::printImportFunctionsTable()
{
    Log::write("-- Started print import functions table\n");
    Log::write("{\n");
    m_importFunctions.print();
    if (m_importFunctions.raw().empty())
    {
        Log::write("   empty\n");
    }
    Log::write("}");
    Log::write("\n");
}

void stc::Ast::identifyArrays()
{
    identifyArraysRecursive(m_root);
}

void stc::Ast::identifyArraysRecursive(stc::Node* currentNode)
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
                    identifyArrayInitializerListRecursive(initializerNode, arrayValues, arrayValueType);


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
        auto scopeId = currentNode->scopeId();
        auto array_name = any_cast<string>(currentNode->value);
        auto variable = m_allVariables.getByNameAndScopeId(array_name, scopeId);



        auto variableNode = currentNode;
        auto variableTypeNode = variableNode->operand1;
        auto variableType = (VariableType)any_cast<TokenType>(variableTypeNode->value);

        auto variableName = any_cast<string>(variableNode->value);

        if (Variable::isArrayType(variableType))
        {
            m_arrays.push_back(Array(variableName, 0, {}, variable));
        }
    }


    identifyArraysRecursive(currentNode->operand1);
    identifyArraysRecursive(currentNode->operand2);
    identifyArraysRecursive(currentNode->operand3);
    identifyArraysRecursive(currentNode->operand4);
}

void stc::Ast::identifyArrayInitializerListRecursive(Node* currentNode, vector<VariableValue>& list, VariableType arrayType)
{
    if (currentNode == nullptr)
        return;

    if (currentNode->type == NodeType::INITIALIZER_LIST)
    {
        auto variableType = VariableType::UNDEFINED;
        giveExpressionTypeRecursive(currentNode->operand2, variableType);


        auto valueNode = currentNode->operand2;

        auto rawValueNode = valueNode;
        if (valueNode->type == NodeType::UNARY_MINUS ||
            valueNode->type == NodeType::UNARY_PLUS ||
            valueNode->type == NodeType::UNARY_EXCLAMATION)
        {
            valueNode = valueNode->operand1;
        }


        if (!Variable::isTypesReducible(variableType, arrayType))
        {
            string lvalue_type_str = Variable::variableTypeToString(variableType);
            string expression_type_str = Variable::variableTypeToString(arrayType);

            error("Type '" + lvalue_type_str + "' is not assignable to type '" + expression_type_str + "'!");
        }

        VariableValue value;

        switch (variableType)
        {
            case VariableType::NUMBER:
            {
                auto tempValue = any_cast<number>(valueNode->value);

                if (rawValueNode->type == NodeType::UNARY_MINUS)
                {
                    tempValue *= -1;
                }

                value = tempValue;
                break;
            }
            case VariableType::BOOLEAN:
            {
                value = (bool)any_cast<int>(valueNode->value);

                auto temp_value = (bool)any_cast<int>(valueNode->value);

                if (rawValueNode->type == NodeType::UNARY_EXCLAMATION)
                {
                    temp_value = !temp_value;
                }

                value = temp_value;
                break;
            }
            case VariableType::STRING:
            {
                value = any_cast<string>(valueNode->value);
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


    identifyArrayInitializerListRecursive(currentNode->operand1, list, arrayType);
    identifyArrayInitializerListRecursive(currentNode->operand2, list, arrayType);
    identifyArrayInitializerListRecursive(currentNode->operand3, list, arrayType);
}

void stc::Ast::print() const noexcept
{
    Log::write("-- Started print AST\n");

    print(m_root, 0);

    Log::write("\n\n");
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


        auto icm = new ICM(path.string(), "", m_debugMode);

        icm->compile(false, false, false, true);

        auto ast = icm->ast();
        const auto& astExportTables = ast->exportTable();

        vector<string> extendedImportNames;
        for (const auto& importName : importNames)
        {
            if (!astExportTables.contains(importName))
            {
                error("Module '\"" + importFilePath + "\"' not exported '" + (importName + "'."));
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